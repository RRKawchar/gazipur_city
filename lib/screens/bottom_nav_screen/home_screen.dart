import 'dart:async';

import 'package:flutter/material.dart';
import 'package:our_gazipur/utils/constants.dart';
import 'package:our_gazipur/widgets/custom_text.dart';
import 'package:our_gazipur/widgets/services_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<String> headlines = [
    'News Headline 1',
    'News Headline 2',
    'News Headline 3',
    'News Headline 4',
    'News Headline 5',
  ];

  ScrollController _scrollController = ScrollController();
  int _currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _stopAutoScroll();
    _scrollController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentIndex < headlines.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _scrollController.animateTo(
        _currentIndex * 56.0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  void _stopAutoScroll() {
    _timer.cancel();
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                "assets/images/Rectangle 3.png",
                fit: BoxFit.cover,
                width: size.width,
              ),
              Positioned(
                  top: 20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CustomText(
                        text: 'আমাদের',
                        size: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 60),
                        child: CustomText(
                          text: 'গাজীপুর',
                          size: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )),
              Positioned(
                  right: 5,
                  top: 55,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              ServicesButton(image: mosquito, text: 'মশা'),
              ServicesButton(image: motorway, text: 'রাস্তা'),
              ServicesButton(image: water, text: 'পানি'),
              ServicesButton(image: public_toilet, text: 'পাবলিক টয়লেট'),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              ServicesButton(image: light, text: 'সড়ক বাতি'),
              ServicesButton(image: ilegle, text: 'অবৈধ স্থাপনা'),
              ServicesButton(image: sand_rain, text: 'জলাবদ্ধতা'),
              ServicesButton(image: waste, text: 'আবর্জনা'),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
           Divider(
            height: 10,
            thickness: 5.0,
            color: Colors.grey.shade200,
          ),
          const SizedBox(
            height: 10,
          ),
          const CustomText(
            text: "সমাধান কাউন্টার",
            size: 20,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildColumn(titleText: "সর্বমোট",number: '৩৫',color: const Color(0xFFF39893)),
              _buildColumn(titleText: "নিস্পন্ন",number: '১৯',color: const Color(0xFFABD194)),
              _buildColumn(titleText: "প্রক্রিয়াধীন",number: '৩৫',color: const Color(0xFFB88CBF)),
            ],
          ),
           Divider(thickness: 4,color: Colors.grey.shade200,),

        ],
      ),
    );
  }

  Column _buildColumn({required String titleText,required String number,Color? color}) {
    return Column(
      children:  [
        CustomText(text: titleText),
        Text(
          number,
          style:  TextStyle(color: color, fontSize: 20),
        )
      ],
    );
  }
}
