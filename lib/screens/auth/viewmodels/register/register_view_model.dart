import 'package:flutter/material.dart';
import '../../../../core/base/viewmodels/base_view_model.dart';
import '../../services/auth_service.dart';

class RegisterViewModel extends BaseViewModel {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  
  final AuthService _authService = AuthService();

  Future<bool> register(BuildContext context) async {
    if (!_validateInputs(context)) return false;

    try {
      isLoading = true;
      
      final (success, message) = await _authService.register(
        email: emailController.text.trim(),
        password: passwordController.text,
        name: nameController.text.trim(),
        surname: surnameController.text.trim(),
      );

      isLoading = false;
      
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: success ? Colors.green : Colors.red,
            duration: const Duration(seconds: 2),
          ),
        );
      }
      
      return success;
    } catch (e) {
      isLoading = false;
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Beklenmeyen bir hata oluştu: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
      debugPrint('Register error: $e');
      return false;
    }
  }

  bool _validateInputs(BuildContext context) {
    String? errorMessage;

    if (nameController.text.trim().isEmpty ||
        surnameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      errorMessage = 'Tüm alanları doldurun';
    } else if (passwordController.text != confirmPasswordController.text) {
      errorMessage = 'Şifreler eşleşmiyor';
    } else if (!emailController.text.contains('@')) {
      errorMessage = 'Geçerli bir e-posta adresi girin';
    } else if (passwordController.text.length < 6) {
      errorMessage = 'Şifre en az 6 karakter olmalıdır';
    }

    if (errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }

    return true;
  }

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Future<void> init() async {
    // Register sayfası için initial işlemler
  }
} 