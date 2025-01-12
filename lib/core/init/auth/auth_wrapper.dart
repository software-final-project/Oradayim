import 'package:flutter/material.dart';
import '../../../screens/auth/views/login/login_view.dart';
import '../../../screens/home/home_screen.dart';
import 'viewmodel/auth_view_model.dart';
import 'package:oradayim/core/base/views/base_view.dart';


class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return  BaseView<AuthViewModel>(vmBuilder:  (context) =>  AuthViewModel(), builder: _buildScreenContent, initializeBuilder: _initializeBuilder,);
  }

  Widget _buildScreenContent(BuildContext context, AuthViewModel viewModel) {
    return viewModel.user != null ? const HomeScreen() : const LoginView();
  }

  Widget _initializeBuilder(BuildContext context, AuthViewModel viewModel) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
} 