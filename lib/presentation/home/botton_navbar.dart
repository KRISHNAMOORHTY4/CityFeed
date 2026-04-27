import 'package:city_feed/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BottonNavbar extends StatelessWidget {
  const BottonNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      shape: CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.home, color: AppColors.primary),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.videocam_off_outlined)),
          SizedBox(width: 30),
          IconButton(onPressed: () {}, icon: Icon(Icons.play_circle_outline)),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
