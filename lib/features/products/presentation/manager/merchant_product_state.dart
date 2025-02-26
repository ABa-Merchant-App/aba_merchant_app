//import 'package:merchant_app/features/products/data/models/get_products_by_merchant_model.dart';
import 'package:merchant_app/features/products/domain/entities/get_products_by_merchant_entity.dart';

abstract class MerchantProductState{}
class ProductsInitialState extends MerchantProductState{}
class ProductsLoadingState extends MerchantProductState{}
class ProductsSuccessState extends MerchantProductState{
    final List<GetProductsByMerchantEntity> products;
   ProductsSuccessState({required this.products});
}
class ProductsFailureState extends MerchantProductState{
  final String message;
   ProductsFailureState({required this.message});
}