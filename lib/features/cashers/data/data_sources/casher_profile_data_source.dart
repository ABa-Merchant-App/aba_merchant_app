import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:merchant_app/features/cashers/data/models/casher_profile_model.dart';

class CasherProfileDataSource{
  final Dio dio;
  CasherProfileDataSource({required this.dio});
   Future<CasherProfileModel> getCasherInfo(String userName) async {
    try{
    final response = await dio.post(
        'http://192.168.1.94:1005/api/v1/auth/getCashierInfo',
        data: {'userName': userName},);
       debugPrint('Mock Response Data: ${response.data}', wrapWidth: 1024);
        if(response.statusCode == 200){
         return CasherProfileModel.fromJson(response.data);
        }else{
          throw Exception('not casher data available');
        }
    }catch(e){
     if (e is DioError) {
        if (e.response != null) {
          print('Response data: ${e.response}');
           throw Exception('Failed to login: ${e.message}');
        }
      } else {
      }
      throw Exception('Failed to login: $e');
    }
  }
}