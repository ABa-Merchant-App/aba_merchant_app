import 'dart:io';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:merchant_app/features/storeage/token_storage_service.dart';
import 'package:path_provider/path_provider.dart';

@Singleton()
class Session {
  final access_token=TokenStorageService();
  var  token;
  var baseUrl;

  Session() {
    token = access_token.getToken();
    baseUrl = dotenv.get('BASE_URL');
    prepareJar();
  }

  Future<void> prepareJar() async {
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String appDocPath = appDocDir.path;
    final jar = PersistCookieJar(
      ignoreExpires: true,
      storage: FileStorage("$appDocPath/.cookies/"),
    );
    dio.interceptors.addAll([CookieManager(jar)]);
  }

  final Dio dio = Dio(BaseOptions(
      connectTimeout: const Duration(minutes: 7),
      receiveTimeout: const Duration(minutes: 7),
      sendTimeout: const Duration(minutes: 7),
      responseType: ResponseType.json,
      followRedirects: false,
      headers: {
        'Authorization': 'Bearer ${dotenv.get('API_TOKEN')}',
        'Content-Type': 'application/json'
      },
      validateStatus: (status) {
        return true;
      }));

  Map<String, String> headers = {
    'Authorization': 'Bearer ${dotenv.get('API_TOKEN')}'
  };

  Future<Response> get(String url, Map<String, dynamic>? params,
      Map<String, dynamic> urlParams) async {
    try {
      var response = await dio.get(
        "$baseUrl${(URLPaths: urlParams, url: url)}",
        queryParameters: params,
      );
      if (response.data.toString().contains("502 Bad Gateway") ||
          response.data.toString().contains("504 Gateway Time-out")) {
        throw Exception("Server error");
      }
      return response;
    } catch (e) { // You can log or handle the error as needed
      return Response(requestOptions: RequestOptions(path: url)); // Return an empty response
    }
  }

  Future<Response> post(String url, dynamic data) async {
    try {
      var response = await dio.post("$baseUrl$url", data: data);
      if (response.data.toString().contains("502 Bad Gateway") ||
          response.data.toString().contains("504 Gateway Time-out")) {
        throw Exception("Server error");
      }
      return response;
    } catch (exception) {
      print(exception);  // Log the exception or handle it as needed
      return Response(requestOptions: RequestOptions(path: url)); // Return an empty response
    }
  }

  Future<void> postMap(String url, Object data) async {
    try {
      final latitude = '9.011704301013898';
      final longitude = '38.754134401379275';

      final Object requestBody = {
        "latitude": latitude,
        "longitude": longitude,
      };
      var response = await dio.post("$baseUrl$url", data: requestBody);
      if (response.data.toString().contains("502 Bad Gateway") ||
          response.data.toString().contains("504 Gateway Time-out")) {
        // Handle server errors appropriately
      }
      print("___________${response.data}");
    } catch (exception) {
      print(exception);  // Log the exception
    }
  }

  Future<Response> verifyByBranchFromDashboard(String url, dynamic data) async {
    print('verification by branch started');

    try {
      baseUrl = "https://172.31.2.47:9878";
      var response = await dio.post("$baseUrl$url", data: data);
      print('verification by branch  :${response}');
      return response;
    } catch (exception) {
      print(exception);  // Log the exception
      return Response(requestOptions: RequestOptions(path: url)); // Return an empty response
    }
  }

  Future<Response> postForm(String url, dynamic data) async {
    try {
      var response = await dio.post("$baseUrl$url", data: data);
      if (response.data.toString().contains("502 Bad Gateway") ||
          response.data.toString().contains("504 Gateway Time-out")) {
        throw Exception("Server error");
      }
      return response;
    } on Exception catch (e) {
      print(e);  // Log the exception
      return Response(requestOptions: RequestOptions(path: url)); // Return an empty response
    }
  }

  Future<Response> delete(String url, dynamic data) async {
    try {
      var response = await dio.delete("$baseUrl$url", data: data);
      if (response.data.toString().contains("502 Bad Gateway") ||
          response.data.toString().contains("504 Gateway Time-out")) {
        throw Exception("Server error");
      }
      return response;
    } on Exception {
      // Handle exception and return a default response
      return Response(requestOptions: RequestOptions(path: url)); // Return an empty response
    }
  }

  void updateCookie(http.Response response) {
    String? rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      int index = rawCookie.indexOf(';');
      headers['cookie'] =
          (index == -1) ? rawCookie : rawCookie.substring(0, index);
    }
  }
}
