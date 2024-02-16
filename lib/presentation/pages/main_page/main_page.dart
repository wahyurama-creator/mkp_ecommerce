import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mkp_ecommerce/presentation/pages/cart_page/cart_page.dart';
import 'package:mkp_ecommerce/presentation/pages/product_list_page/product_list_page.dart';
import 'package:mkp_ecommerce/presentation/widgets/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:mkp_ecommerce/presentation/widgets/bottom_nav_bar/bottom_nav_bar_item.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  final PageController _pageController = PageController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (position) {
              setState(() {
                selectedIndex = position;
              });
            },
            children: const [
              Center(
                child: ProductListPage(),
              ),
              Center(
                child: CartPage(),
              ),
            ],
          ),
          BottomNavBar(
            items: [
              BottomNavBarItem(
                index: 0,
                isSelected: selectedIndex == 0,
                title: 'Home',
                icon: Icons.home_outlined,
                selectedIcon: Icons.home,
              ),
              BottomNavBarItem(
                index: 1,
                isSelected: selectedIndex == 1,
                title: 'Cart',
                icon: Icons.shopping_cart_outlined,
                selectedIcon: Icons.shopping_cart,
              ),
            ],
            onTap: (position) {
              selectedIndex = position;
              _pageController.animateToPage(
                selectedIndex,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
              );
            },
            selectedIndex: 0,
          ),
        ],
      ),
    );
  }
}
