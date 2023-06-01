import 'package:flutter/material.dart';
import 'package:our_gazipur/screens/services_screen/services_screen.dart';
import 'package:our_gazipur/utils/colors.dart';
import 'package:our_gazipur/utils/constants.dart';
import 'package:our_gazipur/utils/routes.dart';
import 'package:our_gazipur/widgets/custom_text.dart';
import 'package:our_gazipur/widgets/auto_scroll_text.dart';
import 'package:our_gazipur/widgets/services_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> headlines = [
    "আগামীকাল সকাল ১০টা থেকে বিকেল ৪টা পর্যন্ত করোনা ভাইরাস এর টিকা দেয়া হবে|",
    "আগামীকাল সকাল ১০টা থেকে বিকেল ৪টা পর্যন্ত করোনা ভাইরাস এর টিকা দেয়া হবে|",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    List<Widget> headlineWidgets = headlines
        .map(
          (headline) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              headline,
              style: const TextStyle(
                  fontSize: 17.0,
                  color: primaryColor,
                  fontWeight: FontWeight.bold,fontFamily: 'Sharif'),
            ),
          ),
        )
        .toList();

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
                        fontFamily: 'Sharif',
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 60),
                        child: CustomText(
                          text: 'গাজীপুর',
                          size: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Sharif',
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
            children: [
              ServicesButton(
                image: mosquito,
                text: 'মশা',
                onTap: () {
                  nextPage(
                      context: context,
                      page:  const ServicesScreen(
                        title: 'মশা',
                        image: mosquito,
                      ));
                },
              ),
              ServicesButton(
                image: motorway,
                text: 'রাস্তা',
                onTap: () {
                  nextPage(
                      context: context,
                      page: const ServicesScreen(
                        title: 'রাস্তা',
                        image: motorway,
                      ));
                },
              ),
              ServicesButton(
                image: water,
                text: 'পানি',
                onTap: () {
                  nextPage(
                      context: context,
                      page: const ServicesScreen(
                        title: 'পানি',
                        image: water,
                      ));
                },
              ),
              ServicesButton(
                image: public_toilet,
                text: 'পাবলিক টয়লেট',
                onTap: () {
                  nextPage(
                      context: context,
                      page: const ServicesScreen(
                        title: 'পাবলিক টয়লেট',
                        image: public_toilet,
                      ));
                },
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ServicesButton(
                image: light,
                text: 'সড়ক বাতি',
                onTap: () {
                  nextPage(
                      context: context,
                      page: const ServicesScreen(
                        title: 'সড়ক বাতি',
                        image: light,
                      ));
                },
              ),
              ServicesButton(
                image: ilegle,
                text: 'অবৈধ স্থাপনা',
                onTap: () {
                  nextPage(
                      context: context,
                      page: const ServicesScreen(
                        title: 'অবৈধ স্থাপনা',
                        image: ilegle,
                      ));
                },
              ),
              ServicesButton(
                image: sand_rain,
                text: 'জলাবদ্ধতা',
                onTap: () {
                  nextPage(
                      context: context,
                      page: const ServicesScreen(
                        title: 'জলাবদ্ধতা',
                        image: sand_rain,
                      ));
                },
              ),
              ServicesButton(
                image: waste,
                text: 'আবর্জনা',
                onTap: () {
                  nextPage(
                      context: context,
                      page: const ServicesScreen(
                        title: 'আবর্জনা',
                        image: waste,
                      ));
                },
              ),
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
            fontFamily: 'Sharif',
            size: 20,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildColumn(
                  titleText: "সর্বমোট",
                  number: '৩৫',
                  color: const Color(0xFFF39893)),
              _buildColumn(
                  titleText: "নিস্পন্ন",
                  number: '১৯',
                  color: const Color(0xFFABD194)),
              _buildColumn(
                  titleText: "প্রক্রিয়াধীন",
                  number: '৩৫',
                  color: const Color(0xFFB88CBF)),
            ],
          ),
          Divider(
            thickness: 4,
            color: Colors.grey.shade200,
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
            child: AutoScrollText(
              height: 24.0,
              items: headlineWidgets,
            ),
          ),
          Divider(
            thickness: 4,
            color: Colors.grey.shade200,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 200,
            width: size.width,
            child: Image.asset('assets/logos/Untitled-1.png'),
          )
        ],
      ),
    );
  }

  Column _buildColumn(
      {required String titleText, required String number, Color? color}) {
    return Column(
      children: [
        CustomText(text: titleText,fontFamily: 'Sharif',),
        Text(
          number,
          style: TextStyle(color: color, fontSize: 20,fontFamily: 'Sharif'),
        )
      ],
    );
  }
}
