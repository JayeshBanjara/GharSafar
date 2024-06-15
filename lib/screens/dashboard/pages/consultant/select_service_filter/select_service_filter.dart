import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_safar/screens/dashboard/pages/consultant/select_service_filter/select_service_filter_controller.dart';

import '../../../../../utils/global.dart';

class SelectServiceFilterPage extends StatefulWidget {
  const SelectServiceFilterPage({super.key});

  @override
  State<SelectServiceFilterPage> createState() => _SelectServiceFilterPageState();
}

class _SelectServiceFilterPageState extends State<SelectServiceFilterPage> {

  final selectServiceFilterController = Get.put(SelectServiceFilterController());

  @override
  void dispose() {
    Get.delete<SelectServiceFilterController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SelectServiceFilterController(),
        builder: (cont) {
          selectServiceFilterController.context = context;
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
                        child: Text('Filter',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.black2Color,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                fontFamily: AppConstants.fontFamily)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30.0),

                   Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Select Service',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.black2Color,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  fontFamily: AppConstants.fontFamily)),
                          const SizedBox(height: 15.0),

                          GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 15,
                                childAspectRatio: 4.3 / 1),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: selectServiceFilterController.serviceList.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8),
                                decoration: BoxDecoration(
                                    border: Border.all(color: AppColors.borderColor),
                                    borderRadius: BorderRadius.circular(25.0)),
                                child: Text(selectServiceFilterController.serviceList[index],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: AppColors.grey14Color,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        fontFamily: AppConstants.fontFamily)),
                              );
                            },
                          ),

                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 10),
                    decoration: BoxDecoration(
                        color: AppColors.btnColor,
                        borderRadius: BorderRadius.circular(25.0)),
                    child: Text('Save Filter',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            fontFamily: AppConstants.fontFamily)),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
