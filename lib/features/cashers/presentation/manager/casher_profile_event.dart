abstract class CasherProfileEvent{}
class GetCasherInfoEvent extends CasherProfileEvent{
  final String userName;
 GetCasherInfoEvent({required this.userName});
}