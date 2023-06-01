import 'package:flutter/material.dart';
import 'package:our_gazipur/widgets/custom_text.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  const CustomTextField({Key? key, required this.title, required this.hintText, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
            height: 12.0
        ),
        CustomText(text: title),
        const SizedBox(
            height: 5.0
        ),
        Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffECECEC)),
                borderRadius: BorderRadius.circular(10)),
            height:title=='ঠিকানা'? 50:100,
            width: size.width,
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle:const TextStyle(
                    fontFamily: 'Sharif',
                  )),
              minLines: 1, //Normal textInputField will be displayed
              maxLines: 5, // when user presses enter it will adapt to it
            )),
      ],
    );
  }
}
