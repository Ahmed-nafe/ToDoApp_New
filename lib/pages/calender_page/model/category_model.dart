import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryModel {
  final String name;
  final SvgPicture icon;
  final Color color;

  CategoryModel({
    required this.name,
    required this.icon,
    required this.color,
  });

  static List<CategoryModel> categoryList = [
    CategoryModel(
      name: 'Grocery',
      icon: SvgPicture.asset("assets/categoryIcons/bread 1.svg",width: 22,height:22),
      color: Color(0xffCCFF80),
    ),
    CategoryModel(
      name: 'Work',
      icon: SvgPicture.asset("assets/categoryIcons/briefcase 1.svg",width: 22,height:22),
      color: Color(0xffFF9680),
    ),
    CategoryModel(
      name: 'Sport',
      icon: SvgPicture.asset("assets/categoryIcons/sport 1.svg",width: 22,height:22),
      color: Color(0xff80FFFF),
    ),
    CategoryModel(
      name: 'Design',
      icon: SvgPicture.asset("assets/categoryIcons/design (1) 1.svg",width: 22,height:22),
      color: Color(0xff80FFD9),
    ),
    CategoryModel(
        name: 'University',
        icon: SvgPicture.asset("assets/categoryIcons/mortarboard 1.svg",width: 22,height:22),
        color: Color(0xff809CFF)),
    CategoryModel(
      name: 'Social',
      icon: SvgPicture.asset("assets/categoryIcons/megaphone 1.svg",width: 22,height:22),
      color: Color(0xffFF80EB),
    ),
    CategoryModel(
      name: 'Music',
      icon: SvgPicture.asset("assets/categoryIcons/Music.svg",width: 22,height:22),
      color: Color(0xffFC80FF),
    ),
    CategoryModel(
      name: 'Health',
      icon: SvgPicture.asset("assets/categoryIcons/Health.svg",width: 22,height:22),
      color: Color(0xff80FFA3),
    ),
    CategoryModel(
      name: 'Movie',
      icon: SvgPicture.asset("assets/categoryIcons/video.svg",width: 22,height:22),
      color: Color(0xff80D1FF),
    ),
    CategoryModel(
      name: 'Home',
      icon: SvgPicture.asset("assets/categoryIcons/Home.svg",width: 22,height:22),
      color: Color(0xffFF8080),
    ),
  ];
}
