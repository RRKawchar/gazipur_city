import 'package:flutter/material.dart';
import 'package:our_gazipur/model/problem_list.dart';
import 'package:our_gazipur/utils/colors.dart';
import 'package:our_gazipur/widgets/custom_text.dart';

class GCCScreen extends StatelessWidget {
  const GCCScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const CustomText(text:"সমস্যার লিস্ট",color: primaryColor,fontWeight: FontWeight.bold,fontFamily: 'Sharif',size: 20,),
        centerTitle: true,
      ),
       body: SafeArea(
         child: ListView.builder(
             padding:const EdgeInsets.only(top: 30),
             itemCount: problemList.length,
             itemBuilder: (context,index){
             return Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                 height: 80,
                 width: size.width,
                 decoration: BoxDecoration(
                   image: DecorationImage(
                     image: NetworkImage(problemList[index]['image'].toString()),fit: BoxFit.cover
                   ),
                   boxShadow: const [
                   BoxShadow(
                   blurRadius: 3.0,
                 ),

                 ],
                   borderRadius: BorderRadius.circular(20)
                 ),
                 child: Padding(
                   padding: const EdgeInsets.only(top: 25,left: 20),
                   child: CustomText(text: problemList[index]['title'].toString(),color: Colors.white,fontWeight: FontWeight.bold,size: 30,fontFamily: 'Sharif',),
                 ),
               ),
             );
         }),
       ),
    );
  }
}
