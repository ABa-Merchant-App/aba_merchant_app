import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merchant_app/features/menu/domain/use_cases/menu_use_case.dart';
import 'package:merchant_app/features/menu/presentation/manager/menu_event.dart';
import 'package:merchant_app/features/menu/presentation/manager/menu_state.dart';

class MenuBloc extends Bloc<MenuEvent,MenuState>{
  final MenuUseCase menuUseCase;
  MenuBloc({required this.menuUseCase}):super(ChangePasswordInitial()){
    on<ChangePasswordEvent>((event,emit)async {
    emit(ChangePasswordLoading());
    try{
      final password= await menuUseCase.executeChangePassword(event.oldPassword, event.newPassword);
      emit(ChangePasswordSuccess(message: password.newPassword));
    }catch(e){
     emit(ChangePasswordFailureState(message: e.toString()));
    }
    });
  }
}