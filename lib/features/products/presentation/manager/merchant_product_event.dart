abstract class MerchantProductEvent{}
class FetchProductsEvent extends MerchantProductEvent{
  FetchProductsEvent();
}
class UpdateTotalEvent extends MerchantProductEvent {
  final List<int> quantities; // List of quantities for each product

  UpdateTotalEvent(this.quantities);
}