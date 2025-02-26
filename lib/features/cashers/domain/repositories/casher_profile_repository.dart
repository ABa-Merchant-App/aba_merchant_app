import 'package:merchant_app/features/cashers/domain/entities/casher_profile_entity.dart';

abstract class CasherProfileRepository{
 Future<CasherProfileEntity> getCasherInfo(String userName);
}