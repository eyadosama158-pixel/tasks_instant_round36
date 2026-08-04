import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_products/core/routes.dart';
import 'package:task_products/features/products/presentation/cubit/products_cubit.dart';
import 'package:task_products/features/products/presentation/screens/product_screen.dart';

class AppRouter {
  static GoRouter router = GoRouter(
      initialLocation: Routes.product,
      routes: [
        GoRoute(path: Routes.product, builder: (context, state) =>
            BlocProvider(
              create: (context) => ProductsCubit()..getProducts(),
              child: ProductScreen(),
            ))
      ]

  );
}