import 'package:merchant_app/features/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:merchant_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:merchant_app/features/authentication/domain/entities/user.dart';
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource dataSource;

  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<User> login(String userName, String password) async {
    final userModel = await dataSource.login(userName, password);
    return User(
      token: userModel.token,
      merchantName: userModel.merchantName,
      merchantAccountNumber: userModel.merchantAccountNumber,
      merchantAddress: userModel.merchantAddress,
      merchantId: userModel.merchantId,
      merchantCategoryCode: userModel.merchantCategoryCode,
      merchantPhone: userModel.merchantPhone,
      cashierName: userModel.cashierName,
      cashierBranch: userModel.cashierBranch,
      cashierPhone: userModel.cashierPhone,
      storeLabel: userModel.storeLabel,
      tillId: userModel.tillId,
    );
  }
}
