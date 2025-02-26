import 'package:merchant_app/features/menu/data/data_sources/menu_data_source.dart';
import 'package:merchant_app/features/menu/domain/entities/menu_entity.dart';
import 'package:merchant_app/features/menu/domain/repositories/menu_repository.dart';

class MenuRepositoryImpl implements MenuRepository{
  final MenuDataSource dataSource;
  MenuRepositoryImpl({required this.dataSource});
  @override
  Future<MenuEntity> changePassword(String oldPassword,String newPassword) async{
   final menuModel=await dataSource.changePassword(oldPassword, newPassword);
   return MenuEntity(
     oldPassword:menuModel.oldPassword,
     newPassword: menuModel.newPassword
   );
  }
}