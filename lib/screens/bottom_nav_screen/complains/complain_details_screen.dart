import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:our_gazipur/model/complain_model.dart';
import 'package:our_gazipur/utils/colors.dart';
import 'package:our_gazipur/utils/constants.dart';
import 'package:our_gazipur/widgets/custom_network_image.dart';
import 'package:our_gazipur/widgets/custom_text.dart';

class ComplainDetailScreen extends StatelessWidget {
  final ComplainModel complainModel;
  const ComplainDetailScreen({Key? key, required this.complainModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: primaryColor),
        backgroundColor: Colors.white,
        elevation: 1,
        title: const CustomText(
          text: "সমস্যার বিস্তারিত",
          color: primaryColor,
          size: 20,
        ),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CustomNetworkImage(
                    image: complainModel.pictures.toString(),
                    height: 200,
                    width: size.width)),
            const SizedBox(
              height: 10,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    imageList.length,
                    (index) => ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CustomNetworkImage(
                          image: imageList[index],
                          height: 80,
                          width: 110,
                        )))),
            const SizedBox(
              height: 20,
            ),
            CustomText(
              text: "সমস্যাঃ ${complainModel.category}",
              fontFamily: 'Sharif',
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomText(
                text: "অভিযোগকারীঃ সচেতন নাগরিক", fontFamily: 'Sharif'),
            const SizedBox(
              height: 10,
            ),
            CustomText(
              text:
                  "তারিখঃ ${DateFormat.yMMMd().format(complainModel.createdAt)}",
            ),
            const SizedBox(
              height: 10,
            ),
            CustomText(
              text: "ঠিকানাঃ ${complainModel.area}",
              fontFamily: "Sharif",
            ),
            const SizedBox(
              height: 10,
            ),
            CustomText(
                text: "বিস্তারিতঃ ${complainModel.description}",
                fontFamily: 'Sharif'),
          ])),
    );
  }
}
