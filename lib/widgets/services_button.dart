import 'package:flutter/material.dart';
import 'package:our_gazipur/utils/constants.dart';
import 'package:our_gazipur/widgets/custom_text.dart';

class ServicesButton extends StatelessWidget {
  final String image;
  final String text;
  const ServicesButton({Key? key, required this.image, required this.text,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [

          Image.asset(image,height: 50,),
          CustomText(text: text)
      ],
    );
  }
}

