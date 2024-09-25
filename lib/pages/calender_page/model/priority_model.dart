import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PriorityModel {
  String name;

  final IconData icon;

  PriorityModel({required this.icon, required this.name});

  static List<PriorityModel> priorities = [
    PriorityModel(icon: Icons.flag_outlined, name: "1"),
    PriorityModel(icon: Icons.flag_outlined, name: "2"),
    PriorityModel(icon: Icons.flag_outlined, name: "3"),
    PriorityModel(icon: Icons.flag_outlined, name: "4"),
    PriorityModel(icon: Icons.flag_outlined, name: "5"),
    PriorityModel(icon: Icons.flag_outlined, name: "6"),
    PriorityModel(icon: Icons.flag_outlined, name: "7"),
    PriorityModel(icon: Icons.flag_outlined, name: "8"),
    PriorityModel(icon: Icons.flag_outlined, name: "9"),
    PriorityModel(icon: Icons.flag_outlined, name: "9"),
    PriorityModel(icon: Icons.flag_outlined, name: "10"),
  ];
}
