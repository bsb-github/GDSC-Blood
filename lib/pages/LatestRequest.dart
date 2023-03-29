import '/Widgets/MyAppBar.dart';
import '/pages/EmeryegncyPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LatestRequest extends StatefulWidget {
  const LatestRequest({super.key});

  @override
  State<LatestRequest> createState() => _LatestRequestState();
}

class _LatestRequestState extends State<LatestRequest> {
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
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EmergencyPage()));
                      },
                      child: Container(
                        child: const Text(
                          "Emergency",
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                                color: Colors.red)),
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
              RequestCard(),
              RequestCard(),
              RequestCard(),
              RequestCard()
              // card 2
            ],
          ),
        ),
      ),
    );
  }
}

class RequestCard extends StatelessWidget {
  const RequestCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
                          "https://www.fda.gov/files/iStock-955502676.jpg"),
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
                      Text("Al-Shifa Hospital" + "\n" + "Attock Cantt"),
                      SizedBox(
                        width: 80,
                      ),
                      Image(
                          height: 50,
                          image: NetworkImage(
                              "https://www.fda.gov/files/iStock-955502676.jpg")),
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
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
