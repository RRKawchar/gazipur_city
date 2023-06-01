import 'package:flutter/material.dart';
import 'package:our_gazipur/screens/bottom_nav_screen/gcc_screen.dart';
import 'package:our_gazipur/screens/bottom_nav_screen/home_screen.dart';

const List<Widget> pages = [
  HomeScreen(),
  GCCScreen(),
  Center(child: Text("History not Available")),
  Center(child: Text("Coming Soon")),
];

const List<String> problemItem = [
  "রাস্তায় অবনতি",
  "মশা",
  "বাসায় পানির সরবরাহ",
  "পাবলিক টয়লেট",
  "অবৈধ স্থাপনাদেয়ালে অবৈধ দাগ",
  "অপরিচ্ছন্ন পাবলিক টয়লেট",
  "বিদ্যুৎ সংযোগ",
  "অযাচিত বিজ্ঞাপন",
  "পাবলিক গ্রাউন্ড",
  "কমিউনিটি বাজার",
  "পারিবারিক মানসম্পন্নতা",
];

const String mosquito = "assets/images/Mosquito.png";
const String motorway = "assets/images/Motorway.png";
const String water = "assets/images/Water Tap.png";
const String public_toilet = "assets/images/Portable Toilet.png";
const String light = "assets/images/Lights.png";
const String ilegle = "assets/images/image 2.png";
const String sand_rain = "assets/images/Sand Drain.png";
const String waste = "assets/images/Waste.png";
