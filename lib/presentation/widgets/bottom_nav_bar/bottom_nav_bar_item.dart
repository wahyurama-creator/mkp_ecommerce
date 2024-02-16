import 'package:flutter/material.dart';
import 'package:mkp_ecommerce/presentation/misc/methods.dart';

class BottomNavBarItem extends StatelessWidget {
  final int index;
  final bool isSelected;
  final String title;
  final IconData icon;
  final IconData selectedIcon;

  const BottomNavBarItem({
    super.key,
    required this.index,
    required this.isSelected,
    required this.title,
    required this.icon,
    required this.selectedIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 25,
          height: 25,
          child: Icon(
            isSelected ? selectedIcon : icon,
            color: isSelected ? Colors.white : Colors.grey.shade500,
          ),
        ),
        verticalSpace(4),
        Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
