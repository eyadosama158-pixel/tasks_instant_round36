import 'package:flutter/material.dart';
import 'package:foodo/screens/splash_screen.dart';
import 'package:foodo/screens/home_screen.dart';
import 'package:foodo/screens/product_detail_screen.dart';
import 'package:foodo/model/food_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodgo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFA5A6A)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/productDetail') {
          final foodItem = settings.arguments as FoodItem;
          return MaterialPageRoute(
            builder: (context) {
              return ProductDetailScreen(foodItem: foodItem);
            },
          );
        }
        return null;
      },
    );
  }
}
