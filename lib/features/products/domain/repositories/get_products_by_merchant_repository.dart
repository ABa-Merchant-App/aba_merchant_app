import 'package:merchant_app/features/products/domain/entities/get_products_by_merchant_entity.dart';

abstract class GetProductsByMerchantRepository{
  Future<List<GetProductsByMerchantEntity>> getMerchantProducts();
}