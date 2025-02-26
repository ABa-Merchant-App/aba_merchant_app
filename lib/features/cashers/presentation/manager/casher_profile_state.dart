import 'package:merchant_app/features/cashers/domain/entities/casher_profile_entity.dart';

abstract class CasherProfileState{}
class CasherInitialState extends CasherProfileState{}
class CasherLoadingState extends CasherProfileState{}
class CasherSuccessState extends CasherProfileState{
  final CasherProfileEntity casherProfileEntity;
  CasherSuccessState({required this.casherProfileEntity});
}
class CasherFailureState extends CasherProfileState{
    final String message;
    CasherFailureState({required this.message});
}