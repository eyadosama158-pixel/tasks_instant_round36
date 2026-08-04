import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/dummy.dart';
import '../../data/products_model.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitialState());

  Future<void> getProducts() async {
    emit(ProductsLoadingState());

    await Future.delayed(const Duration(milliseconds: 5000));

    final int productsCase = 2;

    if (productsCase == 0) {
      emit(ProductsFailureState(errorMessage: 'Loading failed!'));
    }

    if (productsCase == 1) {
      emit(ProductsLoadedState(products: []));
    }

    if (productsCase == 2) {
      emit(ProductsLoadedState(products: productsList));
    }
  }
}
