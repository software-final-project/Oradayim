class ProductModel {
  dynamic productId;
  String productName;
  int productPrice;
  double productRating;

  ProductModel({
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.productRating,
  });

  // fromMap method
  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      productId: map['productId'] ?? '',
      productName: map['productName'] ?? '',
      productPrice: map['productPrice'] ?? 0,
      productRating: map['productRating']?.toDouble() ?? 0.0,
    );
  }

  // toMap method
  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'productName': productName,
      'productPrice': productPrice,
      'productRating': productRating,
    };
  }
}
