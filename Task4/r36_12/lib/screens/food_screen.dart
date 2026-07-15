import 'package:flutter/material.dart';
import 'package:food_app/widgets/food/header_food_screen.dart';

import '../core/contants.dart';
import '../model/food_model.dart';
import '../widgets/common/custom_text.dart';
import '../widgets/common/custom_widget.dart';
import '../widgets/food/row_of_price_order_now.dart';
import '../widgets/food/row_of_spicy_portion.dart';
import '../widgets/food/row_of_star_rating_cooking_time.dart';

class FoodScreen extends StatefulWidget {
  FoodModel foodModel;
  FoodScreen({super.key, required this.foodModel});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //icon arrow back, icon search
              HeaderFoodScreen(),

              //image burger
              Image.asset(
                widget.foodModel.imagePath,
                fit: BoxFit.cover,
                height: 250,
                width: 250,
              ),

              //burger name, star icon, rating, cooking time, description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //burger name
                    CustomText(
                      title:
                          "${widget.foodModel.name} ${widget.foodModel.brand}",
                      color: blackColor,
                      fontWeight: fontWeightBold,
                      fontSize: fontSize20,
                    ),

                    SizedBox(height: 10),

                    //star icon, rating, cooking time
                    RowOfStarRatingCookingTime(foodModel: widget.foodModel),

                    SizedBox(height: 10),

                    //description
                    TextField(
                      maxLines: 7,
                      textAlign: TextAlign.left,
                      style: TextStyle(color: greyColor, fontSize: fontSize15),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: widget.foodModel.description,
                      ),
                    ),

                    SizedBox(height: 20),

                    //spicy slider, portion
                    RowOfSpicyPortion(),

                    SizedBox(height: 30),
                    //price, order now
                    RowOfPriceOrderNow(foodModel: widget.foodModel),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
