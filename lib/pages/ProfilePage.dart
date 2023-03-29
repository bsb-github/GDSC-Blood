import 'package:blood/Modals/UserModal.dart';
import 'package:blood/pages/SignInPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '/pages/DonationRequestDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final XFile? image = null;
  Future<bool> checkStoragePermission() async {
    var status = await Permission.storage.status;
    if (status.isDenied) {
      var booli = await Permission.storage.request();
      if (booli.isGranted) {
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }

  @override
  void initState() {
    checkStoragePermission();
    print(UserData.Users.first.email);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: const Text(
            "Profile",
            style: TextStyle(
                color: Color.fromARGB(255, 236, 65, 65),
                fontWeight: FontWeight.w600,
                fontSize: 22),
          ),
          actions: [
            IconButton(onPressed: (){
              var goolAuth = GoogleSignIn();
              if(FirebaseAuth.instance.currentUser!.emailVerified){
                goolAuth.disconnect();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInPage(),));
              }else{
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInPage(),));
              }
            }, icon: Icon(FontAwesomeIcons.signOut, color: Theme.of(context).primaryColor,))
          ],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Center(
                  child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRETTnzwl1bBdgD0JFHDE9eNf2TBhasQSxNumxDt5U5pw&s"),
                radius: 90,
              )),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  "Name",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  enabled: false,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_2_outlined),
                    hintText: UserData.Users[0].name,
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  "Email",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  enabled: false,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: UserData.Users[0].email,
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  "Phone",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  enabled: false,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    hintText: UserData.Users[0].contact,
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Center(
                          child: Text(
                        "Edit",
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
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => DonationDetails()));
                      },
                      child: Container(
                        child: Center(
                            child: Text(
                          "Save",
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
