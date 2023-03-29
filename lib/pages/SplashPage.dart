import 'package:blood/Modals/PostModal.dart';
import 'package:blood/Modals/UserModal.dart';
import 'package:blood/pages/HomePage.dart';
import 'package:blood/pages/MainHomePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '/Modals/LocationModal.dart';
import '/pages/NoInternetConnectionPage.dart';
import '/pages/SignInPage.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    Position pos;
    print(_determinePosition().then((value) {
      pos = value;
      print(pos.latitude.toString());
      print(pos.longitude.toString());
    }));

    Future.delayed(const Duration(seconds: 2)).then((value) {
      checkInternetCon();
    });
    super.initState();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  void checkInternetCon() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // Navigate to Required Page
      // ignore: use_build_context_synchronously
      if (FirebaseAuth.instance.currentUser == null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const SignInPage()));
      } else {
        await getUserData();
      }
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const NoInternetConnectionPage()));
    }
  }

  Future<void> getUserData() async {
    await FirebaseFirestore.instance
        .collection("UserData")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) async {
      print(value);
      UserData.Users.clear();
      UserData.Users.add(UserModal.fromSnapshot(value));
      await getPost().then((value) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MainHomePage(),
            ));
      });
    });
  }

  Future<void> getPost() async {
    Post.posts.clear();
    await FirebaseFirestore.instance.collection("Posts").get().then((value) {
      Post.posts = value.docs.map((e) => PostModal.fromSnapshot(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.7,
            ),
            Image.asset(
              "Assets/images/splashLogo.png",
              height: 150,
            ),
            Expanded(child: Container()),
            const CircularProgressIndicator(
              strokeWidth: 2,
              color: Colors.white,
            ),
            const SizedBox(
              height: 75,
            )
          ],
        ),
      ),
    );
  }
}
