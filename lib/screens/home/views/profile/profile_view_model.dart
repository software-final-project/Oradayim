import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:geolocator/geolocator.dart' as geo;

import '../../../../core/base/viewmodels/base_view_model.dart';
import '../../../auth/services/auth_service.dart';

class ProfileViewModel extends BaseViewModel {
  late geo.Position _currentPosition;
  late MapboxMap _controller;
  final AuthService _authService = AuthService();
   Position currentCameraPosition  = Position(41.2332678, 29.0491012);

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

  // Harita oluşturulduğunda çağrılan fonksiyon
  void onMapCreated(MapboxMap controller) {
    _controller = controller;
  }

  @override
  Future<void> init() async {
    // Profil sayfası için initial işlemler)
    //await _getCurrentPosition();
  }

  Future<void> _getCurrentPosition() async {
    isLoading = true;
   try {
     bool serviceEnabled;
     geo.LocationPermission permission;

     // Konum servisinin aktif olup olmadığını kontrol et
     serviceEnabled = await geo.Geolocator.isLocationServiceEnabled();
     if (!serviceEnabled) {
       throw Exception('Konum servisi aktif değil.');
     }

     // İzin kontrolü
     permission = await geo.Geolocator.checkPermission();
     if (permission == geo.LocationPermission.denied) {
       permission = await geo.Geolocator.requestPermission();
       if (permission == geo.LocationPermission.denied) {
         throw Exception('Konum izni reddedildi.');
       }
     }

     if (permission == geo.LocationPermission.deniedForever) {
       throw Exception('Konum izni kalıcı olarak reddedildi.');
     }

     // Geçerli konumu al
     _currentPosition = await geo.Geolocator.getCurrentPosition();

     currentCameraPosition =
         Position(_currentPosition.longitude, _currentPosition.latitude);
   }
   catch(e){}
    finally{
     isLoading = false;
    }
  }

  MapboxMap get controller => _controller;

  geo.Position get currentPosition => _currentPosition;

  set currentPosition(geo.Position value) {
    _currentPosition = value;
    reloadState();
  }
}
