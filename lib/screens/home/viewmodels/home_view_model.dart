import '../../../core/base/viewmodels/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  int _currentIndex = 0;
  
  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  @override
  Future<void> init() async {
    // İnitial işlemler burada yapılabilir
  }
} 