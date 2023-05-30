import 'package:flutter/material.dart';
import 'package:our_gazipur/screens/main_screens/main_screen.dart';
import 'package:our_gazipur/utils/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3),(){
      nextPageOnly(context: context,page: const MainScreen());
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height:size.height,
        width: size.width,
        child: Image.asset("assets/images/Intro.png",fit: BoxFit.cover,),
      ),
    );
  }
}
