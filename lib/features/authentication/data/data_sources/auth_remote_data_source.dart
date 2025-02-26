import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:merchant_app/features/storeage/token_storage_service.dart';
import 'package:merchant_app/features/authentication/data/models/login_message_model_entity.dart';
class AuthRemoteDataSource {
  final Dio dio;
  final TokenStorageService newToken;
  AuthRemoteDataSource({required this.dio,required this.newToken}){
      dio.options = BaseOptions(
      connectTimeout: Duration(seconds: 5),  // 5 seconds
      receiveTimeout: Duration(seconds: 5),   // 5 seconds
      sendTimeout: Duration(seconds: 5),      // 5 seconds
    );
  }

  Future<LoginMessageModelEntity> login(String userName, String password) async {
    try {
      debugPrint("sending request");
      final response = await dio.post(
        'http://192.168.1.94:1005/api/v1/auth/login',
        data: {
          'userName': userName,
          'password': password,
        },
      );
       debugPrint("Response ${response.data}");
      if (response.statusCode == 200) {
         await newToken.saveToken(response.data['data']['token']);
        return LoginMessageModelEntity.fromJson(response.data['data']);
      } else {
        throw Exception('Login failed');
      }
    } catch (e) {
     if (e is DioException) {
        debugPrint('DioException error: $e');
        // Access the response and type properly
        if (e.response != null) {
          debugPrint('Response data: ${e.response}');
          throw Exception('Failed to login: ${e.response?.data}');
        } else if (e.type == DioExceptionType.connectionError) {
          throw Exception('Connection timeout');
        } else if (e.type == DioExceptionType.receiveTimeout) {
          throw Exception('Receive timeout');
        } else if (e.type == DioExceptionType.sendTimeout) {
          throw Exception('Send timeout');
        }
      } else {
        debugPrint('Unknown error: $e');
      }
      throw Exception('Failed to login: $e');
    }
  
    
    }
  }

