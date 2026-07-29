import 'package:flutter/material.dart';
import '../core/contants.dart';
import '../widgets/home/header_home_screen.dart';
import '../widgets/home/list_of_categories.dart';
import '../widgets/home/list_of_items.dart';
import '../widgets/home/row_search_filter.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  String selectedCategory = "All";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: redColor,
        shape: CircleBorder(),
        child: Icon(
          Icons.add_rounded,
          size: iconSize30,
          color: whiteColor,
          fontWeight: fontWeightBold,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: SafeArea(
        child: Column(
          children: [
            //text foodgo, text order your , profile image
            HeaderHomeScreen(),
            //search bar, icon filter
            RowSearchFilter(),

            //list of categories
            ListOfCategories(
              selectedCategory: selectedCategory,
              onCategorySelected: (category) {
                setState(() {
                  selectedCategory = category;
                });
              },
            ),

            //list of items
            ListOfItems(selectedCategory: selectedCategory),
          ],
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        color: redColor,
        shape: CircularNotchedRectangle(),
        elevation: 4,
        notchMargin: 8,
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [


            //home
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 0;
                });
              },
              icon: Icon(
                Icons.home_filled,
                color: whiteColor,
                size: currentIndex == 0 ? iconSize30 : iconSize25,
              ),
            ),
            //profile
            Padding(
              padding: const EdgeInsets.only(right: 70),
              child: IconButton(
                icon: Icon(
                  Icons.perm_identity_sharp,
                  color: whiteColor,
                  size: currentIndex == 1 ? iconSize30 : iconSize25,
                ),
                onPressed: () {
                  setState(() {
                    currentIndex = 1;
                  });
                },
              ),
            ),
            //chat
            IconButton(
              icon: Icon(
                Icons.chat_outlined,
                color: whiteColor,
                size: currentIndex == 2 ? iconSize30 : iconSize25,
              ),
              onPressed: () {
                setState(() {
                  currentIndex = 2;
                });
              },
            ),
            //favorite
            IconButton(
              icon: Icon(
                Icons.favorite_rounded,
                color: whiteColor,
                size: currentIndex == 3 ? iconSize30 : iconSize25,
              ),
              onPressed: () {
                setState(() {
                  currentIndex = 3;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
