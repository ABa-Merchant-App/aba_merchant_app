import 'package:json_annotation/json_annotation.dart';
part 'casher_profile_model.g.dart';
@JsonSerializable()
class CasherProfileModel{
  bool status;
  String message;
  Casher data;
  CasherProfileModel({required this.status,required this.message,required this.data});

  factory CasherProfileModel.fromJson(Map<String,dynamic> json)=>_$CasherProfileModelFromJson(json);
  Map<String,dynamic> toJson()=>_$CasherProfileModelToJson(this);

}
 @JsonSerializable()
  class Casher{
  @JsonKey(name: "_id")
  String id;
  String fullName;
  String userName;
  String password;
  List<dynamic>? token;
  String email;
  int mobile;
  int accountNumber;
  bool isNew;
  bool isActive;
  bool isLocked;
  Branch branchId;
  String createdDate;
  Merchant merchantId;
  String createBy;
  @JsonKey(name:"__v")
  int v;
   Casher({
    required this.id,
    required this.fullName,
    required this.userName,
    required this.password,
     this.token,
    required this.email,
    required this.mobile,
    required this.accountNumber,
    required this.isNew,
    required this.isActive,
    required this.isLocked,
    required this.branchId,
    required this.createdDate,
    required this.merchantId,
    required this.createBy,
    required this.v,
  });
  
  factory Casher.fromJson(Map<String,dynamic> json)=>_$CasherFromJson(json);
  Map<String,dynamic> toJson()=>_$CasherToJson(this);
  }
   @JsonSerializable()
    class Branch{
  @JsonKey(name: "_id")
  String id;
  String branchName;
  String branchCode;
  String merchantId;
  bool isActive;
  String description;
  String createdDate;
  String createBy;
  @JsonKey(name:"__v")
  int v;
   Branch({
    required this.id,
    required this.branchName,
    required this.branchCode,
    required this.merchantId,
    required this.isActive,
    required this.description,
    required this.createdDate,
    required this.createBy,
    required this.v,
  });
  factory Branch.fromJson(Map<String,dynamic> json)=>_$BranchFromJson(json);
  Map<String,dynamic> toJson()=>_$BranchToJson(this);
  }

  @JsonSerializable()
    class Merchant{
  @JsonKey(name: "_id")
      String id;
  String companyName;
  String businessType;
  String merchantCategoryCode;
  String tinNumber;
  String tradeLicenceNumber;
  DateTime tradeLicenceIssueDate;
  DateTime tradeLicenceExpiredDate;
  String address;
  int phoneNumber;
  String faxNumber;
  String emailAddress;
  String  merchantAccountNumber;
  String branchID;
  String status;
  String createdDate;
  String createBy;
  String merchantId;
  DateTime createdAt;
  DateTime updatedAt;
  @JsonKey(name:"__v")
  int v;
  String authorizedBy;
  DateTime authorizedDate;
  int numberOfQRRequired;
  String activatedBy;
  String activatedDate;
    Merchant({
    required this.id,
    required this.companyName,
    required this.businessType,
    required this.merchantCategoryCode,
    required this.tinNumber,
    required this.tradeLicenceNumber,
    required this.tradeLicenceIssueDate,
    required this.tradeLicenceExpiredDate,
    required this.address,
    required this.phoneNumber,
    required this.faxNumber,
    required this.emailAddress,
    required this.merchantAccountNumber,
    required this.branchID,
    required this.status,
    required this.createdDate,
    required this.createBy,
    required this.merchantId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.authorizedBy,
    required this.authorizedDate,
    required this.numberOfQRRequired,
    required this.activatedBy,
    required this.activatedDate,
  });
     factory Merchant.fromJson(Map<String,dynamic> json)=>_$MerchantFromJson(json);
  Map<String,dynamic> toJson()=>_$MerchantToJson(this); 
  }