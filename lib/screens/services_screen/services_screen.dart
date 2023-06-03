import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:our_gazipur/api_service/api_service.dart';
import 'package:our_gazipur/screens/services_screen/problem_details_screen.dart';
import 'package:our_gazipur/utils/colors.dart';
import 'package:our_gazipur/utils/routes.dart';
import 'package:our_gazipur/utils/utils.dart';
import 'package:our_gazipur/widgets/custom_text.dart';
import 'package:our_gazipur/widgets/custom_textfield.dart';
import 'package:our_gazipur/widgets/dropdown_menu_button.dart';

class ServicesScreen extends StatefulWidget {
  final String title;
  final String image;
  const ServicesScreen({Key? key, required this.title, required this.image})
      : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  Uint8List? _file;
  Uint8List? _file2;
  Uint8List? _file3;

  String selectedItem = "রাস্তায় অবনতি";
  String selectedWard = '১';

  final TextEditingController addressController=TextEditingController();
  final TextEditingController opinionController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Center(
                  child: CustomText(
                      text: 'এখানে ছবি তুলুন এবং জমা দিন',
                      size: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sharif')),
              const SizedBox(height: 30),

              /// Pic Image Button ............................
              _buildDottedBorder(size),
              const SizedBox(height: 20),

              /// Selected Image show here..................
              showImageContainer(),
              const SizedBox(height: 20),
              Row(
                children: [
                  DropDownMenuButton(
                    title: 'সমস্যার ধরন',
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedItem = newValue!;
                      });
                    },
                    value: selectedItem,
                  ),
                  const SizedBox(width: 22,),
                  DropDownMenuButton(
                    title: 'ওয়ার্ড',
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedWard = newValue!;
                      });
                    },
                    value: selectedWard,
                  ),
                ],
              ),
              const SizedBox(height: 12.0),

               CustomTextField(
                 controller: addressController,
                title: 'ঠিকানা',
                hintText: 'আপনার ঠিকানা লিখুন....',
              ),

               CustomTextField(
                controller: opinionController,
                title: 'মতামত',
                hintText: 'আপনার মতামত এখানে লিখুন....',
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Spacer(),
                  InkWell(
                    onTap: () async{
                      await ApiService.instance.complainData(
                          category: selectedItem,
                          ward: selectedWard,
                          address: addressController.text,
                          opinion: opinionController.text,
                          imageBytes: _file!,
                          userId: '45',
                      );

                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: primaryColor),
                      child: const CustomText(
                        text: "জমা দিন",
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Sharif',
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      leading: const BackButton(
        color: primaryColor,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            text: widget.title,
            color: primaryColor,
            fontFamily: 'Sharif',
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            width: 10,
          ),
          Image.asset(
            widget.image,
            width: 30,
          )
        ],
      ),
    );
  }

  Widget showImageContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _file == null
            ? SizedBox(
                height: 92,
                width: 100,
                child: Image.asset(
                  'assets/images/default.jpg',
                  fit: BoxFit.cover,
                ))
            : SizedBox(
                height: 90,
                width: 100,
                child: Image.memory(
                  _file!,
                  fit: BoxFit.cover,
                ),
              ),
        const SizedBox(
          width: 8,
        ),
        _file2 == null
            ? SizedBox(
                height: 92,
                width: 100,
                child: Image.asset(
                  'assets/images/default.jpg',
                  fit: BoxFit.cover,
                ))
            : SizedBox(
                height: 90,
                width: 100,
                child: Image.memory(
                  _file2!,
                  fit: BoxFit.cover,
                ),
              ),
        const SizedBox(
          width: 8,
        ),
        _file3 == null
            ? SizedBox(
                height: 92,
                width: 100,
                child: Image.asset(
                  'assets/images/default.jpg',
                  fit: BoxFit.cover,
                ))
            : SizedBox(
                height: 90,
                width: 100,
                child: Image.memory(
                  _file3!,
                  fit: BoxFit.cover,
                ),
              ),
      ],
    );
  }

  Widget _buildDottedBorder(Size size) {
    return DottedBorder(
      color: Colors.black,
      strokeWidth: 1.5,
      dashPattern: const [
        10,
        10,
      ],
      child: Container(
        alignment: Alignment.center,
        height: 110,
        width: size.width,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InkWell(
                onTap: () async {
                  Uint8List file = await pickImage(ImageSource.gallery);
                  if (file.isNotEmpty) {
                    setState(() {
                      if (_file == null) {
                        _file = file;
                      } else if (_file2 == null) {
                        _file2 = file;
                      } else {
                        _file3 = file;
                      }
                    });
                  }
                },
                child: const Icon(
                  Icons.cloud_upload_outlined,
                  size: 40,
                  color: Colors.cyan,
                )),
            const SizedBox(
              height: 8,
            ),
            const CustomText(
              text: 'এখানে গ্যালারি ছবি ড্রপ করুন',
              color: primaryColor,
              fontFamily: 'Sharif',
            )
          ],
        ),
      ),
    );
  }
}
