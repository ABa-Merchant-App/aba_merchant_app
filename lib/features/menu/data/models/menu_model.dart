import 'package:json_annotation/json_annotation.dart';
part 'menu_model.g.dart';
@JsonSerializable()
class MenuModel{
  final String oldPassword;
  final String newPassword;
  MenuModel({required this.oldPassword,required this.newPassword});
  factory MenuModel.fromJson(Map<String,dynamic> json)=>_$MenuModelFromJson(json);
  Map<String,dynamic> toJson()=>_$MenuModelToJson(this);
}