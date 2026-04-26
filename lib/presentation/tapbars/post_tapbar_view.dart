import 'package:city_feed/core/constants/app_colors.dart';
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
    Widget customActionIcons({required IconData icon, required subTitle}) {
      return Row(
        children: [
          Icon(icon, size: 16, color: Colors.grey.shade400),
          SizedBox(width: 4),
          Text(
            "$subTitle",
            style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
          ),
        ],
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        // await postTapbarAsyncProviderRead.refreshData();
        print("Karna");
      },
      child: postTapbarAsyncProviderUi.when(
        data: (data) {
          return ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
            itemCount: data.length,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            itemBuilder: (context, index) {
              final currentData = data[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(),
                            SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentData.name,
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "krishna",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.location_pin,
                                      size: 15,
                                      color: Colors.grey.shade500,
                                    ),
                                    Text(
                                      "Mumbai ,india",
                                      style: TextStyle(
                                        fontSize: 13,
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
                    SizedBox(height: 10),
                    Container(
                      height: 200,
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
