import 'package:merchant_app/features/cashers/domain/entities/casher_profile_entity.dart';
import 'package:merchant_app/features/cashers/domain/repositories/casher_profile_repository.dart';

class CasherProfileUseCase{
   final CasherProfileRepository casherProfileRepository;
   CasherProfileUseCase({required this.casherProfileRepository});
   Future<CasherProfileEntity> executeCasherInfo(String userName){
    return casherProfileRepository.getCasherInfo(userName);
   }
}