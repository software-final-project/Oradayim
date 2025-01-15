class BaseService {
  bool isSuccess;
  String? message;
  dynamic data;

  BaseService(
      {required this.isSuccess, required this.message, required this.data});
}
