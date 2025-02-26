import 'package:merchant_app/features/products/domain/entities/get_products_by_merchant_entity.dart';
import 'package:merchant_app/features/products/domain/repositories/get_products_by_merchant_repository.dart';

class GetProductsByMerchantUseCase{
  final GetProductsByMerchantRepository repository;
  GetProductsByMerchantUseCase({required this.repository});
  Future<List<GetProductsByMerchantEntity>> executeMerchantProduct(){
    return repository.getMerchantProducts();
  }
}