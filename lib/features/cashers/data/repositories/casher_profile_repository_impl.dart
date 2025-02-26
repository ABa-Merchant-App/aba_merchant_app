import 'package:merchant_app/features/cashers/data/data_sources/casher_profile_data_source.dart';
import 'package:merchant_app/features/cashers/domain/entities/casher_profile_entity.dart';
import 'package:merchant_app/features/cashers/domain/repositories/casher_profile_repository.dart';

class CasherProfileRepositoryImpl implements CasherProfileRepository {
  final CasherProfileDataSource casherProfileDataSource;
  CasherProfileRepositoryImpl({required this.casherProfileDataSource});
  @override
  Future<CasherProfileEntity> getCasherInfo(String userName) async{
     final casherModel= await casherProfileDataSource.getCasherInfo(userName);
    
    // Map the Branch from data model to domain model
    final branch = Branch(
      id: casherModel.data.branchId.id,
      branchName: casherModel.data.branchId.branchName,
      branchCode: casherModel.data.branchId.branchCode,
      merchantId: casherModel.data.branchId.merchantId,
      isActive: casherModel.data.branchId.isActive,
      description: casherModel.data.branchId.description,
      createdDate: casherModel.data.branchId.createdDate,
      createBy: casherModel.data.branchId.createBy,
      v: casherModel.data.branchId.v,
    );

    // Map the Merchant from data model to domain model
    final merchant = Merchant(
      id: casherModel.data.merchantId.id,
      companyName: casherModel.data.merchantId.companyName,
      businessType: casherModel.data.merchantId.businessType,
      merchantCategoryCode: casherModel.data.merchantId.merchantCategoryCode,
      tinNumber: casherModel.data.merchantId.tinNumber,
      tradeLicenceNumber: casherModel.data.merchantId.tradeLicenceNumber,
      tradeLicenceIssueDate: casherModel.data.merchantId.tradeLicenceIssueDate,
      tradeLicenceExpiredDate: casherModel.data.merchantId.tradeLicenceExpiredDate,
      address: casherModel.data.merchantId.address,
      phoneNumber: casherModel.data.merchantId.phoneNumber,
      faxNumber: casherModel.data.merchantId.faxNumber,
      emailAddress: casherModel.data.merchantId.emailAddress,
      merchantAccountNumber: casherModel.data.merchantId.merchantAccountNumber,
      branchID: casherModel.data.merchantId.branchID,
      status: casherModel.data.merchantId.status,
      createdDate: casherModel.data.merchantId.createdDate,
      createBy: casherModel.data.merchantId.createBy,
      merchantId: casherModel.data.merchantId.merchantId,
      createdAt: casherModel.data.merchantId.createdAt,
      updatedAt: casherModel.data.merchantId.updatedAt,
      v: casherModel.data.merchantId.v,
      authorizedBy: casherModel.data.merchantId.authorizedBy,
      authorizedDate: casherModel.data.merchantId.authorizedDate,
      numberOfQRRequired: casherModel.data.merchantId.numberOfQRRequired,
      activatedBy:casherModel.data.merchantId.activatedBy,
      activatedDate:casherModel.data.merchantId.activatedDate
    );

    // Map the Casher entity
    final casher = Casher(
      id: casherModel.data.id,
      fullName: casherModel.data.fullName,
      userName: casherModel.data.userName,
      password: casherModel.data.password,
      token: casherModel.data.token,
      email: casherModel.data.email,
      mobile: casherModel.data.mobile,
      accountNumber: casherModel.data.accountNumber,
      isNew: casherModel.data.isNew,
      isActive: casherModel.data.isActive,
      isLocked: casherModel.data.isLocked,
      branchId: branch, // Pass the mapped Branch object
      createdDate: casherModel.data.createdDate,
      merchantId: merchant, // Pass the mapped Merchant object
      createBy: casherModel.data.createBy,
      v: casherModel.data.v,
    );
     return CasherProfileEntity(
       status: casherModel.status,
       message: casherModel.message,
       data: casher
     );
  }
}
