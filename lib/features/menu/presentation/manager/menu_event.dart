abstract class MenuEvent{}
class ChangePasswordEvent extends MenuEvent{
  final String oldPassword;
  final String newPassword;
  ChangePasswordEvent({required this.oldPassword,required this.newPassword});
}