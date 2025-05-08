import 'package:flutter/material.dart';
import 'package:test_task/constants/images.dart';
import 'package:test_task/utils/spacing.dart';
import 'package:test_task/views/pages/categories/categories.dart';
import 'package:test_task/views/pages/favourites/favourites.dart';
import 'package:test_task/views/pages/product/product.dart';

import '../mitt/mitt_konto.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  final List<Widget> screens = [
    const ProductView(),
    const Categories(),
    Favourites(),
    MittKonto(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: screens[_selectedIndex],
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
          child: Column(
            children: [
              Spacing.y(0.5),
              BottomNavigationBar(
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                backgroundColor: Colors.black,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey,
                selectedLabelStyle: textTheme.bodySmall?.copyWith(
                  fontSize: 10,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
                unselectedLabelStyle: textTheme.bodySmall?.copyWith(
                  fontSize: 10,
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                ),
                iconSize: 24,
                enableFeedback: false,
                selectedIconTheme: const IconThemeData(size: 24),
                unselectedIconTheme: const IconThemeData(size: 24),
                items: [
                  BottomNavigationBarItem(
                    icon: Column(
                      children: [
                        Image.asset(AppImages.b1, scale: 3.5),
                        const SizedBox(height: 6),
                      ],
                    ),
                    label: "Product",
                  ),
                  BottomNavigationBarItem(
                    icon: Column(
                      children: [
                        Image.asset(AppImages.b2, scale: 3.5),
                        const SizedBox(height: 6),
                      ],
                    ),
                    label: "Categories",
                  ),
                  BottomNavigationBarItem(
                    icon: Column(
                      children: [
                        Image.asset(AppImages.b3, scale: 3.5),
                        const SizedBox(height: 6),
                      ],
                    ),
                    label: "Favourites",
                  ),
                  BottomNavigationBarItem(
                    icon: Column(
                      children: [
                        Image.asset(AppImages.b4, scale: 3.5),
                        const SizedBox(height: 6),
                      ],
                    ),
                    label: "Mitt konto",
                  ),
                ],
              ),
              Spacing.y(0.5),
            ],
          ),
        ),
      ),
    );
  }
}
