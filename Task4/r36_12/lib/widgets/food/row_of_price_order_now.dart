import 'package:flutter/material.dart';
import 'package:food_app/model/food_model.dart';

import '../../core/contants.dart';
import '../common/custom_text.dart';
import '../common/custom_widget.dart';

class RowOfPriceOrderNow extends StatelessWidget {
  FoodModel foodModel;
  RowOfPriceOrderNow({super.key, required this.foodModel});

  @override
  Widget build(BuildContext context) {
    //price, order now
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //price
        CustomWidget(
          width: 100,
          height: 60,
          child: Center(
            child: CustomText(
              title: "\$${foodModel.price} ",
              color: whiteColor,
              fontSize: fontSize25,
              fontWeight: fontWeightBold,
            ),
          ),
        ),

        //order now
        CustomWidget(
          width: 190,
          height: 60,
          color: blackColor,
          child: Center(
            child: CustomText(
              title: "ORDER NOW",
              color: whiteColor,
              fontSize: fontSize20,
              fontWeight: fontWeightBold,
            ),
          ),
        ),
      ],
    );
  }
}
