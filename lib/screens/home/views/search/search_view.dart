import 'package:flutter/material.dart';
import '../../../../core/base/views/base_view.dart';
import 'search_view_model.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SearchViewModel>(
      vmBuilder: (context) => SearchViewModel(),
      builder: (context, viewModel) => Scaffold(
        appBar: AppBar(
          title: const Text('Keşfet'),
        ),
        body: const Center(
          child: Text('Keşfet Sayfası'),
        ),
      ),
    );
  }
}
