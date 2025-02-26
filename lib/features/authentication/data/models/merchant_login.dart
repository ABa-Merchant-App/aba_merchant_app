import 'package:json_annotation/json_annotation.dart';
part 'merchant_login.g.dart';
@JsonSerializable()
class MerchantLoginModel{
  String username;
  String password;
  MerchantLoginModel({required this.username,required this.password});
  factory MerchantLoginModel.fromJson(Map<String,dynamic> json)=>_$MerchantLoginModelFromJson(json);
  Map<String,dynamic> toJson()=>_$MerchantLoginModelToJson(this);

}