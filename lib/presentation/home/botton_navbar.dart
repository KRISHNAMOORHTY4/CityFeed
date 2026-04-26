import 'package:city_feed/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BottonNavbar extends StatelessWidget {
  const BottonNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return  BottomAppBar(
      color: Colors.white,
    shape: CircularNotchedRectangle(),
    notchMargin: 8.0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(Icons.home,color: AppColors.primary,),
        Icon(Icons.search),
        Icon(Icons.videocam_off_outlined),
        SizedBox(width: 20,),
        Icon(Icons.play_circle_outline),
        Icon(Icons.notifications),
        Icon(Icons.person),
        
      ],
    ),
  );

 
  }
}