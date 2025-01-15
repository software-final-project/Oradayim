class MajorModel {
  String count;
  DateTime majorTime;
  dynamic mayorId;

  MajorModel({
    required this.count,
    required this.majorTime,
    required this.mayorId,
  });

  // fromMap method
  factory MajorModel.fromMap(Map<String, dynamic> map) {
    return MajorModel(
      count: map['count'] ?? '',
      majorTime: DateTime.parse(map['majorTime']),
      mayorId: map['mayorId'] ?? '',
    );
  }

  // toMap method
  Map<String, dynamic> toMap() {
    return {
      'count': count,
      'majorTime': majorTime.toIso8601String(),
      'mayorId': mayorId,
    };
  }
}
