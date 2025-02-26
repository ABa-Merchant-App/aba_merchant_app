import 'package:equatable/equatable.dart';
class User extends Equatable{
  final String token;
  final String merchantName;
  final String merchantAccountNumber;
  final String merchantAddress;
  final String merchantId;
  final String merchantCategoryCode;
  final num merchantPhone;
  final String cashierName;
  final String cashierBranch;
  final num cashierPhone;
  final String storeLabel;
  final String tillId;

 const  User({
    required this.token,
    required this.merchantName,
    required this.merchantAccountNumber,
    required this.merchantAddress,
    required this.merchantId,
    required this.merchantCategoryCode,
    required this.merchantPhone,
    required this.cashierName,
    required this.cashierBranch,
    required this.cashierPhone,
    required this.storeLabel,
    required this.tillId,
  });
  @override
  List<Object?> get props=>[
   token,
  merchantName,
  merchantAccountNumber,
  merchantAddress,
  merchantId,
  merchantCategoryCode,
  merchantPhone,
  cashierName,
   cashierBranch,
  cashierPhone,
  storeLabel,
  tillId
  ];
}
