// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import '/pages/BecomeAdonor.dart';
import '/pages/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DonarDetails extends StatefulWidget {
  const DonarDetails({super.key});

  @override
  State<DonarDetails> createState() => _DonarDetailsState();
}

class _DonarDetailsState extends State<DonarDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Donation Details",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                        fontSize: 22),
                  )),
              // ignore: prefer_const_constructors
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(198, 225, 226, 222)),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  title: Text("Ali Ahmed"),
                  subtitle: Text(
                    "Islamabad",
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: Icon(Icons.message),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://s3-alpha-sig.figma.com/img/7d4c/0a85/28b1876e9ee8406ec97a5f6582d45c00?Expires=1676851200&Signature=WHGsyiIZ-YBo7wWW6u4viCNWHTLPX41ZkoUQRCVZvXNO4ynxh8BzjCcLFH~83NA8r6tnOC32xZ4RxzFgh0EDYU3keJcTqaQKUIgNwq-~iUfEaeMwSeNaMQk-tqsY13aAZcIWDBwWwevLHFc3sTWP4fxRyd0xDbCxhIccxqoYEgtGS6YZzV9vZDfR2KHesoWM3P4lfykjC4M8nYklVooeYAsNF~lTdNis-NGMBOgQP7wVFaE5aIQriGmameonVglOpIwRFt0f19VuuLJB5kSkHnjCIjD~ddiC~Ny5o55ZJ9GB18PE7zu1uzLMR4e-r8DnYauODmGXiQDnEofgTtiKew__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Text(
                      "Location:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Al Shifa Hospital RawalPindi",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Text(
                      "Schedule:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "22 June, 2022  Thursday  10:30am",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "Time Left",
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    child: Center(
                      child: Text(
                        "01",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    child: Center(
                      child: Text(
                        "22",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    child: Center(
                      child: Text(
                        "38",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Hours"),
                  SizedBox(
                    width: 30,
                  ),
                  Text("Minutes"),
                  SizedBox(
                    width: 20,
                  ),
                  Text("Seconds"),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Share your feedback",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RatingBar.builder(
                    itemSize: 20,
                    minRating: 1,
                    maxRating: 5,
                    itemBuilder: (context, index) {
                      return Icon(Icons.star_border);
                    },
                    onRatingUpdate: (rating) {
                      print("rating");
                    }),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                  child: Text(
                "Tell us how was the experience with the seeker",
                style: TextStyle(color: Color(0xff837D7D)),
              )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 200, horizontal: 20),
                child: Row(
                  children: [
                    Container(
                      child: Center(
                          child: Text(
                        "Cancle",
                        style: TextStyle(color: Color(0xffC82833)),
                      )),
                      width: 150,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffFAC8C8),
                        border: Border.all(color: Color(0xffC82833)),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BecomeDonor()));
                      },
                      child: Container(
                        child: Center(
                            child: Text(
                          "Donate",
                          style: TextStyle(color: Colors.white),
                        )),
                        width: 150,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffC82833),
                          border: Border.all(color: Color(0xffC82833)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
