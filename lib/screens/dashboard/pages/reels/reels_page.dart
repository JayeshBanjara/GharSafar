
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ghar_safar/screens/dashboard/pages/reels/reels_page_controller.dart';
import 'package:ghar_safar/utils/global.dart';
import 'package:video_player/video_player.dart';

import 'content_screen.dart';


class ReelsPage extends StatefulWidget {
  const ReelsPage({super.key});

  @override
  State<ReelsPage> createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {


  final List<String> videos = [
    'https://assets.mixkit.co/videos/preview/mixkit-young-mother-with-her-little-daughter-decorating-a-christmas-tree-39745-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-mother-with-her-little-daughter-eating-a-marshmallow-in-nature-39764-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-winter-fashion-cold-looking-woman-concept-video-39874-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-womans-feet-splashing-in-the-pool-1261-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4'
  ];


  final reelsController =
  Get.put(ReelsPageController());

  @override
  void dispose() {
    Get.delete<ReelsPageController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ReelsPageController(),
        builder: (cont) {
          reelsController.context = context;
          return Scaffold(
            body: SafeArea(
              child: Container(
                padding: EdgeInsets.zero,
                color: Colors.white,
                child: Stack(
                  children: [
                    Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return ContentScreen(
                          src: videos[index],
                        );
                      },
                      itemCount: videos.length,
                      scrollDirection: Axis.vertical,
                    ),
                    /*Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                      child: InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back_ios_new,size: 20,)),
                    ),*/
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: SvgPicture.asset(ImageConstants.icShare),
                        ),
                        const SizedBox(height: 30,),
                        Container(
                          height: 110,
                          padding: const EdgeInsets.only(left: 15),
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder:
                                  (BuildContext context, int index) {
                                return  Container(
                                  width: MediaQuery.of(context).size.width /1.2,
                                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 10.0, 8.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: AppColors.grey2BorderColor),
                                      borderRadius: BorderRadius.circular(20.0)),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(15.0),
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 15.0),
                                          color: AppColors.grey16Color,
                                          child: Image.asset(
                                            ImageConstants.imgUpcoming,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10.0),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Text('Sahe Luxury House',
                                                style: TextStyle(
                                                    color: AppColors.black1Color,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16,
                                                    fontFamily: AppConstants.fontFamily)),
                                            const SizedBox(height: 5.0),
                                            const Text('4 BHK Luxurious Apartments',
                                                style: TextStyle(
                                                    color: AppColors.black1Color,
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 14,
                                                    fontFamily: AppConstants.fontFamily)),
                                            const SizedBox(height: 10.0),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  ImageConstants.icLocation,
                                                  width: 9.0,
                                                  height: 10.0,
                                                ),
                                                const SizedBox(width: 5.0),
                                                const Expanded(
                                                  child: Text('Maharashtra Society, Ahmedabad',
                                                      style: TextStyle(
                                                          overflow: TextOverflow.ellipsis,
                                                          color: AppColors.grey10Color,
                                                          fontWeight: FontWeight.w300,
                                                          fontSize: 10,
                                                          fontFamily: AppConstants.fontFamily)),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }, separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(width: 10.0);
                          },),
                        ),
                        const SizedBox(height: 15,)
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
