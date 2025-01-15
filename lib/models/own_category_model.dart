class OwnCategoryModel {
  dynamic categoryId;
  int categoryCount;

  OwnCategoryModel({
    required this.categoryCount,
    required this.categoryId,
  });

  // fromMap method
  factory OwnCategoryModel.fromMap(Map<String, dynamic> map) {
    return OwnCategoryModel(
      categoryCount: map['categoryCount'] ?? 0,
      categoryId: map['categoryId'] ?? '',
    );
  }

  // toMap method
  Map<String, dynamic> toMap() {
    return {
      'categoryCount': categoryCount,
      'categoryId': categoryId,
    };
  }
}
