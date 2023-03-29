// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'dart:async';

import 'package:blood/Modals/PostModal.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '/pages/DonarDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DonationDetails extends StatefulWidget {
  final PostModal post;
  const DonationDetails({super.key, required this.post});

  @override
  State<DonationDetails> createState() => _DonationDetailsState();
}

class _DonationDetailsState extends State<DonationDetails> {
  final Completer<GoogleMapController> _controller = Completer();

  late LatLng _center = LatLng(widget.post.latitude, widget.post.longitude);

  void _onMapCreated(GoogleMapController controller) {
    print("mm");

    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Donation Request",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 22),
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            // Image(
            //     height: 360,
            //     width: 400,
            //     image: NetworkImage(
            //         "https://s3-alpha-sig.figma.com/img/55d8/30c5/a6942a8270096af321b343e25e9f7b4d?Expires=1676246400&Signature=q7XwKsEQDVR5fvC3mLUSHMHhksdiFYPpMVA2KO8sWon1he5PFb5XGHV4~6kzlcNXDGvQgjBhVOUgqSbBrPFHv-NwxhNJI1kj69zdjZRlTxNGSSDNqa8HZvVn32Dnf0SfBI94g4OuCrTdGE8vFjKPdSJmb-u-WTFzCe1k~FQl8yFSTCOFiFCJpy-OwdGmJ-mwkWTgT3roa5E2FXSHp8CM9jT2rg6f6FIyCCGHXIpXbNFMNc2ETLjaCE2kr2mluzxZbDABI0pEGubM0tsEMWcLgS149QoEifvt~LLroLiFQehhIVCZz6-ots-sYdo-CrNnw~q8pgd8IFA1VhRZFXjHsg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4")),
            //
            SizedBox(
              height: 360,
              width: 400,
              child: GoogleMap(
                onMapCreated: (controller) {
                  _onMapCreated(controller);
                  print("Created");
                },
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 20.0,
                ),
                markers: {
                  Marker(markerId: MarkerId("1"), position: _center),
                },
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(widget.post.address),
                SizedBox(
                  width: 100,
                ),
                Text("Blood Group :"),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 30,
                  width: 30,
                  child: Center(
                    child: Text(
                      widget.post.blood_type,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Color(0xffFAC8C8),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text(widget.post.name),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(left: 40, top: 10),
                child: Text(
                  widget.post.contact,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    "https://www.fda.gov/files/iStock-955502676.jpg"),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(widget.post.details),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async{
                var url = "tel:${widget.post.contact}";
                await launchUrl(Uri.parse(url));
              },
              child: Container(
                height: 35,
                width: 120,
                child: Center(
                  child: Text(
                    "Donate Now",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffC82833),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
