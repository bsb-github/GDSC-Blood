import 'package:blood/pages/AllRequest.dart';
import 'package:blood/pages/HomePage.dart';
import 'package:blood/pages/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  var currentIndex = 1;
  var pages =const[
  AllRequest(),
  HomePage(),
  Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.gift,), label: "Donate"),
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.home,), label: "Home"),
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.person,), label: "Profile"),

      ],
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: (index){
        setState(() {
          currentIndex = index;
        });
        },
        currentIndex: currentIndex,

      ),
    );
  }
}
