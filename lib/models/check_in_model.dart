class CheckInModel {
  dynamic checkInId;
  dynamic businessId;
  dynamic categoriesId;
  String checkInDescription;
  String checkInImageUrl;
  DateTime checkInTime;
  int winCoin;

  CheckInModel({
    required this.businessId,
    required this.categoriesId,
    required this.checkInDescription,
    required this.checkInId,
    required this.checkInImageUrl,
    required this.checkInTime,
    required this.winCoin,
  });

  // fromMap method
  factory CheckInModel.fromMap(Map<String, dynamic> map) {
    return CheckInModel(
      businessId: map['businessId'],
      categoriesId: map['categoriesId'],
      checkInDescription: map['checkInDescription'] ?? '',
      checkInId: map['checkInId'] ?? '',
      checkInImageUrl: map['checkInImageUrl'] ?? '',
      checkInTime: DateTime.parse(map['checkInTime']),
      winCoin: map['winCoin'] ?? 0,
    );
  }

  // toMap method
  Map<String, dynamic> toMap() {
    return {
      'businessId': businessId,
      'categoriesId': categoriesId,
      'checkInDescription': checkInDescription,
      'checkInId': checkInId,
      'checkInImageUrl': checkInImageUrl,
      'checkInTime': checkInTime.toIso8601String(),
      'winCoin': winCoin,
    };
  }
}
