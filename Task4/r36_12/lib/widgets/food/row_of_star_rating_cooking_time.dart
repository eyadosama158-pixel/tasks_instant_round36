import 'package:flutter/material.dart';
import 'package:food_app/model/food_model.dart';

import '../../core/contants.dart';
import '../common/custom_text.dart';

class RowOfStarRatingCookingTime extends StatelessWidget {
  FoodModel foodModel;
  RowOfStarRatingCookingTime({super.key, required this.foodModel});

  @override
  Widget build(BuildContext context) {
    //star icon, rating
    return Row(
      children: [
        //star icon, rating
        Row(
          children: [
            //star icon
            Icon(Icons.star, size: iconSize20, color: orangeColor),
            SizedBox(width: 5),

            //rating
            CustomText(
              title: "${foodModel.rating}",
              color: blackColor,
              fontSize: fontSize15,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        //cooking time
        CustomText(
          title: " - ${foodModel.deliveryTime} mins",
          color: greyColor,
          fontSize: fontSize15,
        ),
      ],
    );
  }
}
