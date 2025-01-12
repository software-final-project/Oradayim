import 'dart:async';
import 'package:flutter/material.dart';

abstract class BaseViewModel extends ChangeNotifier {
  BuildContext? _context;
  bool _isLoading = false;
  bool _isDisposed = false;
  bool _isInitializeDone = false;

  FutureOr<void> _initState;

  BaseViewModel();

  FutureOr<void> init();

  void setContext(BuildContext context) {
    _context = context;
    _init();
  }

  void _init() async {
    isLoading = true;
    _initState = init();
    await _initState;
    _isInitializeDone = true;
    isLoading = false;
  }

  void changeStatus() => isLoading = !isLoading;

  void reloadState() {
    if (!isLoading) notifyListeners();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  //Getters
  FutureOr<void> get initState => _initState;
  BuildContext? get context => _context;

  bool get isLoading => _isLoading;
  bool get isDisposed => _isDisposed;
  bool get isInitialized => _isInitializeDone;

  //Setters
  set isLoading(bool value) {
    _isLoading = value;
    scheduleMicrotask(() {
      if (!_isDisposed) notifyListeners();
    });
  }
}