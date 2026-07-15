import 'package:go_router/go_router.dart';
import '../model/food_model.dart';
import '../screens/food_screen.dart';
import '../screens/home_screen.dart';
import '../screens/splash_screen.dart';
import 'routes.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashScreen()),
      GoRoute(path: Routes.home, builder: (context, state) => HomeScreen()),
      GoRoute(
        path: Routes.food,
        builder: (context, state) {
          final foodModel = state.extra as FoodModel;
          return FoodScreen(foodModel: foodModel);
        },
      ),
    ],
  );
}
