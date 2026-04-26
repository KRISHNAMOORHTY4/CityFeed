import 'package:city_feed/core/constants/app_colors.dart';
import 'package:city_feed/presentation/home/botton_navbar.dart';
import 'package:city_feed/presentation/tapbars/post_tapbar_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          "BHARATNOVA",
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Row(
              children: const [
                Icon(Icons.location_on, color: Colors.black, size: 18),
                SizedBox(width: 4),
                Text("Mumbai", style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            TabBar(
              indicatorColor: AppColors.primary,
              indicatorWeight: 3,
              labelColor: AppColors.primary,
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: Colors.grey,
              labelStyle: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              tabs: const [
                Tab(text: "Post"),
                Tab(text: "Nova"),
                Tab(text: "News"),
                Tab(text: "Article"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
             PostTapbarView(),
                  Center(child: Text("Novo")),
                  Center(child: Text("News")),
                  Center(child: Text("Apple")),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 140,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 0,
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.05),
                    offset: Offset(4, 0),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 36,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: BottonNavbar(),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: Container(
        margin: EdgeInsets.only(top: 70),
        child: FloatingActionButton(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(100),
          ),
          onPressed: () {},
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
