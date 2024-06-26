import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ghar_safar/screens/builder/builder_registration/post_property/property_features_controller.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../utils/custom_text_form_field.dart';
import '../../../../../../utils/global.dart';
import '../../builder_dashboard.dart';

class PropertyFeaturesPage extends StatefulWidget {
  const PropertyFeaturesPage({super.key});

  @override
  State<PropertyFeaturesPage> createState() => _PropertyFeaturesPageState();
}

class _PropertyFeaturesPageState extends State<PropertyFeaturesPage> {
  final propertyFeaturesController =
  Get.put(PropertyFeaturesController());

  @override
  void dispose() {
    Get.delete<PropertyFeaturesController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: PropertyFeaturesController(),
        builder: (cont) {
          propertyFeaturesController.context = context;
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
                        child: Text('Post Property',
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

                  Expanded(child:
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Property Features',
                            style: TextStyle(
                                color: AppColors.black1Color,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                fontFamily: AppConstants.fontFamily)),
                        const SizedBox(height: 15.0),

                        CustomBoxTextFormField(
                            controller: propertyFeaturesController.propertyNameController,
                            keyboardType: TextInputType.text,
                            hintText: "Property Name",
                            borderRadius: BorderRadius.circular(25),
                            validator: (value) {
                              return null;
                            }),
                        const SizedBox(height: 15.0),

                        CustomBoxTextFormField(
                            controller: propertyFeaturesController.bedroomController,
                            keyboardType: TextInputType.text,
                            hintText: "Bedroom",
                            borderRadius: BorderRadius.circular(25),
                            validator: (value) {
                              return null;
                            }),
                        const SizedBox(height: 15.0),

                        CustomBoxTextFormField(
                            controller: propertyFeaturesController.bathroomPriceController,
                            keyboardType: TextInputType.text,
                            hintText: "Bathroom",
                            borderRadius: BorderRadius.circular(25),
                            validator: (value) {
                              return null;
                            }),
                        const SizedBox(height: 15.0),

                        CustomBoxTextFormField(
                            controller: propertyFeaturesController.floorController,
                            keyboardType: TextInputType.text,
                            hintText: "Floor",
                            borderRadius: BorderRadius.circular(25),
                            validator: (value) {
                              return null;
                            }),
                        const SizedBox(height: 15.0),

                        CustomBoxTextFormField(
                            controller: propertyFeaturesController.facingController,
                            keyboardType: TextInputType.text,
                            hintText: "Facing",
                            borderRadius: BorderRadius.circular(25),
                            validator: (value) {
                              return null;
                            }),
                        const SizedBox(height: 15.0),

                        CustomBoxTextFormField(
                            controller: propertyFeaturesController.furnishedController,
                            keyboardType: TextInputType.text,
                            hintText: "Furnished",
                            borderRadius: BorderRadius.circular(25),
                            validator: (value) {
                              return null;
                            }),
                        const SizedBox(height: 15.0),

                        CustomBoxTextFormField(
                            controller: propertyFeaturesController.ageController,
                            keyboardType: TextInputType.text,
                            hintText: "Construction Age",
                            borderRadius: BorderRadius.circular(25),
                            validator: (value) {
                              return null;
                            }),
                        const SizedBox(height: 15.0),

                        InkWell(
                          onTap: () {
                            FocusScope.of(propertyFeaturesController.context)
                                .requestFocus(FocusNode());
                            _shopImagePickerDialog(propertyFeaturesController);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: propertyFeaturesController.image == null
                                ? DottedBorder(
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(15),
                              color: AppColors.btnColor,
                              dashPattern: const [5, 5],
                              child: Container(
                                width: double.infinity,
                                height: 130,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(ImageConstants.icUpload,
                                      color: AppColors.btnColor,
                                      height: 55,
                                      width: 55,
                                    ),
                                    const Text('Upload Image',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: AppColors.black1Color,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                            fontFamily: AppConstants.fontFamily)),
                                  ],
                                ),
                              ),
                            )
                                : Container(
                              width: double.infinity,
                              height: 130,
                              decoration: BoxDecoration(
                               // color: AppColors.clientInfoValueColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                    propertyFeaturesController.image!,
                                    fit: BoxFit.fill,
                                    height: 150),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30.0),

                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => const BuilderDashboardPage()));
                          },
                          child: Container(
                            width: double.maxFinite,
                            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                            decoration: BoxDecoration(
                              color: AppColors.btnColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Text('Save',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                    fontFamily: AppConstants.fontFamily)),
                          ),
                        ),
                        const SizedBox(height: 5.0),

                      ],
                    ),
                  ))
                ],
              ),
            ),
          );
        });
  }

  Future _shopImagePickerDialog(PropertyFeaturesController propertyFeaturesController) async {
    await showDialog(
      context: propertyFeaturesController.context,
      builder: (cont) {
        return GetBuilder<PropertyFeaturesController>(
            init: PropertyFeaturesController(),
            builder: (cont) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                titlePadding: EdgeInsets.zero,
                actionsPadding: EdgeInsets.zero,
                backgroundColor: Colors.white,
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                insetPadding: const EdgeInsets.all(20),
                content: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Pick Upload Image",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black1Color),
                          ),
                          IconButton(
                              style:
                              const ButtonStyle(
                                tapTargetSize:
                                MaterialTapTargetSize
                                    .shrinkWrap, // the '2023' part
                              ),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              onPressed: () {
                                Navigator.pop(propertyFeaturesController.context);
                              },
                              icon: const Icon(Icons.close, color: AppColors.black1Color))
                        ],
                      ),
                      const SizedBox(height: 15,),
                      InkWell(
                        onTap: () {
                          Navigator.pop(propertyFeaturesController.context);
                          _getImage(
                              ImageSource.camera, propertyFeaturesController);
                        },
                        child: const Text(
                          'Open Camera',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: AppColors.black1Color),
                        ),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          Navigator.pop(propertyFeaturesController.context);
                          _getImage(
                              ImageSource.gallery, propertyFeaturesController);
                        },
                        child: const Text(
                          'Select From Gallery',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: AppColors.black1Color),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
      },
    );
  }

 /* _requestPermission(PropertyFeaturesController propertyFeaturesController) async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    PermissionStatus? info = statuses[Permission.storage];
    switch (info) {
      case PermissionStatus.denied:
        break;
      case PermissionStatus.granted:
        _shopImagePickerDialog(propertyFeaturesController);
        break;
      default:
        return Colors.grey;
    }
  }

  _storagePermission(PropertyFeaturesController propertyFeaturesController) async {
    final deviceInfo = await DeviceInfoPlugin().androidInfo;
    final androidVersion = int.parse(deviceInfo.version.release.split('.').first);
    if (androidVersion >= 13) {
      _shopImagePickerDialog(propertyFeaturesController);
    } else {
      _requestPermission(
          propertyFeaturesController);
    }

    return Colors.grey;
  }

  void _getImage(ImageSource imageSource,
      PropertyFeaturesController propertyFeaturesController) async {
    try {
      XFile? imageFile =
      await propertyFeaturesController.picker.pickImage(source: imageSource);
      if (imageFile == null) return;
      File tmpFile = File(imageFile.path);
      final appDir = await getApplicationDocumentsDirectory();
      final fileName = basename(imageFile.path);
      tmpFile = await tmpFile.copy('${appDir.path}/$fileName');
      propertyFeaturesController.image = tmpFile;
      propertyFeaturesController.update();
    } catch (e) {
      debugPrint('image-picker-error ${e.toString()}');
    }
  }*/
  void _getImage(
      ImageSource img,PropertyFeaturesController propertyFeaturesController
      ) async {
    XFile? xfilePick = await propertyFeaturesController.picker.pickImage(source: img);
    setState(
          () {
        if (xfilePick != null) {
          propertyFeaturesController.image = File(xfilePick.path);
        } else {
          ScaffoldMessenger.of(propertyFeaturesController.context).showSnackBar(// is this context <<<
              const SnackBar(content: Text('Nothing is selected')));
        }
      },
    );
  }
}
