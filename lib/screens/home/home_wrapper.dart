import 'package:flutter/material.dart';
import 'package:foodmarket/screens/home/home_screen.dart';
import 'package:foodmarket/screens/home/menu_model.dart';
import 'package:foodmarket/screens/order/order_screen.dart';
import 'package:foodmarket/screens/profile/profile_screen.dart';

class HomeWrapper extends StatefulWidget {
  const HomeWrapper({super.key});

  @override
  State<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  PageController pageController = PageController(initialPage: 0);

  List<Widget> pages = const [HomeScreen(), OrderScreen(), ProfileScreen()];

  List<MenuModel> bottomNavItems = [
    MenuModel("Home", Icons.home, const Color(0xFFFFC700)),
    MenuModel("Order", Icons.shopping_cart, Colors.grey),
    MenuModel("Profile", Icons.person, Colors.grey),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: bottomNavItems
            .map((item) => BottomNavigationBarItem(
                  icon: Icon(
                    item.icon,
                    color: pageController.hasClients
                        ? pageController.page == bottomNavItems.indexOf(item)
                            ? const Color(0xFFFFC700)
                            : Colors.grey
                        : item.color,
                  ),
                  label: item.title,
                ))
            .toList(),
        onTap: (index) {
          setState(() {
            if (pageController.hasClients) {
              pageController.jumpToPage(index);
            }
          });
        },
      ),
    );
  }
}
