import 'package:merchant_app/features/products/data/data_sources/get_prodducts_by_merchant_data_source.dart';
import 'package:merchant_app/features/products/domain/entities/get_products_by_merchant_entity.dart';
import 'package:merchant_app/features/products/domain/repositories/get_products_by_merchant_repository.dart';

class GetProductsByMerchantRepositoryImpl implements GetProductsByMerchantRepository{
  final GetProdductsByMerchantDataSource dataSource;
  GetProductsByMerchantRepositoryImpl({required this.dataSource});
  @override
  Future<List<GetProductsByMerchantEntity>> getMerchantProducts() async{
    final productModel= await dataSource.getMerchantProducts();
    return productModel.map((productModel){
    return GetProductsByMerchantEntity(
       productName: productModel.productName,
       productCode: productModel.productCode,
       price: productModel.price,
       description: productModel.description,
       ingredents: productModel.ingredents,
       image: productModel.image,
       merchantId: productModel.merchantId,
       createdAt: productModel.createdAt,
       updatedAt: productModel.updatedAt,

    );
    }).toList();
  }
}