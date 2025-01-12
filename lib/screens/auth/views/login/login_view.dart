import 'package:flutter/material.dart';
import 'package:oradayim/utils/navigation_util.dart';
import '../../../../core/base/views/base_view.dart';
import '../register/register_view.dart';
import '../../viewmodels/login/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      vmBuilder: (context) => LoginViewModel(),
      builder: (context, viewModel) => Scaffold(
        appBar: AppBar(
          title: const Text('Giriş Yap'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: viewModel.emailController,
                decoration: const InputDecoration(
                  labelText: 'E-posta',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: viewModel.passwordController,
                decoration: const InputDecoration(
                  labelText: 'Şifre',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                onEditingComplete: () async {
                  // Klavyeyi kapat
                  FocusScope.of(context).unfocus();
                  // Giriş yap
                  await viewModel.login(context);
                },
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: viewModel.isLoading 
                  ? null 
                  : () async {
                      // Klavyeyi kapat
                      FocusScope.of(context).unfocus();
                      await viewModel.login(context);
                    },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: viewModel.isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        )
                      : const Text('Giriş Yap'),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: viewModel.isLoading
                    ? null
                    : () {
                        NavigationUtils.navigateToRegisterScreen(context);
                      },
                child: const Text('Hesabın yok mu? Kayıt ol'),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 