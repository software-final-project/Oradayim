import 'package:flutter/material.dart';
import '../../../../core/base/views/base_view.dart';
import '../../../auth/views/login/login_view.dart';
import 'profile_view_model.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileViewModel>(
      vmBuilder: (context) => ProfileViewModel(),
      builder: (context, viewModel) => Scaffold(
        appBar: AppBar(
          title: const Text('Profil'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                await viewModel.logout();
                if (context.mounted) {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const LoginView(),
                    ),
                    (route) => false,
                  );
                }
              },
            ),
          ],
        ),
        body: const Center(
          child: Text('Profil Sayfası'),
        ),
      ),
    );
  }
}
