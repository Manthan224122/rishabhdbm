import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      itemCount: items.length,
      tabBuilder: (int index, bool isActive) {
        final item = items[index];
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              item.iconName,
              color: isActive ? Colors.white : Colors.grey[300], // Active state styling
              size: 24,
            ),
            const SizedBox(height: 5), // Adjust spacing
            Text(
              item.title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: isActive ? Colors.white : Colors.grey[300], // Active state styling
              ),
            ),
          ],
        );
      },
      splashColor: Colors.transparent,
      splashSpeedInMilliseconds: 0,
      elevation: 0,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 16,
      rightCornerRadius: 16,
      backgroundColor: Colors.green,
      activeIndex: _bottomNavIndex,
      onTap: (index) {
        setState(() {
          _bottomNavIndex = index; // Update the selected index
        });
      },
    );
  }
}

class BottomNavigationBarItemModel {
  final IconData iconName; // Changed from Icons to IconData
  final String title;

  BottomNavigationBarItemModel({
    required this.iconName,
    required this.title,
  });
}

final List<BottomNavigationBarItemModel> items = [
  BottomNavigationBarItemModel(
    iconName: Icons.home,
    title: 'Home',
  ),
  BottomNavigationBarItemModel(
    iconName: Icons.shopping_cart, // Valid icon
    title: 'Order',
  ),
  BottomNavigationBarItemModel(
    iconName: Icons.house_siding, // Valid icon
    title: 'Others',
  ),
  BottomNavigationBarItemModel(
    iconName: Icons.more_horiz, // Valid icon
    title: 'More',
  ),
];
