import 'package:another_transformer_page_view/another_transformer_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ghar_safar/screens/dashboard/pages/home/tips/tips_controller.dart';

import '../../../../../utils/all_transformers.dart';
import '../../../../../utils/global.dart';

class TipsPage extends StatefulWidget {
  const TipsPage({super.key});

  @override
  State<TipsPage> createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {

  final tipsController = Get.put(TipsController());

  @override
  void dispose() {
    Get.delete<TipsController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: TipsController(),
        builder: (cont) {
          return Scaffold(
            body:  Container(
              color: Colors.white,
              padding: const EdgeInsets.all(AppConstants.screenPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 45),
                  Row(
                    children: [
                      InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back_ios_new,size: 20,)),
                      const Expanded(
                        child: Text('Tips',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                fontFamily: AppConstants.fontFamily)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25.0),
                 /* Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: 2,
                              itemBuilder:
                                  (BuildContext context, int index) {
                                return tipsItem();
                              },
                            separatorBuilder: (BuildContext context, int index) {
                                return const SizedBox(
                                  height: 15,
                                );
                            },),

                        ],
                      ),
                    ),
                  ),*/

                  Expanded(
                    child: TransformerPageView(
                      scrollDirection: Axis.vertical,
                      itemCount: 3,
                      loop: false,
                      transformer:DeepthPageTransformer(),
                      itemBuilder: (context, index) {
                        return  tipsItem() ;
                      },
                    ),
                  ),
                ],
              ),
            ),
          );

        });
  }

  Widget tipsItem() {
    return Column(
      children: [
        Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
              side: const BorderSide(color: AppColors.grey2BorderColor)
            ),
            color: Colors.white,
            elevation: 4,
          child: Container(
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height/1.2,
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0)),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Image.asset(
                    width: double.maxFinite,
                    ImageConstants.imgSampleTips,
                  ),
                ),
                const SizedBox(height: 10.0),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text('Publishing and graphic design,Lorem ipsum is a placeholder',
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                          fontFamily: AppConstants.fontFamily)),
                ),
                const SizedBox(height: 10.0),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry standard dummy text ever since the1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,.',
                      style: TextStyle(
                          color: AppColors.grey10Color,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontFamily: AppConstants.fontFamily)),
                ),
                const SizedBox(height: 10.0),
              ],
            ),
          ),
            ),
      ],
    );
  }
}
