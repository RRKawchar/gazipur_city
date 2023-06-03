import 'package:flutter/material.dart';
import 'package:our_gazipur/screens/bottom_nav_screen/complains/complains_screen.dart';
import 'package:our_gazipur/screens/bottom_nav_screen/home_screen.dart';

const List<Widget> pages = [
  HomeScreen(),
  Center(child: Text("Not Available")),
  ComplainScreen(),
  Center(child: Text("Coming Soon")),
];

const List<String> imageList=[
  'https://media.istockphoto.com/id/1317059852/photo/aedes-mosquitoe-is-sucking-blood-on-human-skin.jpg?s=612x612&w=0&k=20&c=FJoItD-SqroiLNBfnKfGD7kjOssT5P9JsYBt7vJSkTM=',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTSyHm72zY_Tvo08DcseTbbsHc1Uakb3xxqmnLIYRwsPqSEv0c6C6atZN3EhBjgu7czRA&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvi3fZwm260N_aoyM7VKAEl1CVNaa7FldrXJRNGgTzDuPEhKfcvUulkzpQCvu-hkB3rq4&usqp=CAU'
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
const List<String> wardList = [
  "১",
  "২",
  "৩",
  "৪",
  "৫",
  "৬",
  "৭",
  "৮",
  "৯",
  "১০",
  "১১",
];

const String complainApi="https://app.zufaa.tech/our-gazipur/public/api/complain";

const String mosquito = "assets/images/Mosquito.png";
const String motorway = "assets/images/Motorway.png";
const String water = "assets/images/Water Tap.png";
const String public_toilet = "assets/images/Portable Toilet.png";
const String light = "assets/images/Lights.png";
const String ilegle = "assets/images/image 2.png";
const String sand_rain = "assets/images/Sand Drain.png";
const String waste = "assets/images/Waste.png";
