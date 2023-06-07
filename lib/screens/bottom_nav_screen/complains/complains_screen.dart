import 'package:flutter/material.dart';
import 'package:our_gazipur/api_service/api_service.dart';
import 'package:our_gazipur/model/complain_model.dart';
import 'package:our_gazipur/screens/bottom_nav_screen/complains/componets/single_complain_item.dart';
import 'package:our_gazipur/utils/colors.dart';
import 'package:our_gazipur/widgets/custom_text.dart';

class ComplainScreen extends StatefulWidget {
  const ComplainScreen({Key? key}) : super(key: key);

  @override
  State<ComplainScreen> createState() => _ComplainScreenState();
}

class _ComplainScreenState extends State<ComplainScreen> {
  List<ComplainModel> _complainList = [];

  bool isLoading = false;
  @override
  void initState() {
    getComplain();
    super.initState();
  }

  void getComplain() async {
    setState(() {
      isLoading = true;
    });
    _complainList = await ApiService.instance.getComplain();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const CustomText(
          text: "সমস্যা তালিকা",
          color: primaryColor,
          fontWeight: FontWeight.w500,
          fontFamily: 'Sharif',
          size: 25,
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(
              child: SizedBox(
                  height: size.height,
                  width: size.width,
                  child: Image.asset(
                    'assets/logos/shimmer.gif',
                    fit: BoxFit.fill,
                  )))
          : _complainList.isEmpty
              ? const Text("Empty")
              : ListView.builder(
                  padding: const EdgeInsets.only(top: 30),
                  itemCount: _complainList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleComplainItem(
                          complainModel: _complainList[index],
                        ));
                  }),
    );
  }
}
