import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:merchant_app/features/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:merchant_app/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:merchant_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:merchant_app/features/authentication/domain/use_cases/login_use_case.dart';
import 'package:merchant_app/features/authentication/presentation/manager/login_bloc.dart';
import 'package:merchant_app/features/cashers/data/data_sources/casher_profile_data_source.dart';
import 'package:merchant_app/features/cashers/data/repositories/casher_profile_repository_impl.dart';
import 'package:merchant_app/features/cashers/domain/repositories/casher_profile_repository.dart';
import 'package:merchant_app/features/cashers/domain/use_cases/casher_profile_use_case.dart';
import 'package:merchant_app/features/cashers/presentation/manager/casher_profile_bloc.dart';
import 'package:merchant_app/features/menu/data/data_sources/menu_data_source.dart';
import 'package:merchant_app/features/menu/data/repositories/menu_repository_impl.dart';
import 'package:merchant_app/features/menu/domain/repositories/menu_repository.dart';
import 'package:merchant_app/features/menu/domain/use_cases/menu_use_case.dart';
import 'package:merchant_app/features/menu/presentation/manager/menu_bloc.dart';
import 'package:merchant_app/features/products/data/data_sources/get_prodducts_by_merchant_data_source.dart';
import 'package:merchant_app/features/products/data/reposiories/get_products_by_merchant_repository_impl.dart';
import 'package:merchant_app/features/products/domain/repositories/get_products_by_merchant_repository.dart';
import 'package:merchant_app/features/products/domain/use_cases/get_products_by_merchant_use_case.dart';
import 'package:merchant_app/features/products/presentation/manager/merchant_product_bloc.dart';
import 'package:merchant_app/features/storeage/token_storage_service.dart';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart'; 
final sl = GetIt.instance;
// Your custom Dio creation method with CookieManager
Future<Dio> createDioWithCookieJar() async {
  final dio = Dio();

  // Create a directory to store cookies locally
  final directory = await getApplicationDocumentsDirectory();
  final cookieJar = PersistCookieJar(
    storage: FileStorage('${directory.path}/cookies.json'), // store cookies in the local storage
  );

  dio.interceptors.add(CookieManager(cookieJar)); // Add CookieManager to Dio interceptors

  return dio;
}
Future<void> init() async {
    // Dio instance with CookieManager (async initialization)
  final dio = await createDioWithCookieJar();
  sl.registerLazySingleton<Dio>(() => dio);

  // token instance
  sl.registerLazySingleton(()=>TokenStorageService());
  // Data sources
  sl.registerLazySingleton(() => AuthRemoteDataSource(dio: sl(),newToken: sl()));
  sl.registerLazySingleton(()=>GetProdductsByMerchantDataSource(dio:sl(),tokenStorageService: sl()));
  sl.registerLazySingleton(()=>CasherProfileDataSource(dio: sl()));
  sl.registerLazySingleton(()=>MenuDataSource(dio: dio, tokenStorageService: sl()));
  // Repositories
 // Repositories
sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(dataSource: sl<AuthRemoteDataSource>()));
sl.registerLazySingleton<GetProductsByMerchantRepository>(()=>GetProductsByMerchantRepositoryImpl(dataSource: sl<GetProdductsByMerchantDataSource>()));
sl.registerLazySingleton<CasherProfileRepository>(()=>CasherProfileRepositoryImpl(casherProfileDataSource: sl<CasherProfileDataSource>()));
sl.registerLazySingleton<MenuRepository>(()=>MenuRepositoryImpl(dataSource: sl<MenuDataSource>()));
  // Use cases
  sl.registerLazySingleton(() => LoginUseCase(repository: sl()));
  sl.registerLazySingleton(()=>GetProductsByMerchantUseCase(repository: sl()));
  sl.registerLazySingleton(()=>CasherProfileUseCase(casherProfileRepository: sl()));
  sl.registerLazySingleton(()=>MenuUseCase(repository: sl()));
  // BLoC
  sl.registerFactory(() => LoginBloc(loginUseCase: sl()));
  sl.registerFactory(() => MerchantProductBloc(getProductsByMerchantUseCase: sl()));
  sl.registerLazySingleton(()=>CasherProfileBloc(casherProfileUseCase: sl()));
  sl.registerLazySingleton(()=>MenuBloc(menuUseCase: sl()));
}
