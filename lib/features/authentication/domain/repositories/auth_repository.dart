import 'package:merchant_app/features/authentication/domain/entities/user.dart';
abstract class AuthRepository {
  Future<User> login(String userName, String password);
}
