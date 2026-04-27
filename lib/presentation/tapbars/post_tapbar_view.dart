import 'package:city_feed/core/constants/app_colors.dart';
import 'package:city_feed/core/utils/screen_utils.dart';
import 'package:city_feed/presentation/tapbars/post_tapbar_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readmore/readmore.dart';

class PostTapbarView extends ConsumerWidget {
  const PostTapbarView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postTapbarAsyncProviderUi = ref.watch(postTapbarAsyncProvider);
    final postTapbarAsyncProviderRead = ref.read(
      postTapbarAsyncProvider.notifier,
    );
    final loadMoreLoaderUi = ref.watch(loadMoreLoader);
    final ScrollController _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        postTapbarAsyncProviderRead.loadMore();
      }
    });
    Widget customActionIcons({required IconData icon, required subTitle}) {
      return Row(
        children: [
          Icon(icon, size: ScreenUtils.isMopile(context) ? 16 : 19, color: Colors.grey.shade400),
          SizedBox(width: ScreenUtils.screenWidth(context)/98.23),
          Text(
            "$subTitle",
            style: TextStyle(color: Colors.grey.shade700, fontSize: ScreenUtils.isMopile(context) ? 12 : 14),
          ),
        ],
      );
    }

    print("width :${ScreenUtils.screenWidth(context)}");
     print("height :${ScreenUtils.screenHeight(context)}");

    return RefreshIndicator(
      onRefresh: () async {
        await postTapbarAsyncProviderRead.refreshData();

      },
      child: postTapbarAsyncProviderUi.when(
        data: (data) {
          return ListView.builder(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: data.length,
            padding: EdgeInsets.symmetric(horizontal: ScreenUtils.screenWidth(context)/19.636, vertical: ScreenUtils.screenHeight(context)/55.03),
            itemBuilder: (context, index) {
              final currentData = data[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: ScreenUtils.screenHeight(context)/82.545),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.grey.shade300,
                              backgroundImage: NetworkImage(currentData.imageurl),
                            ),
                            SizedBox(width: ScreenUtils.screenWidth(context)/26.18133333333333),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentData.name,
                                  style: TextStyle(
                                    fontSize: ScreenUtils.isMopile(context) ? 17 : 19,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "krishna",
                                  style: TextStyle(
                                    fontSize: ScreenUtils.isMopile(context) ? 13 : 15,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.location_pin,
                                      size:  ScreenUtils.isMopile(context) ? 15 : 17,
                                      color: Colors.grey.shade500,
                                    ),
                                    Text(
                                      "Mumbai ,india",
                                      style: TextStyle(
                                        fontSize:  ScreenUtils.isMopile(context) ? 13 : 15,
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Icon(Icons.more_vert),
                      ],
                    ),
                    ReadMoreText(
                      "${currentData.description}.${currentData.description}.${currentData.description}.${currentData.description}",
                      trimLength: 500,
                      textAlign: TextAlign.justify,
                      trimCollapsedText: "Read More",
                      moreStyle: TextStyle(
                        color: AppColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primary,
                      ),
                    ),
                    SizedBox(height: ScreenUtils.screenHeight(context)/82.545),
                    Container(
                      height: ScreenUtils.screenHeight(context)/ 4.12725,
                      width: MediaQuery.of(context).size.width,

                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                        child: Image.network(
                          "${currentData.imageurl}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                        border: Border(
                          left: BorderSide(color: Colors.grey.shade300),
                          right: BorderSide(color: Colors.grey.shade300),
                          bottom: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          customActionIcons(
                            icon: Icons.favorite_border,
                            subTitle: "228",
                          ),
                          customActionIcons(
                            icon: Icons.chat_bubble_outline,
                            subTitle: "18",
                          ),

                          customActionIcons(icon: Icons.repeat, subTitle: "48"),
                          customActionIcons(
                            icon: Icons.remove_red_eye_outlined,
                            subTitle: "48",
                          ),
                          customActionIcons(
                            icon: Icons.bookmark_border,
                            subTitle: "20",
                          ),

                          customActionIcons(
                            icon: Icons.share,
                            subTitle: "Share",
                          ),
                        ],
                      ),
                    ),
                    if (loadMoreLoaderUi && data.length == index + 1)
                      Center(
                        child: Column(
                          children: [
                            SizedBox(height: ScreenUtils.screenHeight(context)/ 27.515),
                            CircularProgressIndicator(
                              backgroundColor: Colors.white,
                              color: AppColors.primary,
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              );
            },
          );
        },
        error: (err, s) => Center(child: Text(err.toString())),
        loading: () => Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
