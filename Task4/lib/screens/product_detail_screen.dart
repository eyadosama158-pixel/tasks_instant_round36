import 'package:flutter/material.dart';
import '../model/food_item.dart';

class ProductDetailScreen extends StatefulWidget {
  final FoodItem foodItem;

  const ProductDetailScreen({super.key, required this.foodItem});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  double _spicyLevel = 0.4;
  int _portion = 2;

  @override
  Widget build(BuildContext context) {
    final item = widget.foodItem;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),

                      // Top bar: Back + Search
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(Icons.arrow_back,
                                  color: Colors.black87, size: 24),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(Icons.search,
                                  color: Colors.black87, size: 24),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Burger Image
                      Center(
                        child: Hero(
                          tag: 'food_${item.id}',
                          child: Image.asset(
                            item.imageUrl,
                            height: 220,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),

                      // Title
                      Text(
                        '${item.name} ${item.subtitle}',
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Rating + Time
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 20),
                          const SizedBox(width: 5),
                          Text(
                            item.rating.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            '~  26 mins',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Description
                      Text(
                        item.description,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 15,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Spicy + Portion Row
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Spicy Slider
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Spicy',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    activeTrackColor: const Color(0xFFE81B30),
                                    inactiveTrackColor: Colors.grey[200],
                                    thumbColor: const Color(0xFFE81B30),
                                    overlayColor:
                                        const Color(0xFFE81B30).withOpacity(0.2),
                                    thumbShape: const RoundSliderThumbShape(
                                        enabledThumbRadius: 8),
                                    trackHeight: 4,
                                  ),
                                  child: Slider(
                                    value: _spicyLevel,
                                    onChanged: (val) {
                                      setState(() => _spicyLevel = val);
                                    },
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Mild',
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      'Hot',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),

                          // Portion Counter
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Portion',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        if (_portion > 1) {
                                          setState(() => _portion--);
                                        }
                                      },
                                      child: Container(
                                        width: 36,
                                        height: 36,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFE81B30),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: const Icon(Icons.remove,
                                            color: Colors.white, size: 20),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Text(
                                        '$_portion',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() => _portion++);
                                      },
                                      child: Container(
                                        width: 36,
                                        height: 36,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFE81B30),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: const Icon(Icons.add,
                                            color: Colors.white, size: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),

            // Bottom: Price + Order Now Button
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Price badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 14),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE81B30),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      '\$${(item.price * _portion).toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Order Now button
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Ordered $_portion x ${item.name} ${item.subtitle}!'),
                            backgroundColor: const Color(0xFFE81B30),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF333333),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'ORDER NOW',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
