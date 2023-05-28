// import 'package:flutter/material.dart';
//
// class AutoScrollText extends StatefulWidget {
//   final double height;
//   final List<Widget> items;
//
//   AutoScrollText({this.height = 24.0, required this.items});
//
//   @override
//   State<StatefulWidget> createState() => _AutoScrollTextState();
// }
//
// class _AutoScrollTextState extends State<AutoScrollText>
//     with SingleTickerProviderStateMixin {
//   ScrollController scrollCtrl = ScrollController();
//   late AnimationController animateCtrl;
//
//   @override
//   void dispose() {
//     animateCtrl.dispose();
//     super.dispose();
//   }
//
//   @override
//   void initState() {
//     double offset = 0.0;
//     super.initState();
//     animateCtrl =
//     AnimationController(vsync: this, duration: const Duration(seconds: 3))
//       ..addListener(() {
//         if (animateCtrl.isCompleted) animateCtrl.repeat();
//         offset += 1.0;
//         if (offset - 1 > scrollCtrl.offset) {
//           offset = 0.0;
//         }
//         setState(() {
//           scrollCtrl.jumpTo(offset);
//         });
//       });
//     animateCtrl.forward();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: widget.height,
//       padding: const EdgeInsets.only(top: 4.0, bottom: 2.0),
//       child: Center(
//         child: ListView(
//           controller: scrollCtrl,
//           scrollDirection: Axis.horizontal,
//           children: widget.items,
//         ),
//       ),
//     );
//   }
// }
//
// class NewsApp extends StatelessWidget {
//   List<String> headlines = [
//     "আগামীকাল সকাল ১০টা থেকে বিকেল ৪টা পর্যন্ত করোনা ভাইরাস এর টিকা দেয়া হবে",
//     // Add more headlines as needed
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     List<Widget> headlineWidgets = headlines.map((headline) => Container(
//       padding: EdgeInsets.symmetric(horizontal: 8.0),
//       child: Text(
//         headline,
//         style: TextStyle(fontSize: 18.0),
//       ),
//     )).toList();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("News App"),
//       ),
//       body: Container(
//         padding: EdgeInsets.symmetric(vertical: 10.0),
//         child: AutoScrollText(
//           height: 24.0,
//           items: headlineWidgets,
//         ),
//       ),
//     );
//   }
// }
//
