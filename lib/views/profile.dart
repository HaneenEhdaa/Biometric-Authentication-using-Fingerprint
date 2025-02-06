import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
              color: Color(0xFF954535),
              fontSize: 25,
              fontWeight: FontWeight.w200),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(
                      "https://thumbs.dreamstime.com/b/spirited-alone-girl-traveler-view-trip-generate-ai-generated-313524371.jpg")),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Full Name: Haneen Ehdaa",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Email: haneen.ehdaa@gmail.com",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
