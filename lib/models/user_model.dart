import 'package:oradayim/models/location_model.dart';

class UserModel {
  dynamic userId;
  LocationModel location;
  String userEmail;
  String userFullName;
  String userImageUrl;
  int coinCount;
  int likeCount;
  List<dynamic> savedBusiness;
  List<dynamic> visitedBusiness;
  List<dynamic> friends;
  DateTime? lastLogged;

  UserModel({
    this.userId,
    required this.location,
    required this.userEmail,
    required this.userFullName,
    required this.userImageUrl,
    this.coinCount = 200,
    this.likeCount = 0,
    this.savedBusiness = const [],
    this.visitedBusiness = const [],
    this.friends = const [],
    this.lastLogged,
  });

  // UserModel -> Map
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'location': location.toMap(),
      'userEmail': userEmail,
      'userFullName': userFullName,
      'userImageUrl': userImageUrl,
      'coinCount': coinCount,
      'likeCount': likeCount,
      'savedBusiness': savedBusiness,
      'visitedBusiness': visitedBusiness,
      'friends': friends,
      'lastLogged': lastLogged?.toIso8601String(),
    };
  }

  // Map -> UserModel
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'],
      location: LocationModel.fromMap(map['location']),
      userEmail: map['userEmail'] ?? '',
      userFullName: map['userFullName'] ?? '',
      userImageUrl: map['userImageUrl'] ?? '',
      coinCount: map['coinCount'] ?? 200,
      likeCount: map['likeCount'] ?? 0,
      savedBusiness: List<dynamic>.from(map['savedBusiness'] ?? []),
      visitedBusiness: List<dynamic>.from(map['visitedBusiness'] ?? []),
      friends: List<dynamic>.from(map['friends'] ?? []),
      lastLogged: map['lastLogged'] != null
          ? DateTime.parse(map['lastLogged'])
          : null,
    );
  }
}
