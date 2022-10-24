import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/product_response.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsLoading());
  static ProductsCubit get(context) => BlocProvider.of(context);

  getProducts() async {
    final ss = await ProductResponse.instance();
    emit(ProductsLoaded(products: ss));
  }
}
