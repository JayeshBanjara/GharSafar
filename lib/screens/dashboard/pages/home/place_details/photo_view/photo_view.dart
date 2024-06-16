import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../utils/global.dart';
import 'photo_view_controller.dart';

class PhotoViewPage extends StatefulWidget {
  const PhotoViewPage({super.key});

  @override
  State<PhotoViewPage> createState() => _PhotoViewPageState();
}

class _PhotoViewPageState extends State<PhotoViewPage> {
  final photoViewController = Get.put(PhotoViewController());

  @override
  void dispose() {
    Get.delete<PhotoViewController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: PhotoViewController(),
        builder: (cont) {
          photoViewController.context = context;
          return Scaffold(
            appBar: AppBar(
              leading:  InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios_new,size: 20,)),
              centerTitle: true,
              backgroundColor: Colors.white,
              title: const Text('Gallery',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.black2Color,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      fontFamily: AppConstants.fontFamily)),
            ),
            body: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              color: Colors.white,
              padding: const EdgeInsets.all(AppConstants.screenPadding),
              child:  Center(
                child: InteractiveViewer(
                  child: Image.asset(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    ImageConstants.imgGallery,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ),
          );
        });
  }
}
