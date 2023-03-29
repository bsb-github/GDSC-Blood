// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:math';

import 'package:blood/Modals/PostModal.dart';
import 'package:blood/Modals/UserModal.dart';
import 'package:blood/pages/AllRequest.dart';
import 'package:blood/pages/DonationRequestDetails.dart';
import 'package:blood/pages/DonationRequestPage.dart';
import 'package:blood/pages/ProfilePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '/Widgets/MyAppBar.dart';
import '/pages/LatestRequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }
  var random = Random();
  void getUserData() async {
    await FirebaseFirestore.instance
        .collection("UserData")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      UserData.Users.add(UserModal.fromSnapshot(value));
      print(UserData.Users.first);
    });
  }

  @override
  Widget build(BuildContext context) {
    int randomPost = random.nextInt(Post.posts.length);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyAppBar(),
              SizedBox(
                height: 30,
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.format_list_bulleted_sharp),
                        onPressed: () {},
                      ),
                      hintText: "Active Donors, Blood Group",
                      hintStyle: TextStyle(fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.orange)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Emergency",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("See all"),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              // RequestCard(post: Post.posts[0]),
              RequestTile(
                post: Post.posts[0],
                onDecline: () {},
                onDonate: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DonationDetails(post: Post.posts[0]),
                      ));
                },
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Services",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              // for two containers
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(DonationRequest());

                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => DonationDetails(),
                      //     ));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 10,
                      child: Container(
                        width: 180,
                        height: 108,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Icon(
                              Icons.bloodtype_sharp,
                              color: Colors.red,
                              size: 50,
                            ),
                            Text("Request for Blood"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(AllRequest());
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 10,
                      child: Container(
                        width: 180,
                        height: 108,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Icon(
                              Icons.monitor_heart_sharp,
                              color: Colors.red,
                              size: 50,
                            ),
                            Text("Donate Blood"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Next Appointment",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image(
                            height: 100,
                            width: 100,
                            image: NetworkImage(
                                "https://www.fda.gov/files/iStock-955502676.jpg")),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Al Shifa Hospital Attock Cantt"),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.date_range,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("12 Dec, 2022"),
                              SizedBox(
                                width: 30,
                              ),
                              Icon(
                                Icons.timer,
                                color: Colors.red,
                              ),
                              Text("9:50 pm"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Latest Request",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    InkWell(onTap: (){
                      Get.to(AllRequest());
                    }, child: Text("See all")),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              LtReq(post: Post.posts[randomPost], onTap: (){
                Get.to(DonationDetails(post:Post.posts[randomPost] ));
              },)
            ],
          ),
        ),
      ),
    );
  }
}
class LtReq extends StatelessWidget {
  final PostModal post;
  final Function() onTap;

  const LtReq({Key? key, required this.post, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                  height: 60,
                  image: NetworkImage(
                      "https://www.fda.gov/files/iStock-955502676.jpg")),
              const SizedBox(
                width: 24,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        post.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(post.address),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        LatestRequest())));
                          },
                          icon: Icon(
                            Icons.refresh,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Requested 1 min ago"),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RequestTile extends StatelessWidget {
  final PostModal post;
  final Function()? onDecline;
  final Function()? onDonate;
  const RequestTile({
    super.key,
    required this.post,
    this.onDecline,
    this.onDonate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 175,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Expanded(
                child: Image.asset("Assets/images/ab_negative.png"),
                flex: 2,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 75,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10))),
                        // margin: EdgeInsets.only(left: 250),
                        alignment: Alignment.centerRight,
                        child: Center(
                          child: Text(
                            "request",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Text(post.name),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Image.asset("Assets/images/location.png"),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(post.address)
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Image.asset("Assets/images/wait.png"),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(post.time_posted.toDate().minute.toString() +
                            " minutes Ago")
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: onDecline,
                          child: Text(
                            "Decline",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        SizedBox(
                          width: 140,
                          height: 20,
                          child: VerticalDivider(
                            color: Colors.black,
                          ),
                        ),
                        InkWell(
                          onTap: onDonate,
                          child: Text(
                            "Donate Now",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                flex: 8,
              )
            ],
          ),
        ),
      ),
    );
  }
}
