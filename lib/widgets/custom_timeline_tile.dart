import 'package:flutter/material.dart';
import 'package:our_gazipur/utils/colors.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CustomTimeLineTile extends StatelessWidget {
  final String text;
  final bool isChecked;
  final bool isFirst;
  final bool isLast;
  final String dateText;
  const CustomTimeLineTile(
      {Key? key,
      required this.text,
      this.isChecked = true,
      this.isFirst = false,
      this.isLast = false, required this.dateText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      beforeLineStyle: LineStyle(
        thickness: 2,
        color: isChecked?primaryColor:const Color(0xFF8B8888)
      ),
      isFirst: isFirst,
      isLast: isLast,
      axis: TimelineAxis.horizontal,
      alignment: TimelineAlign.center,
      indicatorStyle: IndicatorStyle(
          width: 30,
          height: 30,
          indicator: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: isChecked ? primaryColor : const Color(0xFF8B8888),
                borderRadius: BorderRadius.circular(50)),
            child: const Icon(
              Icons.check,
              color: Colors.white,
            ),
          )),
      endChild: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Column(
          children: [
            Text(
              text,
              style: TextStyle(
                color: isChecked ? primaryColor : const Color(0xFF8B8888),fontFamily: 'Sharif',
              ),
            ),
            const SizedBox(height: 5,),
            Text(
              dateText,
              style: TextStyle(
                fontSize: 12,
                color: isChecked ? primaryColor : const Color(0xFF8B8888),fontFamily: 'Sharif',
              ),
            ),

          ],
        ),
      ),
    );
  }
}
