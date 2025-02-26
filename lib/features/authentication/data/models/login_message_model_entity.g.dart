// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_message_model_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginMessageModelEntity _$LoginMessageModelEntityFromJson(
        Map<String, dynamic> json) =>
    LoginMessageModelEntity(
      isNew: json['isNew'] as bool?,
      token: json['token'] as String,
      refreshToken: json['refreshToken'] as String,
      merchantName: json['merchantName'] as String,
      merchantAccountNumber: json['merchantAccountNumber'] as String,
      merchantAddress: json['merchantAddress'] as String,
      merchantId: json['merchantId'] as String,
      merchantCategoryCode: json['merchantCategoryCode'] as String,
      merchantPhone: json['merchantPhone'] as num,
      tinNumber: json['tinNumber'] as String,
      cashierName: json['cashierName'] as String,
      cashierBranch: json['cashierBranch'] as String,
      cashierPhone: json['cashierPhone'] as num,
      storeLabel: json['storeLabel'] as String,
      tillId: json['tillId'] as String,
    );

Map<String, dynamic> _$LoginMessageModelEntityToJson(
        LoginMessageModelEntity instance) =>
    <String, dynamic>{
      'isNew': instance.isNew,
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'merchantName': instance.merchantName,
      'merchantAccountNumber': instance.merchantAccountNumber,
      'merchantAddress': instance.merchantAddress,
      'merchantId': instance.merchantId,
      'merchantCategoryCode': instance.merchantCategoryCode,
      'merchantPhone': instance.merchantPhone,
      'tinNumber': instance.tinNumber,
      'cashierName': instance.cashierName,
      'cashierBranch': instance.cashierBranch,
      'cashierPhone': instance.cashierPhone,
      'storeLabel': instance.storeLabel,
      'tillId': instance.tillId,
    };
