import 'package:flutter/material.dart';
import 'package:foodapps/views/favorite_page.dart';
import 'package:foodapps/views/profile_page.dart';
import '../views/home.dart';
import '../views/order_pages.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTabIndex = 0;
  Home home;
  List<Widget> pages;
  Widget currentPage;
  OrderPage orderPage;
  FavoritePage favoritePage;
  ProfilePage profilePage;
  @override
  void initState() {
    super.initState();
    home = Home();
    favoritePage = FavoritePage();
    profilePage = ProfilePage();
    orderPage = OrderPage();
    pages = [home, orderPage, favoritePage, profilePage];
    currentPage = home;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
            currentPage = pages[index];
          });
        },
        currentIndex: currentTabIndex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), title: Text("Orders")),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text("Favorite")),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text("Profile")),
        ],
      ),
      body: currentPage,
    );
  }
}
