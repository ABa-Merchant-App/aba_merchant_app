import 'package:merchant_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:merchant_app/features/authentication/domain/entities/user.dart';
class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase({required this.repository});

  Future<User> execute(String userName, String password) {
    return repository.login(userName, password);
  }
}
