import 'package:flutter/material.dart';
import '../../core/contants.dart';
import '../../model/food_model.dart';
import '../common/custom_text.dart';

class FoodItem extends StatelessWidget {
  FoodModel foodModel;
  FoodItem({super.key, required this.foodModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius15),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 17,
              offset: Offset(0, 6),
            ),
          ],
        ),
        //category name , line , arrow
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  foodModel.imagePath,
                  height: 100,
                  width: 100,
                ),
              ),
              //type name
              CustomText(
                title: foodModel.name,
                color: blackColor,
                fontSize: fontSize15,
                fontWeight: fontWeightBold,
              ),
              //burger name
              CustomText(
                title: foodModel.brand,
                color: blackColor,
                fontSize: fontSize15,
              ),
              //star icon, rating, favorite icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //star icon ,rating
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
                        fontWeight: fontWeightBold,
                      ),
                    ],
                  ),
                  //favorite icon
                  Icon(
                    Icons.favorite_outline_rounded,
                    size: iconSize25,
                    color: blackColor,
                  ),

                  // SizedBox(height: 10,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
