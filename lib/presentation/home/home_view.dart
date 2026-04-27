import 'package:city_feed/core/constants/app_colors.dart';
import 'package:city_feed/core/utils/screen_utils.dart';
import 'package:city_feed/presentation/home/botton_navbar.dart';
import 'package:city_feed/presentation/home/home_viewmodel.dart';
import 'package:city_feed/presentation/tapbars/post_tapbar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    final cityAsync = ref.watch(cityProvider);

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
            fontSize: ScreenUtils.isMopile(context) ? 17 : 19,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: ScreenUtils.screenWidth(context) / 32.72666666666667,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.black,
                  size: ScreenUtils.isMopile(context) ? 18 : 20,
                ),
                SizedBox(width: ScreenUtils.screenWidth(context) / 98.18),
                cityAsync.when(
                  data: (city) => Text(city ?? "Unknown"),
                  loading: () => Text("Loading..."),
                  error: (e, s) => Text("Error"),
                ),
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
              labelStyle: TextStyle(
                fontFamily: 'Poppins',
                fontSize: ScreenUtils.isMopile(context) ? 18 : 20,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: TextStyle(
                fontFamily: 'Poppins',
                fontSize: ScreenUtils.isMopile(context) ? 18 : 20,
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
                  Center(child: Text("Article")),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: ScreenUtils.screenHeight(context) / 5.896071428571429,
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
              top: ScreenUtils.screenHeight(context) / 22.92916666666667,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: BottonNavbar(),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: Container(
        margin: EdgeInsets.only(
          top: ScreenUtils.screenHeight(context) / 11.79214285714286,
        ),
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
