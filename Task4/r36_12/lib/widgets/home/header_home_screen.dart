import 'package:flutter/material.dart';

import '../../core/contants.dart';
import '../../core/images.dart';
import '../common/custom_text.dart';
import '../common/cutom_text_logo.dart';

class HeaderHomeScreen extends StatelessWidget {
  const HeaderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //text foodgo, text order your , profile image
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //text foodgo, text order your
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //text foodgo
              CustomTextLogo(
                title: "Foodgo",
                color: blackColor,
                fontSize: fontSize40,
              ),
              //text order your
              CustomText(
                title: "Order you favourite food!",
                color: textGreyColor,
                fontSize: fontSize20,
              ),
            ],
          ),
          //profile image
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(borderRadius15),
            child: Image.asset(
              Images.profileImage,
              fit: BoxFit.fill,
              height: 55,
            ),
          ),
        ],
      ),
    );
  }
}
