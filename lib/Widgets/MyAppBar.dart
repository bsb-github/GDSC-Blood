import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          TextButton(
              onPressed: () {},
              child: Text(
                "Blonate",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 22),
              )),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.notifications_none_rounded)),
        ],
      ),
    );
  }
}
