
class GetProductsByMerchantEntity{
  final String productName;
  final String productCode;
  final String price;
  final String description;
  final String ingredents;
  final String image;
  final String merchantId;
  final DateTime createdAt;
  final DateTime updatedAt;
  GetProductsByMerchantEntity({
    required this.productName,
    required this.productCode,
    required this.price,
    required this.description,
    required this.ingredents,
    required this.image,
    required this.merchantId,
    required this.createdAt,
    required this.updatedAt
  });
}