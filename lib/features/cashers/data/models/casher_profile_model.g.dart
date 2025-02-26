// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'casher_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CasherProfileModel _$CasherProfileModelFromJson(Map<String, dynamic> json) =>
    CasherProfileModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: Casher.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CasherProfileModelToJson(CasherProfileModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Casher _$CasherFromJson(Map<String, dynamic> json) => Casher(
      id: json['_id'] as String,
      fullName: json['fullName'] as String,
      userName: json['userName'] as String,
      password: json['password'] as String,
      token: json['token'] as List<dynamic>?,
      email: json['email'] as String,
      mobile: (json['mobile'] as num).toInt(),
      accountNumber: (json['accountNumber'] as num).toInt(),
      isNew: json['isNew'] as bool,
      isActive: json['isActive'] as bool,
      isLocked: json['isLocked'] as bool,
      branchId: Branch.fromJson(json['branchId'] as Map<String, dynamic>),
      createdDate: json['createdDate'] as String,
      merchantId: Merchant.fromJson(json['merchantId'] as Map<String, dynamic>),
      createBy: json['createBy'] as String,
      v: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$CasherToJson(Casher instance) => <String, dynamic>{
      '_id': instance.id,
      'fullName': instance.fullName,
      'userName': instance.userName,
      'password': instance.password,
      'token': instance.token,
      'email': instance.email,
      'mobile': instance.mobile,
      'accountNumber': instance.accountNumber,
      'isNew': instance.isNew,
      'isActive': instance.isActive,
      'isLocked': instance.isLocked,
      'branchId': instance.branchId,
      'createdDate': instance.createdDate,
      'merchantId': instance.merchantId,
      'createBy': instance.createBy,
      '__v': instance.v,
    };

Branch _$BranchFromJson(Map<String, dynamic> json) => Branch(
      id: json['_id'] as String,
      branchName: json['branchName'] as String,
      branchCode: json['branchCode'] as String,
      merchantId: json['merchantId'] as String,
      isActive: json['isActive'] as bool,
      description: json['description'] as String,
      createdDate: json['createdDate'] as String,
      createBy: json['createBy'] as String,
      v: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$BranchToJson(Branch instance) => <String, dynamic>{
      '_id': instance.id,
      'branchName': instance.branchName,
      'branchCode': instance.branchCode,
      'merchantId': instance.merchantId,
      'isActive': instance.isActive,
      'description': instance.description,
      'createdDate': instance.createdDate,
      'createBy': instance.createBy,
      '__v': instance.v,
    };

Merchant _$MerchantFromJson(Map<String, dynamic> json) => Merchant(
      id: json['_id'] as String,
      companyName: json['companyName'] as String,
      businessType: json['businessType'] as String,
      merchantCategoryCode: json['merchantCategoryCode'] as String,
      tinNumber: json['tinNumber'] as String,
      tradeLicenceNumber: json['tradeLicenceNumber'] as String,
      tradeLicenceIssueDate:
          DateTime.parse(json['tradeLicenceIssueDate'] as String),
      tradeLicenceExpiredDate:
          DateTime.parse(json['tradeLicenceExpiredDate'] as String),
      address: json['address'] as String,
      phoneNumber: (json['phoneNumber'] as num).toInt(),
      faxNumber: json['faxNumber'] as String,
      emailAddress: json['emailAddress'] as String,
      merchantAccountNumber: json['merchantAccountNumber'] as String,
      branchID: json['branchID'] as String,
      status: json['status'] as String,
      createdDate: json['createdDate'] as String,
      createBy: json['createBy'] as String,
      merchantId: json['merchantId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num).toInt(),
      authorizedBy: json['authorizedBy'] as String,
      authorizedDate: DateTime.parse(json['authorizedDate'] as String),
      numberOfQRRequired: (json['numberOfQRRequired'] as num).toInt(),
      activatedBy: json['activatedBy'] as String,
      activatedDate: json['activatedDate'] as String,
    );

Map<String, dynamic> _$MerchantToJson(Merchant instance) => <String, dynamic>{
      '_id': instance.id,
      'companyName': instance.companyName,
      'businessType': instance.businessType,
      'merchantCategoryCode': instance.merchantCategoryCode,
      'tinNumber': instance.tinNumber,
      'tradeLicenceNumber': instance.tradeLicenceNumber,
      'tradeLicenceIssueDate': instance.tradeLicenceIssueDate.toIso8601String(),
      'tradeLicenceExpiredDate':
          instance.tradeLicenceExpiredDate.toIso8601String(),
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'faxNumber': instance.faxNumber,
      'emailAddress': instance.emailAddress,
      'merchantAccountNumber': instance.merchantAccountNumber,
      'branchID': instance.branchID,
      'status': instance.status,
      'createdDate': instance.createdDate,
      'createBy': instance.createBy,
      'merchantId': instance.merchantId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      '__v': instance.v,
      'authorizedBy': instance.authorizedBy,
      'authorizedDate': instance.authorizedDate.toIso8601String(),
      'numberOfQRRequired': instance.numberOfQRRequired,
      'activatedBy': instance.activatedBy,
      'activatedDate': instance.activatedDate,
    };
