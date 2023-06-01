import 'package:flutter/material.dart';
import 'package:our_gazipur/utils/constants.dart';
import 'package:our_gazipur/widgets/custom_text.dart';

class DropDownMenuButton extends StatelessWidget {
  final String title;
  final String value;
  final void Function(String?)? onChanged;
  const DropDownMenuButton({
    Key? key,
    required this.title,
    required this.value,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
            text: title,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF7B7979),
            fontFamily: 'Sharif'),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.only(left: 0, right: 0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffECECEC)),
              borderRadius: BorderRadius.circular(10)),
          height: 40,
          width:title=='ওয়ার্ড'? 110:220,
          child: DropdownButton<String>(
            value: value,
            icon: Padding(
              padding: title == 'ওয়ার্ড'
                  ?  EdgeInsets.zero
                  : EdgeInsets.zero,
              child: const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 30,
              ),
            ),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.black),
            underline: Container(),
            onChanged: onChanged,
            items: title == 'ওয়ার্ড'
                ? wardList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: EdgeInsets.zero,
                          child: Center(
                            child: CustomText(
                              text: value,
                              size: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Sharif',
                            ),
                          ),
                        ));
                  }).toList()
                : problemItem.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value,
                        child: CustomText(
                          text: value,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Sharif',
                        ));
                  }).toList(),
          ),
        ),
      ],
    );
  }
}
