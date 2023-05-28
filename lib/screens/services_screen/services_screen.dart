import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:our_gazipur/screens/services_screen/problem_details_screen.dart';
import 'package:our_gazipur/utils/colors.dart';
import 'package:our_gazipur/utils/routes.dart';
import 'package:our_gazipur/widgets/custom_text.dart';

class ServicesScreen extends StatelessWidget {
   final String title;
   final String image;
  const ServicesScreen({Key? key, required this.title, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: const BackButton(color: primaryColor,),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(text:title,color: primaryColor,),
            const SizedBox(width: 10,),
            Image.asset(image,width: 30,)
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const SizedBox(height: 20,),
              const Center(child: CustomText(text: 'রাস্তা সংস্কারের জন্য ছবি তুলুন এবং জমা দিন',size: 17,fontWeight: FontWeight.bold,),),
              const SizedBox(height: 30,),
              DottedBorder(
                color: Colors.black,
                strokeWidth: 1.5,
                dashPattern:const [
                  10,
                  10,
                ],
                child: Container(
                  alignment: Alignment.center,
                  height: 110,
                  width: size.width,
                  padding: const EdgeInsets.all(
                      16.0),
                  child: Column(
                    children: const [
                      Icon(Icons.cloud_upload_outlined,size: 40,color: Colors.cyan,),
                      SizedBox(height: 8,),
                      CustomText(text: 'এখানে গ্যালারি ছবি ড্রপ করুন',color: primaryColor,)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 90,
                    width: 100,
                    child: Image.network('https://encrypted-tbn0.gstatic.com/images?q='
                        'tbn:ANd9GcTZs7f-wkVx_DD0o0co46TYIoxYe126XVswdt0Px_Jwxdjo-3r-FtPbAM5noSirIfX5Fd0&usqp=CAU',fit: BoxFit.cover,),
                  ),
                  const SizedBox(width: 8,),
                  Container(
                      height: 92,
                      width: 100,
                      child: Image.asset('assets/images/default_images.png',fit: BoxFit.cover,)),
                  const SizedBox(width: 8,),
                  Container(
                      height: 92,
                      width: 100,
                      child: Image.asset('assets/images/default_images.png',fit: BoxFit.cover,)),

                ],
              ),
              const SizedBox(height: 20,),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    color:const Color(0xffECECEC)
                  ),
                  borderRadius: BorderRadius.circular(10)
                ),
                height: 40,
                width: size.width,
                child: const CustomText(text: "House - 94, Road - 17, Joydevpur, Gazipur",color: Color(0xFF7B7979),)
              ),
              const SizedBox(height: 20,),
              const CustomText(text: 'সমস্যার ধরন',fontWeight: FontWeight.w400,color: Color(0xFF7B7979),),
              const SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.only(left: 10,right: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color:const Color(0xffECECEC)
                      ),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  height: 40,
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CustomText(text: "রাস্তা পৃষ্টা",color:primaryColor,),
                      Icon(Icons.keyboard_arrow_down_rounded,size: 30,)
                    ],
                  )
              ),
              const SizedBox(height: 10,),
              const CustomText(text: 'সমস্যা',fontWeight: FontWeight.w400,color: Color(0xFF7B7979),),
              Container(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color:const Color(0xffECECEC)
                      ),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  height: 40,
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CustomText(text: "গর্ত",color:primaryColor,),
                      Icon(Icons.keyboard_arrow_down_rounded,size: 30,)
                    ],
                  )
              ),
              const SizedBox(height: 10,),
              Container(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color:const Color(0xffECECEC)
                      ),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  height: 100,
                  width: size.width,
                  child:const TextField(
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "আপনার মতামত এখানে লিখুন...."
                    ),
                    minLines: 1,//Normal textInputField will be displayed
                    maxLines: 5,// when user presses enter it will adapt to it
                  )
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  const Spacer(),
                  InkWell(
                    onTap: (){
                      nextPage(context: context,page:  TimelineScreen());
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: primaryColor
                      ),
                      child: const CustomText(text: "জমা দিন",color: Colors.white,fontWeight: FontWeight.w400,),
                    ),
                  ),
                ],
              )


            ],
          ),
        ),
      ),
    );
  }
}
