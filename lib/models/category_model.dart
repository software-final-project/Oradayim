class CategoryModel {
  dynamic categoryId;
  String categoryImage;
  String categoryName;

  CategoryModel({
    required this.categoryId,
    required this.categoryImage,
    required this.categoryName,
  });

  // fromMap method
  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      categoryId: map['categoryId'],
      categoryImage: map['categoryImage'] ?? '',
      categoryName: map['categoryName'] ?? '',
    );
  }

  // toMap method
  Map<String, dynamic> toMap() {
    return {
      'categoryId': categoryId,
      'categoryImage': categoryImage,
      'categoryName': categoryName,
    };
  }
}
