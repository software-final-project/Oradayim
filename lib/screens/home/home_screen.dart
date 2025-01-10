import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/base/views/base_view.dart';
import 'viewmodels/home_view_model.dart';
import 'views/search/search_view.dart';
import 'views/check_in/check_in_view.dart';
import 'views/profile/profile_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      vmBuilder: (context) => HomeViewModel(),
      builder: (context, viewModel) => Scaffold(
        body: IndexedStack(
          index: viewModel.currentIndex,
          children: const [
            SearchView(),
            CheckInView(),
            ProfileView(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: viewModel.currentIndex,
          onTap: viewModel.setCurrentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Keşfet',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_location),
              label: 'Check-in',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}
