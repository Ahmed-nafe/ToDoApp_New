import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todonew/core/themes/colors.dart';
import 'package:todonew/pages/calender_page/screens/list_todo_item.dart';
import 'package:todonew/pages/cubits/todos_cuibt_cubit.dart';

class IndexScreen extends StatefulWidget {
  static const String routeName = "index";

  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<TodosCuibt, TodosState>(
        builder: (context, state) {
          if (state is TodosSucceed) {
            return Column(
              children: [
                appBar(),
                ListTodoItemToday(),
              ],
            );
          } else {
            return Column(
              children: [
                appBar(),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: SvgPicture.asset(
                          "assets/Checklist-rafiki 1.svg",
                        ),
                      ),
                      Text(
                        "What do you want to do today?",
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: AppColors.white,
                        ),
                      ),
                      Text(
                        "Tap + to add your tasks",
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: AppColors.white,
                            height: 3),
                      ),
                    ],
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }

  Widget appBar() {
    double heightSize = MediaQuery.of(context).size.height;
    double widthSize = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
          top: heightSize * 0.05,
          left: heightSize * 0.017,
          right: widthSize * 0.017),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.filter_list,
            color: AppColors.white,
          ),
          Text(
            "Index",
            style: GoogleFonts.lato(
                fontWeight: FontWeight.w400,
                fontSize: 24,
                color: AppColors.white),
          ),
          ClipOval(
            child: Image.network(
              "https://images.unsplash.com/photo-1590383153321-661b12bd4313?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwcm9maWxlLXBhZ2V8MTN8fHxlbnwwfHx8fHw%3D",
              width: MediaQuery.of(context).size.width * 0.16,
              height: MediaQuery.of(context).size.height * 0.07,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
