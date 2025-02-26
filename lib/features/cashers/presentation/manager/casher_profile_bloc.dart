import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merchant_app/features/cashers/domain/use_cases/casher_profile_use_case.dart';
import 'package:merchant_app/features/cashers/presentation/manager/casher_profile_event.dart';
import 'package:merchant_app/features/cashers/presentation/manager/casher_profile_state.dart';

class CasherProfileBloc extends Bloc<CasherProfileEvent,CasherProfileState>{
   final CasherProfileUseCase casherProfileUseCase;
   CasherProfileBloc({required this.casherProfileUseCase}):super(CasherInitialState()){
   on<GetCasherInfoEvent>((event,emit) async {
     emit(CasherLoadingState());
    try{
     final casherInfo= await casherProfileUseCase.executeCasherInfo(event.userName);
      emit(CasherSuccessState(casherProfileEntity: casherInfo));
    }catch(e){
      emit(CasherFailureState(message:e.toString()));
    }
   });
}
}