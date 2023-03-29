// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import '/Widgets/MyAppBar.dart';
import '/Widgets/options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hello"),
          backgroundColor: Color(0xffB00F1A),
        ),
        drawer: Drawer(
          child: Container(
            color: Color(0xffB00F1A),
            child: ListView(
              children: [
                Icon(
                  Icons.person,
                  size: 150,
                  color: Colors.white,
                ),
                Center(
                    child: Text(
                  "Ujala Akmal",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                )),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Profile",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 60,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Options(
                  icon1: Icon(
                    Icons.health_and_safety,
                    color: Colors.white,
                  ),
                  text1: "Your donation",
                ),
                SizedBox(
                  height: 10,
                ),
                Options(
                  icon1: Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                  text1: "Become a Donor",
                ),
                SizedBox(
                  height: 10,
                ),
                Options(
                  icon1: Icon(
                    Icons.reviews,
                    color: Colors.white,
                  ),
                  text1: "Reviews",
                ),
                SizedBox(
                  height: 10,
                ),
                Options(
                  icon1: Icon(
                    Icons.notification_important,
                    color: Colors.white,
                  ),
                  text1: "Notification",
                ),
                SizedBox(
                  height: 10,
                ),
                Options(
                  icon1: Icon(
                    Icons.contact_mail,
                    color: Colors.white,
                  ),
                  text1: "Contact Us",
                ),
                SizedBox(
                  height: 10,
                ),
                Options(
                  icon1: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  text1: "Settings",
                ),
                SizedBox(
                  height: 10,
                ),
                Options(
                  icon1: Icon(
                    Icons.help_center_outlined,
                    color: Colors.white,
                  ),
                  text1: "Help and FAQ",
                ),
                SizedBox(
                  height: 150,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Log Out",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          child: Text("Home screen"),
        ),
      ),
    );
  }
}
