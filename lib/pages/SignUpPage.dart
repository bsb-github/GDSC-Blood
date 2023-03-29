import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '/pages/SignInPage.dart';
import '/providers/CountryCodeProvider.dart';
import 'package:country_picker/country_picker.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/ShowPassProvider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String val = "";
  @override
  void dispose() {
    // TODO: implement dispose
    _usernameController.clear();
    _emailController.clear();
    _addressController.clear();
    _confirmPasswordController.clear();
    _phoneController.clear();
    _passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                color: Theme.of(context).primaryColor,
                child: Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: GoogleFonts.aBeeZee().fontFamily,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(50))),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFormField(
                                controller: _usernameController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "*required";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    prefixIcon: Icon(FontAwesomeIcons.user),
                                    hintText: "User name",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    )),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "*required";
                                  } else if (!value.contains("@")) {
                                    return "Inavlid Email";
                                  }
                                  return null;
                                },
                                controller: _emailController,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.email_outlined),
                                    hintText: "Email",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    )),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Consumer(
                                builder: (context, child, widget) =>
                                    TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "*required";
                                    }
                                    return null;
                                  },
                                  controller: _phoneController,
                                  decoration: InputDecoration(
                                      prefixIcon: GestureDetector(
                                        onTap: () {
                                          showCountryPicker(
                                              context: context,
                                              onSelect: (value) {
                                                setState(() {
                                                  val = value.countryCode;
                                                });
                                                context
                                                    .read<CountryCodeProvider>()
                                                    .setCountryCode(
                                                        value.phoneCode);
                                              });
                                        },
                                        child: Container(
                                          height: 3,
                                          width: 3,
                                          child: Center(
                                            child: Text(
                                              context
                                                  .watch<CountryCodeProvider>()
                                                  .countryCode,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      hintText: "Phone number",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      )),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: _addressController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "*required";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.home_outlined),
                                    hintText: "Address",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    )),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: _passwordController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "*required";
                                  } else if (value.length < 8) {
                                    return "Length must be atleast 8 character long";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock),
                                    hintText: "Password",
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          context
                                              .read<ShowPassProvider>()
                                              .changeShowPassSignUpState();
                                        },
                                        icon: !context
                                                .watch<ShowPassProvider>()
                                                .showPassSignUp
                                            ? const Icon(
                                                Icons.visibility_outlined)
                                            : const Icon(
                                                Icons.visibility_off_outlined)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    )),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: _confirmPasswordController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return ("*Required");
                                  } else if (value !=
                                      _passwordController.text) {
                                    return "Password doesn't match";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          context
                                              .read<ShowPassProvider>()
                                              .change_ShowPassSignUpState();
                                        },
                                        icon: !context
                                                .watch<ShowPassProvider>()
                                                .showPassPage
                                            ? const Icon(
                                                Icons.visibility_outlined)
                                            : const Icon(
                                                Icons.visibility_off_outlined)),
                                    hintText: "Confirm password",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    )),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  if (_formKey.currentState!.validate()) {
                                    createUser(
                                        name: _usernameController.text,
                                        phoneNumber: _phoneController.text,
                                        countryCode: val,
                                        email: _emailController.text,
                                        address: _addressController.text,
                                        password:
                                            _confirmPasswordController.text);
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
                                        "Sign Up",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 22),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
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
                                  Image.asset(
                                    "Assets/images/logo_google.png",
                                    height: 30,
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
                                    "Already have an account?",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontFamily:
                                          GoogleFonts.aBeeZee().fontFamily,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => const SignInPage());
                                    },
                                    child: Text(
                                      "Log In",
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontFamily:
                                            GoogleFonts.aBeeZee().fontFamily,
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
            ],
          )),
    );
  }

  void createUser(
      {required String name,
      required String phoneNumber,
      required String countryCode,
      required String email,
      required String address,
      required String password}) async {
    EasyLoading.show();
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await FirebaseFirestore.instance
            .collection("UserData")
            .doc(value.user!.uid)
            .set({
          "address": address,
          "contact": countryCode + phoneNumber,
          "email": email,
          "name": name,
          "uid": value.user!.uid,
        }).then((value) {
          Get.snackbar("Sign Up SuccessFul", "$name you can now login",
              colorText: Colors.white, backgroundColor: Colors.pink);
        });
        EasyLoading.dismiss();
        Get.to(SignInPage());
      });
    } on FirebaseAuthException catch (e) {
      EasyLoading.showError(e.message.toString());
      EasyLoading.dismiss();
      Get.snackbar("Sign Up failed", e.message.toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }
}
