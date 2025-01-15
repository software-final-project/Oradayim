import 'package:flutter/material.dart';
import 'package:oradayim/utils/navigation_util.dart';
import '../../../../core/base/viewmodels/base_view_model.dart';
import '../../services/auth_service.dart';

class LoginViewModel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final AuthService _authService = AuthService();

  Future<bool> login(BuildContext context) async {
    if (!_validateInputs(context)) return false;

    try {
      isLoading = true;

      final response = await _authService.login(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.message ?? "null"),
            backgroundColor: response.isSuccess ? Colors.green : Colors.red,
            duration: const Duration(seconds: 2),
          ),
        );
      }

      // Başarılı girişten sonra form temizle
      if (response.isSuccess) {
        emailController.clear();
        passwordController.clear();

        NavigationUtils.navigateToHomeScreen(context);
      }

      isLoading = false;
      return response.isSuccess;
    } catch (e) {
      isLoading = false;
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Beklenmeyen bir hata oluştu: $e'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 2),
          ),
        );
      }
      debugPrint('Login error: $e');
      return false;
    }
  }

  bool _validateInputs(BuildContext context) {
    String? errorMessage;

    if (emailController.text.trim().isEmpty ||
        passwordController.text.isEmpty) {
      errorMessage = 'Tüm alanları doldurun';
    } else if (!emailController.text.contains('@')) {
      errorMessage = 'Geçerli bir e-posta adresi girin';
    }

    if (errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2),
        ),
      );
      return false;
    }

    return true;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Future<void> init() async {
    // Login sayfası için initial işlemler
  }
}
