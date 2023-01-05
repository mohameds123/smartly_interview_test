import 'package:equatable/equatable.dart';

abstract class StoreEvent extends Equatable{

  const StoreEvent();
  List<Object?> get props =>[];
}
class GetAllProductsEvent extends StoreEvent{}


