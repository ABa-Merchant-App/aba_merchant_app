abstract class MenuState{}
class ChangePasswordInitial extends MenuState{}
class ChangePasswordLoading extends MenuState{}
class ChangePasswordSuccess extends MenuState{
 final String message;
 ChangePasswordSuccess({required this.message});
}
class ChangePasswordFailureState extends MenuState{
  final String message;
  ChangePasswordFailureState({required this.message});
}