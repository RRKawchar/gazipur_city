import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:our_gazipur/widgets/shimmer_loading_widget.dart';

class CustomNetworkImage extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  const CustomNetworkImage({Key? key, required this.image, required this.height, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:height ,
      width: width,
      child: CachedNetworkImage(
        imageUrl: image,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
                colorFilter:
                const ColorFilter.mode(Colors.transparent, BlendMode.colorBurn)),
          ),
        ),
        placeholder: (context, url) => SizedBox(
          width: width,
          height: height,
          child: ShimmerLoadingWidget(width: width, height: height),
        ),
        errorWidget: (context, url, error) =>Image.asset('assets/images/default.jpg',fit: BoxFit.cover,),
      ),
    );
  }
}