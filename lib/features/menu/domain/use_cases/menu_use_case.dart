import 'package:merchant_app/features/menu/domain/entities/menu_entity.dart';
import 'package:merchant_app/features/menu/domain/repositories/menu_repository.dart';

class MenuUseCase{
  final MenuRepository repository;
  MenuUseCase({required this.repository});
  Future<MenuEntity> executeChangePassword(String oldPassword,String newPassword){
    return repository.changePassword( oldPassword, newPassword);
  }
}