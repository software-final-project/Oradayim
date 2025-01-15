import 'location_model.dart';
import 'major_model.dart';

class BusinessModel {
  String businessId;
  String businessImage;
  String businessName;
  String description;
  LocationModel location;
  int reviewRating;
  String telNumber;
  int visitedUserCount;
  String websiteLink;
  Map<String, dynamic> workTimes;
  Map<dynamic, int> visitCounts; // Kullanıcı bazında ziyaret sayıları
  MajorModel? major; // İşletmenin major'u

  BusinessModel({
    required this.businessId,
    required this.businessImage,
    required this.businessName,
    required this.description,
    required this.location,
    required this.reviewRating,
    required this.telNumber,
    required this.visitedUserCount,
    required this.websiteLink,
    required this.workTimes,
    this.visitCounts = const {},
    this.major,
  });

  // fromMap method
  factory BusinessModel.fromMap(Map<String, dynamic> map) {
    return BusinessModel(
      businessId: map['businessId'] ?? '',
      businessImage: map['businessImage'] ?? '',
      businessName: map['businessName'] ?? '',
      description: map['description'] ?? '',
      location: LocationModel.fromMap(map['location'] ?? {}),
      reviewRating: map['reviewRating'] ?? 0,
      telNumber: map['telNumber'] ?? '',
      visitedUserCount: map['visitedUserCount'] ?? 0,
      websiteLink: map['websiteLink'] ?? '',
      workTimes: Map<String, dynamic>.from(map['workTimes'] ?? {}),
      visitCounts: Map<dynamic, int>.from(map['visitCounts'] ?? {}),
      major: map['major'] != null
          ? MajorModel.fromMap(map['major'])
          : null,
    );
  }

  // toMap method
  Map<String, dynamic> toMap() {
    return {
      'businessId': businessId,
      'businessImage': businessImage,
      'businessName': businessName,
      'description': description,
      'location': location.toMap(),
      'reviewRating': reviewRating,
      'telNumber': telNumber,
      'visitedUserCount': visitedUserCount,
      'websiteLink': websiteLink,
      'workTimes': workTimes,
      'visitCounts': visitCounts,
      'major': major?.toMap(),
    };
  }
}
