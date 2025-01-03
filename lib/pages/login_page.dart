import 'package:flutter/material.dart';
import 'package:app/pages/home_page.dart';
import 'package:app/pages/register_page.dart';
import 'package:app/pages/start_page.dart';
import 'package:app/ui/theme/colors.dart';

import '../util/logo_tile.dart';
import '../util/my_button.dart';
import '../util/textwidget.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailCont = TextEditingController();
  final passwordCont = TextEditingController();
  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context); // Makes the back button work
            },
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  // Add your image here (use your actual image path)
                  Image.asset('lib/images/img_1.png', height: 110), // Change path and size as needed
                  Container(
                    width: 155,  // Adjust width to your desired size
                    height: 100.0,  // Adjust height to your desired size
                    padding: const EdgeInsets.all(8.0),  // Optional padding inside the box
                    child: const Text(
                      "Understanding and Healing Social Anxiety",  // Your caption text
                      style: TextStyle(
                        fontSize: 20,  // Adjust the font size to fit the text
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      // overflow: TextOverflow.ellipsis,  // To handle overflow text with ellipsis
                      maxLines: 5,  // Limits the number of lines in the text
                      textAlign: TextAlign.center,  // Centers the text within the box
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                    fontFamily: 'Times New Roman',
                    fontStyle: FontStyle.italic,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Align(
                  alignment:Alignment.centerLeft,
                  child: Text("Welcome back! Please log in to continue.")),
            ),
            const SizedBox(height: 20,),
            Textwidget(
              controller: emailCont,
              hintText: 'Email',
              hiddenText: false,
            ),
            const SizedBox(height: 10,),
            Textwidget(
              controller: passwordCont,
              hintText: 'Password',
              hiddenText: true,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.blue.withOpacity(0.7), // Blue color with slight transparency
                      fontSize: 12, // You can adjust the font size if needed
                    ),
                  ),
                ),
              ),
            ),
            MyButton(
              text: 'Sign In',
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            const SizedBox(height: 10),
            const Text(
              'or continue with',
              style: TextStyle(
                color: Color.fromRGBO(12, 12, 106, 1.0),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                logoTile(path: 'lib/images/Google_logo.png', onTap: (){}),
                const SizedBox(width: 16),
                logoTile(path: 'lib/images/mobile_logo.png', onTap: (){}),
              ],
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Register()),
                );

              },
              child: const Text(
                "Don't have an account? Register here!",
                style: TextStyle(
                  color: Color.fromRGBO(12, 12, 106, 1.0),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
