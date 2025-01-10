import 'package:flutter/material.dart';
import '../../../../core/base/views/base_view.dart';
import 'check_in_view_model.dart';

class CheckInView extends StatelessWidget {
  const CheckInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<CheckInViewModel>(
      vmBuilder: (context) => CheckInViewModel(),
      builder: (context, viewModel) => Scaffold(
        appBar: AppBar(
          title: const Text('Check-in'),
        ),
        body: const Center(
          child: Text('Check-in Sayfası'),
        ),
      ),
    );
  }
}
