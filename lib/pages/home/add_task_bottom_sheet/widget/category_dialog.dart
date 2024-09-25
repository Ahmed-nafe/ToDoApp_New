import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todonew/core/themes/colors.dart';
import 'package:todonew/pages/calender_page/model/category_model.dart';

class CategoryDialog extends StatefulWidget {
  const CategoryDialog({super.key});

  @override
  State<CategoryDialog> createState() => _CategoryDialogState();
}

class _CategoryDialogState extends State<CategoryDialog> {
  CategoryModel? selectedCategory;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.primarygray,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.015,
          ),
          Text(
            "Choose Category",
            style: GoogleFonts.lato(
                color: AppColors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
          Divider(
            color: Color(0xff979797),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width * 0.85,
            height: MediaQuery.sizeOf(context).height * 0.6,
            decoration: BoxDecoration(
              color: AppColors.primarygray,
              borderRadius: BorderRadius.circular(2),
            ),
            child: GridView.builder(
              itemCount: CategoryModel.categoryList.length,
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = CategoryModel.categoryList[index];
                    });

                    Navigator.of(context).pop();
                  },
                  child: GridTile(
                    footer: Center(
                      child: Text(
                        CategoryModel.categoryList[index].name,
                        style: GoogleFonts.lato(
                            color: AppColors.white.withOpacity(0.8),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(15),
                      color: CategoryModel.categoryList[index].color,
                      child: CategoryModel.categoryList[index].icon,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
