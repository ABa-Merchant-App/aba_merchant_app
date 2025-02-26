// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_products_by_merchant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProductsByMerchantModel _$GetProductsByMerchantModelFromJson(
        Map<String, dynamic> json) =>
    GetProductsByMerchantModel(
      productName: json['ProductName'] as String,
      productCode: json['ProductCode'] as String,
      price: json['Price'] as String,
      description: json['Description'] as String,
      ingredents: json['Ingredents'] as String,
      image: json['Image'] as String,
      merchantId: json['merchantId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$GetProductsByMerchantModelToJson(
        GetProductsByMerchantModel instance) =>
    <String, dynamic>{
      'ProductName': instance.productName,
      'ProductCode': instance.productCode,
      'Price': instance.price,
      'Description': instance.description,
      'Ingredents': instance.ingredents,
      'Image': instance.image,
      'merchantId': instance.merchantId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
