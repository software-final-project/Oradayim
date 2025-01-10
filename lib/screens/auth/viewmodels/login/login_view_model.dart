import 'package:flutter/material.dart';
import '../../../../core/base/viewmodels/base_view_model.dart';
import '../../services/auth_service.dart';

class LoginViewModel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  final AuthService _authService = AuthService();

  Future<bool> login() async {
    if (!_validateInputs()) return false;

    try {
      isLoading = true;
      
      final result = await _authService.login(
        email: emailController.text,
        password: passwordController.text,
      );

      isLoading = false;
      return result.$1;
    } catch (e) {
      isLoading = false;
      debugPrint('Giriş hatası: $e');
      return false;
    }
  }

  bool _validateInputs() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      debugPrint('Tüm alanları doldurun');
      return false;
    }

    if (!emailController.text.contains('@')) {
      debugPrint('Geçerli bir e-posta adresi girin');
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