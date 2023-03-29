import 'package:blood/Modals/PostModal.dart';
import 'package:blood/Widgets/MyAppBar.dart';
import 'package:blood/pages/DonationRequestDetails.dart';
import 'package:blood/pages/HomePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllRequest extends StatefulWidget {
  const AllRequest({Key? key}) : super(key: key);

  @override
  State<AllRequest> createState() => _AllRequestState();
}

class _AllRequestState extends State<AllRequest> {
  @override
  void initState() {
    // TODO: implement initState
    getPost();

    super.initState();
  }
  Future<void> getPost() async {
    Post.posts.clear();
    await FirebaseFirestore.instance.collection("Posts").get().then((value) {
      Post.posts = value.docs.map((e) => PostModal.fromSnapshot(e)).toList();
    });
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      body: Column(
        children: [
          MyAppBar(),
          Post.posts.isNotEmpty ?Padding(padding: EdgeInsets.all(16), child: SingleChildScrollView(child: ListView.builder(shrinkWrap: true,itemCount: Post.posts.length, itemBuilder: (context, index) {
            return LtReq(post: Post.posts[index], onTap: (){
              Get.to(DonationDetails(post: Post.posts[index]));
            });
          },),),): Center(
            child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),
          )
        ],
      ),
    ));
  }
}
