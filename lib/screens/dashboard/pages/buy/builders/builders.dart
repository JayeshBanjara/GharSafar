import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/global.dart';
import '../builders_detail/builders_detail.dart';
import 'builders_controller.dart';

class BuildersPage extends StatefulWidget {
  const BuildersPage({super.key});

  @override
  State<BuildersPage> createState() => _BuildersPageState();
}

class _BuildersPageState extends State<BuildersPage> {

  final buildersLoanController = Get.put(BuildersController());

  @override
  void dispose() {
    Get.delete<BuildersController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: BuildersController(),
        builder: (cont) {
          buildersLoanController.context = context;
          return Scaffold(
            body: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(AppConstants.screenPadding),
              child: Column(
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
                        child: Text('Builders',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.black2Color,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                fontFamily: AppConstants.fontFamily)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25.0),

                  Expanded(
                    child: InkWell(
                      onTap:(){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const BuildersDetailPage()));
                      } ,
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 15,
                            childAspectRatio: 2.6 / 2),
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: buildersLoanController.builderList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 15),
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.grey2BorderColor),
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Column(
                              children: [
                                Image.asset(
                                  ImageConstants.imgBakeri,
                                ),
                                const SizedBox(height: 10.0),
                                 Text(buildersLoanController.builderList[index],
                                    style: const TextStyle(
                                        color: AppColors.darkBlueColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        fontFamily: AppConstants.fontFamily))
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
