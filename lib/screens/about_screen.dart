import 'package:flutter/material.dart';
import 'package:meetly/resources/auth_methods.dart';
import 'package:meetly/utils/colors.dart';
import 'package:meetly/widgets/custom_button.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "About",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),

            // Developer
            ListTile(
              leading: const Icon(Icons.person_outline, color: Colors.white),
              title: const Text(
                "Developer",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              subtitle: const Text(
                "Created by Abbas Ansari",
                style: TextStyle(color: Colors.grey),
              ),
              onTap: () {},
            ),

            // Contact
            ListTile(
              leading: const Icon(Icons.email_outlined, color: Colors.white),
              title: const Text(
                "Contact",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              subtitle: const Text(
                "abbasxansari@gmail.com",
                style: TextStyle(color: Colors.grey),
              ),
              onTap: () {},
            ),

            ListTile(
              leading: const Icon(Icons.android_outlined, color: Colors.white),
              title: const Text(
                "Version",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              subtitle: const Text(
                "1.0",
                style: TextStyle(color: Colors.grey),
              ),
              onTap: () {},
            ),

            const Spacer(),

            // Logout button
            Center(
              child: CustomButton(
                text: 'Log Out',
                onPressed: () => AuthMethods().singOut(),
                color: buttonColor,
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
