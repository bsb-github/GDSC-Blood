import 'package:blood/DataProviders/DataProvider.dart';
import 'package:blood/pages/MainHomePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../Modals/PostModal.dart';
import '../Modals/UserModal.dart';
import '/pages/HomePage.dart';
import '/pages/SignUpPage.dart';
import '/providers/ShowPassProvider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print("building");
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).primaryColor,
          body: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(80)),
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Log In",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 35,
                          fontFamily: GoogleFonts.aBeeZee().fontFamily,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(FontAwesomeIcons.user),
                            hintText: "Email",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Consumer(
                        builder: (context, child, widget) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText:
                                context.watch<ShowPassProvider>().showPass,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock_outline),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    context
                                        .read<ShowPassProvider>()
                                        .changeShowPassState();
                                  },
                                  icon: !context
                                          .watch<ShowPassProvider>()
                                          .showPass
                                      ? const Icon(Icons.visibility_outlined)
                                      : const Icon(
                                          Icons.visibility_off_outlined)),
                              hintText: "Password",
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        splashColor: Theme.of(context).primaryColor,
                        child: const Padding(
                          padding: EdgeInsets.only(right: 16.0, top: 16.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            createSignIn(
                                email: _emailController.text,
                                password: _passwordController.text);
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            height: 55,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Center(
                              child: Text(
                                "Log In",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        "or continue with",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              await DataProvider.googleSignIn();
                            },
                            child: Image.asset(
                              "Assets/images/logo_google.png",
                              height: 30,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Image.asset(
                            "Assets/images/logo_fb.png",
                            height: 30,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(
                              fontSize: 17,
                              fontFamily: GoogleFonts.aBeeZee().fontFamily,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => const SignUpPage());
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontFamily: GoogleFonts.aBeeZee().fontFamily,
                                fontSize: 17,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  createSignIn({required String email, required String password}) async {
    try {
      EasyLoading.show();
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        getUserData(value.user!.uid);
      });
    } on FirebaseAuthException catch (e) {
      EasyLoading.showError(e.message.toString());
      EasyLoading.dismiss();
    }
  }

  Future<void> getUserData(String id) async {
    try {
      await FirebaseFirestore.instance
          .collection("UserData")
          .doc(id)
          .get()
          .then((value) async {
        print(value);
        UserData.Users.clear();
        UserData.Users.add(UserModal.fromSnapshot(value));
        await getPost().then((value) {
          EasyLoading.dismiss();
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MainHomePage(),
              ));
        });
      });
    } on FirebaseException catch (e) {
      EasyLoading.showError(e.message.toString());
      EasyLoading.dismiss();
    }
  }

  Future<void> getPost() async {
    await FirebaseFirestore.instance.collection("Posts").get().then((value) {
      Post.posts = value.docs.map((e) => PostModal.fromSnapshot(e)).toList();
    });
  }
}
