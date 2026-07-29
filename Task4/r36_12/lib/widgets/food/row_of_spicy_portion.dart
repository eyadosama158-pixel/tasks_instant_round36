import 'package:flutter/material.dart';

import '../../core/contants.dart';
import '../common/custom_text.dart';
import '../common/custom_widget.dart';

class RowOfSpicyPortion extends StatefulWidget {
  const RowOfSpicyPortion({super.key});

  @override
  State<RowOfSpicyPortion> createState() => _RowOfSpicyPortionState();
}

class _RowOfSpicyPortionState extends State<RowOfSpicyPortion> {
  @override
  Widget build(BuildContext context) {
    double spicy = 0;
    int portion = 0;
    //spicy , portion
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //spicy text, slider, mild, hot
        SizedBox(
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //spicy text
              CustomText(
                title: "Spicy",
                color: blackColor,
                fontSize: fontSize15,
                fontWeight: fontWeightBold,
              ),
              SizedBox(height: 10),
              //slider
              Slider(
                padding: EdgeInsets.only(left: 7),
                min: 0,
                max: 100,

                activeColor: redColor,

                value: spicy,

                onChanged: (double newValue) {
                  setState(() {
                    spicy = newValue;
                  });
                },
              ),
              SizedBox(height: 10),
              //mild, hot
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //mild
                  CustomText(
                    title: "Mild",
                    color: greenColor,
                    fontSize: fontSize13,
                    fontWeight: fontWeightBold,
                  ),
                  //hot
                  CustomText(
                    title: "Hot",
                    color: redColor,
                    fontSize: fontSize13,
                    fontWeight: fontWeightBold,
                  ),
                ],
              ),
            ],
          ),
        ),
        //portion text, mins, num, add
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            //portion text
            CustomText(
              title: "Portion",
              color: blackColor,
              fontSize: fontSize15,
              fontWeight: fontWeightBold,
            ),
            SizedBox(height: 10),
            //mins,num, add
            Row(
              children: [
                //mins
                CustomWidget(
                  color: redColor,
                  borderRadius: borderRadius10,
                  height: 35,
                  width: 35,
                  child: Center(
                    child: IconButton(
                      icon: Icon(
                        Icons.remove_rounded,
                        size: iconSize20,
                        color: whiteColor,
                        fontWeight: fontWeightBold,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                //num
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CustomText(
                    title: "0",
                    color: blackColor,
                    fontSize: fontSize20,
                    fontWeight: fontWeightBold,
                  ),
                ),
                //add
                CustomWidget(
                  color: redColor,
                  borderRadius: borderRadius10,
                  height: 35,
                  width: 35,
                  child: IconButton(
                    icon: Icon(
                      Icons.add_rounded,
                      size: iconSize20,
                      color: whiteColor,
                      fontWeight: fontWeightBold,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
