import '../../../../core/base/viewmodels/base_view_model.dart';
import '../../../auth/services/auth_service.dart';

class ProfileViewModel extends BaseViewModel {
  final AuthService _authService = AuthService();

  Future<void> logout() async {
    try {
      isLoading = true;
      await _authService.logout();
      isLoading = false;
    } catch (e) {
      isLoading = false;
      rethrow;
    }
  }

  @override
  Future<void> init() async {
    // Profil sayfası için initial işlemler
  }
} 