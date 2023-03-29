// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import '/pages/SideBarPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class BecomeDonor extends StatefulWidget {
  const BecomeDonor({super.key});

  @override
  State<BecomeDonor> createState() => _BecomeDonorState();
}

class _BecomeDonorState extends State<BecomeDonor> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.arrow_back),
                  SizedBox(
                    width: 50,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Become a donor",
                        style: TextStyle(
                            color: Color.fromARGB(255, 236, 65, 65),
                            fontWeight: FontWeight.w600,
                            fontSize: 22),
                      )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Fill the questiions to become a donor",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "1. Do you have Diabetes?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundCheckBox(
                      size: 15,
                      onTap: (selected) {},
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Yes"),
                    SizedBox(
                      width: 200,
                    ),
                    RoundCheckBox(
                      size: 15,
                      checkedColor: Colors.red,
                      onTap: (selected) {},
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("No"),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "2. Have you ever had problems with heart and lunges?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundCheckBox(
                      size: 15,
                      onTap: (selected) {},
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Yes"),
                    SizedBox(
                      width: 200,
                    ),
                    RoundCheckBox(
                      size: 15,
                      checkedColor: Colors.red,
                      onTap: (selected) {},
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("No"),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  " 3. In the last 30 days do you have any issue like covid-19 or dengue?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundCheckBox(
                      size: 15,
                      onTap: (selected) {},
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Yes"),
                    SizedBox(
                      width: 200,
                    ),
                    RoundCheckBox(
                      size: 15,
                      checkedColor: Colors.red,
                      onTap: (selected) {},
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("No"),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  " 4. Have you ever had a positive test for HIV/AIDS virus?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundCheckBox(
                      size: 15,
                      onTap: (selected) {},
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Yes"),
                    SizedBox(
                      width: 200,
                    ),
                    RoundCheckBox(
                      size: 15,
                      checkedColor: Colors.red,
                      onTap: (selected) {},
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("No"),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  " 5. Have you ever had a cancer?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundCheckBox(
                      size: 15,
                      onTap: (selected) {},
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Yes"),
                    SizedBox(
                      width: 200,
                    ),
                    RoundCheckBox(
                      size: 15,
                      checkedColor: Colors.red,
                      onTap: (selected) {},
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("No"),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 125, vertical: 120),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => SideBar()),
                        ));
                  },
                  child: Container(
                    height: 38,
                    width: 130,
                    child: Center(
                        child: Text(
                      "Become a donor",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    )),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
