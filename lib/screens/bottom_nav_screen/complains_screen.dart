import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:our_gazipur/api_service/api_service.dart';
import 'package:our_gazipur/model/complain_model.dart';
import 'package:our_gazipur/model/problem_list.dart';
import 'package:our_gazipur/utils/colors.dart';
import 'package:our_gazipur/widgets/custom_text.dart';

class ComplainScreen extends StatefulWidget {
  const ComplainScreen({Key? key}) : super(key: key);

  @override
  State<ComplainScreen> createState() => _ComplainScreenState();
}

class _ComplainScreenState extends State<ComplainScreen> {
List<ComplainModel> _complainList=[];

  bool isLoading=false;
  @override
  void initState() {
   getComplain();
    super.initState();
  }

  getComplain()async{
    setState(() {
      isLoading=true;
    });
    _complainList=await ApiService.instance.getComplain();
    setState(() {
      isLoading=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const CustomText(text:"সমস্যা তালিকা",color: primaryColor,fontWeight: FontWeight.w500,fontFamily: 'Sharif',size: 25,),
        centerTitle: true,
      ),
       body:isLoading?const Center(child: CircularProgressIndicator(),): ListView.builder(
           padding:const EdgeInsets.only(top: 30),
           itemCount: _complainList.length,
           itemBuilder: (context,index){

           return Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
               height: 200,
               width: size.width,
               decoration: BoxDecoration(
                 image: _complainList[index].category == "রাস্তায় অবনতি"
                     ? const DecorationImage(image: AssetImage('assets/logos/road.png'),fit: BoxFit.cover)
                     : (_complainList[index].category == "বিদ্যুৎ সংযোগ"
                     ? const DecorationImage(image: AssetImage('assets/logos/mosquito.png'),fit: BoxFit.cover)
                     : DecorationImage(
                   image: NetworkImage(_complainList[index].pictures.toString()),
                   fit: BoxFit.cover,
                 )),
                 boxShadow: const [
                   BoxShadow(
                     blurRadius: 3.0,
                   ),
                 ],
                 borderRadius: BorderRadius.circular(5),
               ),
               child: Padding(
                 padding: const EdgeInsets.only(top: 25,left: 20),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Container(
                         height: 100,
                         width: double.infinity,
                         child: CustomText(text: _complainList[index].description,color: Colors.white,fontWeight: FontWeight.bold,size: 25,fontFamily: 'Sharif',maxLines: 2,)),
                     CustomText(text: DateFormat.yMMMd()
                         .format(_complainList[index].createdAt.toLocal()),color: Colors.white,fontWeight: FontWeight.bold,size: 15,fontFamily: 'Sharif',),
                   ],
                 ),
               ),
             ),
           );
       }),
    );
  }
}
