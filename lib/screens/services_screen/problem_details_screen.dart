import 'package:flutter/material.dart';
import 'package:our_gazipur/utils/colors.dart';
import 'package:our_gazipur/widgets/custom_text.dart';
import 'package:our_gazipur/widgets/custom_timeline_tile.dart';

class TimelineScreen extends StatelessWidget {
  const TimelineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: primaryColor),
        title: const CustomText(
          text: "সমস্যার বিস্তারিত",
          color: primaryColor,
          fontFamily: 'Sharif',
          fontWeight: FontWeight.bold,
          size: 20,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 180,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: const [
                        CustomTimeLineTile(
                          text: 'সমস্যা\nপ্রদান',
                          dateText: '৩ জানু, ২০২৩',
                          isFirst: true,
                        ),
                        CustomTimeLineTile(
                          text: 'সমস্যা\nগৃহীত',
                          dateText: '৯ জানু, ২০২৩',
                        ),
                        CustomTimeLineTile(
                            text: 'মাঠ পর্যায়ে\nঅনুসন্ধান',
                            dateText: '১২ জানু, ২০২৩'),
                        CustomTimeLineTile(
                          text: 'সমাধান',
                          dateText: '১৫ জানু, ২০২৩',
                          isChecked: false,
                          isLast: true,
                        ),
                      ],
                    ),
                  )),
              const SizedBox(
                height: 10
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 15),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  height: size.height / 2,
                  width: 250,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    color: primaryColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 120,
                        width: size.width,
                        child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q='
                          'tbn:ANd9GcTZs7f-wkVx_DD0o0co46TYIoxYe126XVswdt0Px_Jwxdjo-3r-FtPbAM5noSirIfX5Fd0&usqp=CAU',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const CustomText(
                        text: 'সমস্যাঃ রাস্তা',
                        color: Colors.white,
                        fontFamily: 'Sharif',
                        size: 14,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const CustomText(
                          text: 'ইস্যু আইডিঃ #ABCIX0000896',
                          fontFamily: 'Sharif',
                          color: Colors.white,
                          size: 14),
                      const SizedBox(
                        height: 10,
                      ),
                      const CustomText(
                          text: 'ঠিকানাঃ House 94, Road 17, Joydevpur, Gazipur',
                          fontFamily: 'Sharif',
                          color: Colors.white,
                          size: 14),
                      const SizedBox(
                        height: 10,
                      ),
                      const CustomText(
                          text: 'সমস্যার তারিখঃ ৩ জানু, ২০২৩',
                          fontFamily: 'Sharif',
                          color: Colors.white,
                          size: 14),
                      const SizedBox(
                        height: 10,
                      ),
                      const CustomText(
                          text: 'সমস্যার সময়ঃ ১০:২০ AM',
                          fontFamily: 'Sharif',
                          color: Colors.white,
                          size: 14),
                      const SizedBox(
                        height: 10,
                      ),
                      const CustomText(
                          text:
                              'বিস্তারিতঃ রাস্তা ঠিক না থাকায় চলাফেরা সমস্যা হচ্ছে।',
                          fontFamily: 'Sharif',
                          color: Colors.white,
                          size: 14)
                    ],
                  ),
                ),
              )
            ],
          ),
          Positioned(
              bottom: 138,
              right: 113,
              child: Image.asset('assets/images/Vector 2.png')),
          const Positioned(
              bottom: 135,
              right: 40,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    'https://lh3.googleusercontent.com/a/AAcHTtdxSpQm7WgXjM8BaaxJYjFG9dk1OUziuOsJquJGLw=s288-c-no'),
              )),
          const Positioned(
              bottom: 60,
              left: 20,
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/logos/gazipur_logopng.png'),
              )),
          Positioned(
            bottom: 60,
            left: 80,
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffECECEC)),
                  borderRadius: BorderRadius.circular(10)),
              height: 40,
              width: size.width / 1.3,
              child: const CustomText(
                text: "এই কাজটি শুরু হবে ২৮-০২-২০২৩ তারিখের পর",
                fontFamily: 'Sharif',
                color: primaryColor,
                size: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
