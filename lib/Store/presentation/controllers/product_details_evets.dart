import 'package:equatable/equatable.dart';

abstract class ProductDetailsEvents extends Equatable{
  const ProductDetailsEvents();

}
class GetProductDetailsEvent extends ProductDetailsEvents{
  final int id;
  const GetProductDetailsEvent(this.id);
  @override
  List<Object?> get props =>[id];
}