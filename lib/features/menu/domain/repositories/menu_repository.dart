import 'package:merchant_app/features/menu/domain/entities/menu_entity.dart';

abstract class MenuRepository{
Future<MenuEntity> changePassword(String oldPassword, String newPassword);
}