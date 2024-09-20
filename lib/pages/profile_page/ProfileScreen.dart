import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todonew/pages/profile_page/Tabs/AccountSettings/AccountName.dart';
import 'package:todonew/pages/profile_page/Tabs/AccountSettings/ChangeImage.dart';
import 'package:todonew/pages/profile_page/Tabs/AccountSettings/ChangePassword.dart';
import 'package:todonew/pages/profile_page/Tabs/Settings%20Tab.dart';


class ProfileTab extends StatefulWidget {
  static const String routeName = "profile";

  ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  late double heightSize = MediaQuery.of(context).size.height;

  late double widthSize = MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Profile",
          style: GoogleFonts.lato(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child:
            ClipOval(
              child: Image.network(
                "https://images.unsplash.com/photo-1590383153321-661b12bd4313?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwcm9maWxlLXBhZ2V8MTN8fHxlbnwwfHx8fHw%3D",
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.13,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: heightSize * 0.02,
          ),
          Center(
            child: Text(
              "Ahmed Mohamed",
              style: GoogleFonts.lato(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: heightSize * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildTaskButton(
                "10 Tasks Left ",
              ),
              buildTaskButton(
                "5 Tasks done",
              ),
            ],
          ),
          Expanded(
            child: ListView(children: [
              buildSectionTitle(
                "Settings",
              ),
              buildListTile(
                "AppSettings",
                "assets/Icons/setting-2.svg",
                SettingsTab(),
                context,
              ),
              buildSectionTitle(
                "Account",
              ),
              buildListTile(
                "Change account name",
                "assets/Icons/user.svg",
                AccountName(),
                context,
              ),
              buildListTile(
                "Change account password",
                "assets/Icons/key.svg",
                ChangePassword(),
                context,
              ),
              buildListTile("Change account Image", "assets/Icons/camera.svg",
                  ChangeImage(), context),
              buildSectionTitle(
                "Uptodo",
              ),
              buildListTile(
                "About US",
                "assets/Icons/menu.svg",
                AccountName(),
                context,
              ),
              buildListTile(
                "FAQ",
                "assets/Icons/info-circle.svg",
                ChangePassword(),
                context,
              ),
              buildListTile("Help & Feedback", "assets/Icons/flash.svg",
                  ChangeImage(), context),
              buildListTile("Support US",
                  "assets/Icons/like.svg",
                  ChangeImage(), context),
              ListTile(
                minLeadingWidth: 0,
                autofocus: true,
                title: Text(
                  "Log out",
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                ),
                dense: true,
                selected: true,
                leading: SvgPicture.asset(
                  "assets/Icons/logout.svg",
                  color: Colors.red,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeImage(),
                    ),
                  );
                },
              ),
            ]),
          )
        ],
      ),
    );
  }

  Widget buildTaskButton(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Color(0xff363636),
      ),
      child: Text(
        text,
        style: GoogleFonts.lato(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(
        left: heightSize * 0.008,
        top: heightSize * 0.012,
      ),
      child: Text(title,
          style: GoogleFonts.lato(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xffAFAFAF),
          )),
    );
  }

  Widget buildListTile(
      String title, dynamic icon, Widget Screen, BuildContext context) {
    return ListTile(
      minLeadingWidth: 0,
      autofocus: true,
      title: Text(
        title,
        style: GoogleFonts.lato(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      dense: true,
      selected: true,
      leading: SvgPicture.asset(
        icon,
        color: Color(0xffFFFFFFDE), // يمكنك تحديد اللون إذا كنت تريد تغييره
        // width: 24, // يمكنك تحديد العرض والارتفاع حسب الحاجة
        // height: 24,
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Color(0xffFFFFFFDE)),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Screen,
          ),
        );
      },
    );
  }
}
