import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Options extends StatelessWidget {
  final Icon icon1;
  final String text1;
  const Options({
    super.key,
    required this.icon1,
    required this.text1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          icon1,
          SizedBox(
            width: 10,
          ),
          Text(
            text1,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
