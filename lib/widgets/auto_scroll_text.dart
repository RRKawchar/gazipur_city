import 'package:flutter/material.dart';

class AutoScrollText extends StatefulWidget {
  final double height;
  final List<Widget> items;

  AutoScrollText({this.height = 24.0, required this.items});

  @override
  State<StatefulWidget> createState() => _AutoScrollTextState();
}

class _AutoScrollTextState extends State<AutoScrollText>
    with SingleTickerProviderStateMixin {
  ScrollController scrollCtrl = ScrollController();
  late AnimationController animateCtrl;

  @override
  void dispose() {
    animateCtrl.dispose();
    scrollCtrl.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      animateCtrl = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 10),
      )..addListener(() {
        if (animateCtrl.isCompleted) animateCtrl.repeat();
        double offset = animateCtrl.value * scrollCtrl.position.maxScrollExtent;
        scrollCtrl.jumpTo(offset);
      });

      animateCtrl.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      padding: const EdgeInsets.only(top: 4.0, bottom: 2.0),
      child: Center(
        child: ListView(
          controller: scrollCtrl,
          scrollDirection: Axis.horizontal,
          children: widget.items,
        ),
      ),
    );
  }
}