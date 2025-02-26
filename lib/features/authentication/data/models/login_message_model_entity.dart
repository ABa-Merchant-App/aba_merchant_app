
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:merchant_app/features/authentication/domain/entities/user.dart';
part 'login_message_model_entity.g.dart';
@JsonSerializable()
class LoginMessageModelEntity extends Equatable implements User{
  @override
    final bool? isNew;
     @override
  final String token;
   @override
  final String refreshToken;
   @override
  final String merchantName;
   @override
  final String merchantAccountNumber;
   @override
  final String merchantAddress;
   @override
  final String merchantId;
   @override
  final String merchantCategoryCode;
   @override
  final num merchantPhone;
   @override
  final String tinNumber;
   @override
  final String cashierName;
   @override
  final String cashierBranch;
   @override
  final num cashierPhone;
   @override
  final String storeLabel;
   @override
  final String tillId;
   LoginMessageModelEntity({  
    required this.isNew,
    required this.token,
    required this.refreshToken,
    required this.merchantName,
    required this.merchantAccountNumber,
    required this.merchantAddress,
    required this.merchantId,
    required this.merchantCategoryCode,
    required this.merchantPhone,
    required this.tinNumber,
    required this.cashierName,
    required this.cashierBranch,
    required this.cashierPhone,
    required this.storeLabel,
    required this.tillId,});
   factory LoginMessageModelEntity.fromJson(Map<String,dynamic> json)=>_$LoginMessageModelEntityFromJson(json);
   Map<String,dynamic> toJson()=>_$LoginMessageModelEntityToJson(this);
   
    LoginMessageModelEntity copyWith({
    bool? isNew,
    String? token,
    String? refreshToken,
    String? merchantName,
    String? merchantAccountNumber,
    String? merchantAddress,
    String? merchantId,
    String? merchantCategoryCode,
    num? merchantPhone,
    String? tinNumber,
    String? cashierName,
    String? cashierBranch,
    num? cashierPhone,
    String? storeLabel,
    String? tillId,
  }) {
    return LoginMessageModelEntity(
      isNew: isNew ?? this.isNew,
      token: token ?? this.token,
      refreshToken: refreshToken ?? this.refreshToken,
      merchantName: merchantName ?? this.merchantName,
      merchantAccountNumber: merchantAccountNumber ?? this.merchantAccountNumber,
      merchantAddress: merchantAddress ?? this.merchantAddress,
      merchantId: merchantId ?? this.merchantId,
      merchantCategoryCode: merchantCategoryCode ?? this.merchantCategoryCode,
      merchantPhone: merchantPhone ?? this.merchantPhone,
      tinNumber: tinNumber ?? this.tinNumber,
      cashierName: cashierName ?? this.cashierName,
      cashierBranch: cashierBranch ?? this.cashierBranch,
      cashierPhone: cashierPhone ?? this.cashierPhone,
      storeLabel: storeLabel ?? this.storeLabel,
      tillId: tillId ?? this.tillId,
    );
  }
  
 @override
 List<Object?> get props=>[
   token,
  merchantName,
  merchantAccountNumber,
  merchantAddress,
  merchantId,
  merchantCategoryCode,
  merchantPhone,
  cashierName,
   cashierBranch,
  cashierPhone,
  storeLabel,
  tillId
  ];
}