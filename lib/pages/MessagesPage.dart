import '/pages/DonationRequestPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Messages",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 22),
                    )),
                const SizedBox(
                  width: 150,
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => DonationRequest())));
                },
                child: Container(
                  child: const Text(
                    "Chats",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const ListTile(
              title: Text(
                "Ali Ahmed",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Mera Khoon ly lou plz "),
              trailing: Text("11:43"),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://s3-alpha-sig.figma.com/img/7d4c/0a85/28b1876e9ee8406ec97a5f6582d45c00?Expires=1676246400&Signature=TPSANIinY8II3x3tNAZqpCA0~N5ldhkuS52Vj9jT2fMRZJ1o~lS8bUumNz3foWfaRGRJW~Dq~cFDkm6b5TMlsuEgBKBGRNbag29ug3qy25RZd12a-S0jUNeYr6NaNqIfRCKcXkl3t686qhGwxRptll-eLWvZNzTfjkFvGgu4SKxXafMwOtRGkZjWtDxVSoMl0PLYvcl0ihhSFGEjppPHSJTwrHB76e2efOXn1wa257ei1lSFPqcz4H7C-mIe3TKTFFBnXUxaTri3z5k4QEIDXYFErIEO8mKdPWWGvjnTWbwEh30NIqpHqQpIFbp-saWzMiGiObqYM6QMvcbK1XvB~w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
              ),
            ),
            const ListTile(
              title: Text(
                "Ali Ahmed",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Mera Khoon ly lou plz "),
              trailing: Text("11:43"),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://s3-alpha-sig.figma.com/img/7d4c/0a85/28b1876e9ee8406ec97a5f6582d45c00?Expires=1676246400&Signature=TPSANIinY8II3x3tNAZqpCA0~N5ldhkuS52Vj9jT2fMRZJ1o~lS8bUumNz3foWfaRGRJW~Dq~cFDkm6b5TMlsuEgBKBGRNbag29ug3qy25RZd12a-S0jUNeYr6NaNqIfRCKcXkl3t686qhGwxRptll-eLWvZNzTfjkFvGgu4SKxXafMwOtRGkZjWtDxVSoMl0PLYvcl0ihhSFGEjppPHSJTwrHB76e2efOXn1wa257ei1lSFPqcz4H7C-mIe3TKTFFBnXUxaTri3z5k4QEIDXYFErIEO8mKdPWWGvjnTWbwEh30NIqpHqQpIFbp-saWzMiGiObqYM6QMvcbK1XvB~w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
              ),
            ),
            const ListTile(
              title: Text(
                "Ali Ahmed",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Mera Khoon ly lou plz "),
              trailing: Text("11:43"),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://s3-alpha-sig.figma.com/img/7d4c/0a85/28b1876e9ee8406ec97a5f6582d45c00?Expires=1676246400&Signature=TPSANIinY8II3x3tNAZqpCA0~N5ldhkuS52Vj9jT2fMRZJ1o~lS8bUumNz3foWfaRGRJW~Dq~cFDkm6b5TMlsuEgBKBGRNbag29ug3qy25RZd12a-S0jUNeYr6NaNqIfRCKcXkl3t686qhGwxRptll-eLWvZNzTfjkFvGgu4SKxXafMwOtRGkZjWtDxVSoMl0PLYvcl0ihhSFGEjppPHSJTwrHB76e2efOXn1wa257ei1lSFPqcz4H7C-mIe3TKTFFBnXUxaTri3z5k4QEIDXYFErIEO8mKdPWWGvjnTWbwEh30NIqpHqQpIFbp-saWzMiGiObqYM6QMvcbK1XvB~w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
              ),
            ),
            const ListTile(
              title: Text(
                "Ali Ahmed",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Mera Khoon ly lou plz "),
              trailing: Text("11:43"),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://s3-alpha-sig.figma.com/img/7d4c/0a85/28b1876e9ee8406ec97a5f6582d45c00?Expires=1676246400&Signature=TPSANIinY8II3x3tNAZqpCA0~N5ldhkuS52Vj9jT2fMRZJ1o~lS8bUumNz3foWfaRGRJW~Dq~cFDkm6b5TMlsuEgBKBGRNbag29ug3qy25RZd12a-S0jUNeYr6NaNqIfRCKcXkl3t686qhGwxRptll-eLWvZNzTfjkFvGgu4SKxXafMwOtRGkZjWtDxVSoMl0PLYvcl0ihhSFGEjppPHSJTwrHB76e2efOXn1wa257ei1lSFPqcz4H7C-mIe3TKTFFBnXUxaTri3z5k4QEIDXYFErIEO8mKdPWWGvjnTWbwEh30NIqpHqQpIFbp-saWzMiGiObqYM6QMvcbK1XvB~w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
              ),
            ),
            const ListTile(
              title: Text(
                "Ali Ahmed",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Mera Khoon ly lou plz "),
              trailing: Text("11:43"),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://s3-alpha-sig.figma.com/img/7d4c/0a85/28b1876e9ee8406ec97a5f6582d45c00?Expires=1676246400&Signature=TPSANIinY8II3x3tNAZqpCA0~N5ldhkuS52Vj9jT2fMRZJ1o~lS8bUumNz3foWfaRGRJW~Dq~cFDkm6b5TMlsuEgBKBGRNbag29ug3qy25RZd12a-S0jUNeYr6NaNqIfRCKcXkl3t686qhGwxRptll-eLWvZNzTfjkFvGgu4SKxXafMwOtRGkZjWtDxVSoMl0PLYvcl0ihhSFGEjppPHSJTwrHB76e2efOXn1wa257ei1lSFPqcz4H7C-mIe3TKTFFBnXUxaTri3z5k4QEIDXYFErIEO8mKdPWWGvjnTWbwEh30NIqpHqQpIFbp-saWzMiGiObqYM6QMvcbK1XvB~w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
              ),
            ),
            const ListTile(
              title: Text(
                "Ali Ahmed",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Mera Khoon ly lou plz "),
              trailing: Text("11:43"),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://s3-alpha-sig.figma.com/img/7d4c/0a85/28b1876e9ee8406ec97a5f6582d45c00?Expires=1676246400&Signature=TPSANIinY8II3x3tNAZqpCA0~N5ldhkuS52Vj9jT2fMRZJ1o~lS8bUumNz3foWfaRGRJW~Dq~cFDkm6b5TMlsuEgBKBGRNbag29ug3qy25RZd12a-S0jUNeYr6NaNqIfRCKcXkl3t686qhGwxRptll-eLWvZNzTfjkFvGgu4SKxXafMwOtRGkZjWtDxVSoMl0PLYvcl0ihhSFGEjppPHSJTwrHB76e2efOXn1wa257ei1lSFPqcz4H7C-mIe3TKTFFBnXUxaTri3z5k4QEIDXYFErIEO8mKdPWWGvjnTWbwEh30NIqpHqQpIFbp-saWzMiGiObqYM6QMvcbK1XvB~w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
