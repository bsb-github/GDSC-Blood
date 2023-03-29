import '/pages/MessagesPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../Widgets/MyAppBar.dart';

class EmergencyPage extends StatefulWidget {
  const EmergencyPage({super.key});

  @override
  State<EmergencyPage> createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              MyAppBar(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        child: const Text(
                          "Emergency",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                      child: VerticalDivider(
                        color: Colors.grey,
                        thickness: .5,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        child: const Text("Latest Request",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              //divider
              const Divider(
                color: Colors.grey,
                thickness: .5,
              ),

              // card number 1
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: const [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://s3-alpha-sig.figma.com/img/7d4c/0a85/28b1876e9ee8406ec97a5f6582d45c00?Expires=1676246400&Signature=TPSANIinY8II3x3tNAZqpCA0~N5ldhkuS52Vj9jT2fMRZJ1o~lS8bUumNz3foWfaRGRJW~Dq~cFDkm6b5TMlsuEgBKBGRNbag29ug3qy25RZd12a-S0jUNeYr6NaNqIfRCKcXkl3t686qhGwxRptll-eLWvZNzTfjkFvGgu4SKxXafMwOtRGkZjWtDxVSoMl0PLYvcl0ihhSFGEjppPHSJTwrHB76e2efOXn1wa257ei1lSFPqcz4H7C-mIe3TKTFFBnXUxaTri3z5k4QEIDXYFErIEO8mKdPWWGvjnTWbwEh30NIqpHqQpIFbp-saWzMiGiObqYM6QMvcbK1XvB~w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 20, left: 8),
                              child: Text(
                                "GovinRaj",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.bloodtype,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                    "Al-Shifa Hospital" + "\n" + "ttock Cantt"),
                                SizedBox(
                                  width: 80,
                                ),
                                Image(
                                    height: 50,
                                    image: NetworkImage(
                                        "https://s3-alpha-sig.figma.com/img/ca84/37d0/c04ce7f5d83d6aaa78c7c30b7f150004?Expires=1676246400&Signature=gf5DVtfKxacfKM-cTpPMTb5KfA8QzMBpzryfarDPNxpSOPNNsyrUbp5f2kRj18n4-mH0PlthHwEvTh3l85zoOzuyQJXf5yteNkSxgyhd~QubET4pkRidQTbQ05f5BVwPAAf6c9Z6RqB9-Tp8MkEyEB~uVlsrc~nGiq-9pH0XRAyivItDcrnXI0tdFKMDAKFCh0VOsrrz2~zf166LtwZkAiYEayVGrh8OHL5jsP753sGKmgCXaAO0-YleDwks0naDruH1DzCXHaXuifGD9CAUOXnPorWzbeAza2LLNgo5uvJMDrByfzdfbhSuGR4H2zCBlg9is27Aft5bnKTxwgdrcA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4")),
                              ],
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.refresh,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Requested 10 minutes ago"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: .5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Decline"),
                          const SizedBox(
                            height: 25,
                            child: VerticalDivider(
                              color: Colors.grey,
                              thickness: .5,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MessagesPage()));
                            },
                            child: Container(
                              child: Text(
                                "Donate Now",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              // card 2
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: const [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://s3-alpha-sig.figma.com/img/7d4c/0a85/28b1876e9ee8406ec97a5f6582d45c00?Expires=1676246400&Signature=TPSANIinY8II3x3tNAZqpCA0~N5ldhkuS52Vj9jT2fMRZJ1o~lS8bUumNz3foWfaRGRJW~Dq~cFDkm6b5TMlsuEgBKBGRNbag29ug3qy25RZd12a-S0jUNeYr6NaNqIfRCKcXkl3t686qhGwxRptll-eLWvZNzTfjkFvGgu4SKxXafMwOtRGkZjWtDxVSoMl0PLYvcl0ihhSFGEjppPHSJTwrHB76e2efOXn1wa257ei1lSFPqcz4H7C-mIe3TKTFFBnXUxaTri3z5k4QEIDXYFErIEO8mKdPWWGvjnTWbwEh30NIqpHqQpIFbp-saWzMiGiObqYM6QMvcbK1XvB~w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 20, left: 8),
                              child: Text(
                                "GovinRaj",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.bloodtype,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                    "Al-Shifa Hospital" + "\n" + "ttock Cantt"),
                                SizedBox(
                                  width: 80,
                                ),
                                Image(
                                    height: 50,
                                    image: NetworkImage(
                                        "https://s3-alpha-sig.figma.com/img/ca84/37d0/c04ce7f5d83d6aaa78c7c30b7f150004?Expires=1676246400&Signature=gf5DVtfKxacfKM-cTpPMTb5KfA8QzMBpzryfarDPNxpSOPNNsyrUbp5f2kRj18n4-mH0PlthHwEvTh3l85zoOzuyQJXf5yteNkSxgyhd~QubET4pkRidQTbQ05f5BVwPAAf6c9Z6RqB9-Tp8MkEyEB~uVlsrc~nGiq-9pH0XRAyivItDcrnXI0tdFKMDAKFCh0VOsrrz2~zf166LtwZkAiYEayVGrh8OHL5jsP753sGKmgCXaAO0-YleDwks0naDruH1DzCXHaXuifGD9CAUOXnPorWzbeAza2LLNgo5uvJMDrByfzdfbhSuGR4H2zCBlg9is27Aft5bnKTxwgdrcA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4")),
                              ],
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.refresh,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Requested 10 minutes ago"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: .5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Decline"),
                          SizedBox(
                            height: 25,
                            child: VerticalDivider(
                              color: Colors.grey,
                              thickness: .5,
                            ),
                          ),
                          Text(
                            "Donate Now",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              // card 3
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: const [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://s3-alpha-sig.figma.com/img/7d4c/0a85/28b1876e9ee8406ec97a5f6582d45c00?Expires=1676246400&Signature=TPSANIinY8II3x3tNAZqpCA0~N5ldhkuS52Vj9jT2fMRZJ1o~lS8bUumNz3foWfaRGRJW~Dq~cFDkm6b5TMlsuEgBKBGRNbag29ug3qy25RZd12a-S0jUNeYr6NaNqIfRCKcXkl3t686qhGwxRptll-eLWvZNzTfjkFvGgu4SKxXafMwOtRGkZjWtDxVSoMl0PLYvcl0ihhSFGEjppPHSJTwrHB76e2efOXn1wa257ei1lSFPqcz4H7C-mIe3TKTFFBnXUxaTri3z5k4QEIDXYFErIEO8mKdPWWGvjnTWbwEh30NIqpHqQpIFbp-saWzMiGiObqYM6QMvcbK1XvB~w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 20, left: 8),
                              child: Text(
                                "GovinRaj",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.bloodtype,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                    "Al-Shifa Hospital" + "\n" + "ttock Cantt"),
                                SizedBox(
                                  width: 80,
                                ),
                                Image(
                                    height: 50,
                                    image: NetworkImage(
                                        "https://s3-alpha-sig.figma.com/img/ca84/37d0/c04ce7f5d83d6aaa78c7c30b7f150004?Expires=1676246400&Signature=gf5DVtfKxacfKM-cTpPMTb5KfA8QzMBpzryfarDPNxpSOPNNsyrUbp5f2kRj18n4-mH0PlthHwEvTh3l85zoOzuyQJXf5yteNkSxgyhd~QubET4pkRidQTbQ05f5BVwPAAf6c9Z6RqB9-Tp8MkEyEB~uVlsrc~nGiq-9pH0XRAyivItDcrnXI0tdFKMDAKFCh0VOsrrz2~zf166LtwZkAiYEayVGrh8OHL5jsP753sGKmgCXaAO0-YleDwks0naDruH1DzCXHaXuifGD9CAUOXnPorWzbeAza2LLNgo5uvJMDrByfzdfbhSuGR4H2zCBlg9is27Aft5bnKTxwgdrcA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4")),
                              ],
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.refresh,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Requested 10 minutes ago"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: .5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Decline"),
                          SizedBox(
                            height: 25,
                            child: VerticalDivider(
                              color: Colors.grey,
                              thickness: .5,
                            ),
                          ),
                          Text(
                            "Donate Now",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              // card 4
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: const [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://s3-alpha-sig.figma.com/img/7d4c/0a85/28b1876e9ee8406ec97a5f6582d45c00?Expires=1676246400&Signature=TPSANIinY8II3x3tNAZqpCA0~N5ldhkuS52Vj9jT2fMRZJ1o~lS8bUumNz3foWfaRGRJW~Dq~cFDkm6b5TMlsuEgBKBGRNbag29ug3qy25RZd12a-S0jUNeYr6NaNqIfRCKcXkl3t686qhGwxRptll-eLWvZNzTfjkFvGgu4SKxXafMwOtRGkZjWtDxVSoMl0PLYvcl0ihhSFGEjppPHSJTwrHB76e2efOXn1wa257ei1lSFPqcz4H7C-mIe3TKTFFBnXUxaTri3z5k4QEIDXYFErIEO8mKdPWWGvjnTWbwEh30NIqpHqQpIFbp-saWzMiGiObqYM6QMvcbK1XvB~w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 20, left: 8),
                              child: Text(
                                "GovinRaj",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.bloodtype,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                    "Al-Shifa Hospital" + "\n" + "ttock Cantt"),
                                SizedBox(
                                  width: 80,
                                ),
                                Image(
                                    height: 50,
                                    image: NetworkImage(
                                        "https://s3-alpha-sig.figma.com/img/ca84/37d0/c04ce7f5d83d6aaa78c7c30b7f150004?Expires=1676246400&Signature=gf5DVtfKxacfKM-cTpPMTb5KfA8QzMBpzryfarDPNxpSOPNNsyrUbp5f2kRj18n4-mH0PlthHwEvTh3l85zoOzuyQJXf5yteNkSxgyhd~QubET4pkRidQTbQ05f5BVwPAAf6c9Z6RqB9-Tp8MkEyEB~uVlsrc~nGiq-9pH0XRAyivItDcrnXI0tdFKMDAKFCh0VOsrrz2~zf166LtwZkAiYEayVGrh8OHL5jsP753sGKmgCXaAO0-YleDwks0naDruH1DzCXHaXuifGD9CAUOXnPorWzbeAza2LLNgo5uvJMDrByfzdfbhSuGR4H2zCBlg9is27Aft5bnKTxwgdrcA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4")),
                              ],
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.refresh,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Requested 10 minutes ago"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: .5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Decline"),
                          SizedBox(
                            height: 25,
                            child: VerticalDivider(
                              color: Colors.grey,
                              thickness: .5,
                            ),
                          ),
                          Text(
                            "Donate Now",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
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
