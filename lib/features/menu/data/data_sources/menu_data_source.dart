import 'dart:math';

import 'package:dio/dio.dart';
import 'package:merchant_app/features/menu/data/models/menu_model.dart';
import 'package:merchant_app/features/storeage/token_storage_service.dart';
class MenuDataSource{
  final Dio dio;
  final TokenStorageService tokenStorageService;
  MenuDataSource({required this.dio,required this.tokenStorageService});
  Future<MenuModel> changePassword(String oldPassword,String newPassword) async{
    try{
      final token = await tokenStorageService.getToken();
      dio.options.headers['Authorization']='Bearer $token';
      print('$newPassword$oldPassword');
      final response=await dio.post("http://192.168.1.94:1005/api/v1/auth/changePassword",data: {
        'oldPassword':oldPassword,
        'newPassword':newPassword
      });
      print('res $response');
       if(response.statusCode ==200){
        return MenuModel.fromJson(response.data);
       }else{
        throw Exception('password change error');
       }
    }catch(e){
      print('$e');
     throw Exception(e.toString());
    }
  }
}