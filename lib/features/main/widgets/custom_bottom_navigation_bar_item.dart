import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBarItem extends BottomNavigationBarItem {
  final String imgSelected;
  final String imgUnselected;
  final String title;

  CustomBottomNavBarItem({
    required this.imgSelected,
    required this.imgUnselected,
    required this.title,
  }) : super(
          icon: SizedBox.shrink(),
          label: "",
        );

  @override
  String? get label => "";

  @override
  Widget get icon => Container(
        color: Colors.green,
        child: Column(
          children: [
            Image.asset(
              imgUnselected,
              height: 10,
              width: 10,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      );

  @override
  Widget get activeIcon => Container(
        color: Colors.red,
        child: Column(
          children: [
            Image.asset(
              imgSelected,
              height: 10,
              width: 10,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      );
}
