import 'package:dio/dio.dart';
import 'package:merchant_app/features/products/data/models/get_products_by_merchant_model.dart';
import 'package:merchant_app/features/storeage/token_storage_service.dart';
import 'package:flutter/foundation.dart';
class GetProdductsByMerchantDataSource {
  final Dio dio;
  final TokenStorageService tokenStorageService;
  GetProdductsByMerchantDataSource(
      {required this.dio, required this.tokenStorageService});
  Future<List<GetProductsByMerchantModel>> getMerchantProducts() async {
    try {
      final token = await tokenStorageService.getToken();
      dio.options.headers['Authorization'] = 'Bearer $token';
      final response =
          await dio.get('http://192.168.1.94:1005/api/v1/auth/getProducts');
          debugPrint('Mock Response Data: ${response.data['data']}',
          wrapWidth: 4096);
      if (response.statusCode == 200) {
        var merchantProductList = response.data['data'] as List;
        return merchantProductList
            .map((product) => GetProductsByMerchantModel.fromJson(product))
            .toList();
      } else {
        throw Exception("no products feched");
      }
    } catch (e) {
      throw Exception('$e');
    }
  }
}
