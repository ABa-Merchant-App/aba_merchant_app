import 'package:json_annotation/json_annotation.dart';
part 'get_products_by_merchant_model.g.dart';
@JsonSerializable()
class GetProductsByMerchantModel{
  @JsonKey(name: 'ProductName')
  final String productName;

  @JsonKey(name: 'ProductCode')
  final String productCode;

  @JsonKey(name: 'Price')
  final String price;

  @JsonKey(name: 'Description')
  final String description;

  @JsonKey(name: 'Ingredents')
  final String ingredents;

  @JsonKey(name: 'Image')
  final String image;

  @JsonKey(name: 'merchantId')
  final String merchantId;

  @JsonKey(name: 'createdAt')
  final DateTime createdAt;

  @JsonKey(name: 'updatedAt')
  final DateTime updatedAt;
  GetProductsByMerchantModel({
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
  factory GetProductsByMerchantModel.fromJson(Map<String,dynamic> json)=>_$GetProductsByMerchantModelFromJson(json);
  Map<String,dynamic> toJson()=>_$GetProductsByMerchantModelToJson(this);
}