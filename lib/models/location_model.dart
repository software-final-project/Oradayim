class LocationModel{
  String city;
  String country;
  String district;
  String locality;
  String street;
  String postalCode;

  LocationModel({
    required this.city,
    required this.country,
    required this.locality,
    required this.district,
    required this.postalCode,
    required this.street,
  });

  // Location -> Map
  Map<String, dynamic> toMap() {
    return {
      'city': city,
      'country': country,
      'district': district,
      'locality': locality,
      'street': street,
      'postalCode': postalCode,
    };
  }

  // Map -> Location
  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      city: map['city'] ?? '',
      country: map['country'] ?? '',
      district: map['district'] ?? '',
      locality: map['locality'] ?? '',
      street: map['street'] ?? '',
      postalCode: map['postalCode'] ?? '',
    );
  }
}