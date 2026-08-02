import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_5/features/products/presentation/product_screen.dart';
import 'routes.dart';
import '../features/products/presentation/cubit/products_cubit.dart';


Route? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.productsScreen:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => ProductsCubit(),
          child: const ProductsScreen(),
        ),
      );
    default:
      return null;
  }
}