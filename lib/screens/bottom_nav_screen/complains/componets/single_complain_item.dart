import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:our_gazipur/model/complain_model.dart';
import 'package:our_gazipur/screens/bottom_nav_screen/complains/complain_details_screen.dart';
import 'package:our_gazipur/utils/routes.dart';
import 'package:our_gazipur/widgets/custom_network_image.dart';
import 'package:our_gazipur/widgets/custom_text.dart';

class SingleComplainItem extends StatelessWidget {
  final ComplainModel complainModel;
  const SingleComplainItem({Key? key, required this.complainModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
        nextPage(context: context,page:  ComplainDetailScreen(complainModel: complainModel,));
      },
      child: SizedBox(
        height: 200,
        width: size.width,
        child: Stack(
          children: [
             CustomNetworkImage(
                image: complainModel.pictures.toString(),
                height: 200,
                width: double.infinity,
              ),

            Padding(
              padding: const EdgeInsets.only(top: 15, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: complainModel.description,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    size: 25,
                    fontFamily: 'Sharif',
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text:
                        "তারিখঃ${DateFormat.yMMMd().format(complainModel.createdAt)}",
                    color: Colors.white54,
                  ),
                  const Spacer(),
                  const CustomText(
                    text: "অভিযোগকারীঃ সচেতন নাগরিক",
                    color: Colors.white54,
                    fontWeight: FontWeight.bold,
                  ),
                  const Spacer(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
