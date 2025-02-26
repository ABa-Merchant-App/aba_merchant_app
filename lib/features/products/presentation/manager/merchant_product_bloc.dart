import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merchant_app/features/products/domain/use_cases/get_products_by_merchant_use_case.dart';
import 'package:merchant_app/features/products/presentation/manager/merchant_product_event.dart';
import 'package:merchant_app/features/products/presentation/manager/merchant_product_state.dart';

class MerchantProductBloc extends Bloc<MerchantProductEvent,MerchantProductState>{
   final GetProductsByMerchantUseCase getProductsByMerchantUseCase;
   MerchantProductBloc({required this.getProductsByMerchantUseCase}):super(ProductsInitialState()){
    on<FetchProductsEvent>((event,emit) async{
      emit(ProductsLoadingState());
      try{
        final productList= await getProductsByMerchantUseCase.executeMerchantProduct();
         emit(ProductsSuccessState(products: productList));
      }catch(e){
       emit(ProductsFailureState(message:e.toString()));
      }

    });
   }
}