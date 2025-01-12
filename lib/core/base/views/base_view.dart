import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/circular_progress_indicator_widget.dart';
import '../viewmodels/base_view_model.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final T Function(BuildContext)? vmBuilder;
  final Widget Function(BuildContext, T)? initializeBuilder;
  final Widget Function(BuildContext, T) builder;
  final bool useValue;

  const BaseView({
    super.key,
    required this.vmBuilder,
    required this.builder,
    this.useValue = false,
    this.initializeBuilder,
  });

  @override
  State<BaseView<T>> createState() => _BaseViewState();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  @override
  Widget build(BuildContext context) {
    if (widget.useValue) {
      return ChangeNotifierProvider<T>.value(
        value: widget.vmBuilder!(context),
        child: Consumer<T>(
          builder: (context, viewModel, child) {
            viewModel.setContext(context);
            return _buildScreenContent(context, viewModel, child);
          },
        ),
      );
    } else {
      return ChangeNotifierProvider<T>(
        create: (context) {
          final vm = widget.vmBuilder!(context);
          vm.setContext(context);
          return vm;
        },
        child: Consumer<T>(
          builder: _buildScreenContent,
        ),
      );
    }
  }

  Widget _buildScreenContent(BuildContext context, T viewModel, Widget? child) {
    if (!viewModel.isInitialized) {
      return widget.initializeBuilder?.call(context, viewModel) ??
          const CircularProgressIndicatorWidget();
    }

    return Stack(
      children: [
        widget.builder(context, viewModel),
        if (viewModel.isLoading)
          const CircularProgressIndicatorWidget(),
      ],
    );
  }
}