import 'package:app/pages/Dhome.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_page.dart';
import '../util/logo_tile.dart';
import '../util/my_button.dart';
import '../util/textwidget.dart';
import 'login_page.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final nameCont = TextEditingController();
  final emailCont = TextEditingController();
  final passwordCont = TextEditingController();
  String userType = 'Patient';
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signUp() async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailCont.text.trim(),
        password: passwordCont.text.trim(),
      );

      String userId = userCredential.user!.uid;

      await FirebaseFirestore.instance.collection('users').doc(userId).set({
        'name': nameCont.text.trim(),
        'email': emailCont.text.trim(),
        'role': userType,
      });

      if (userType == 'Patient') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>  MainScreen()),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Image.asset('lib/images/Mdd.png', height: 150),
                      Container(
                        width: 155,
                        height: 100.0,
                        padding: const EdgeInsets.all(8.0),
                        child: const Text(
                          "Your Journey to Social Ease Begins Here",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 5,
                          textAlign: TextAlign.center,
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
                      "SIGNUP",
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
                    alignment: Alignment.centerLeft,
                    child: Text("Create your account to get started!"),
                  ),
                ),
                const SizedBox(height: 20),
                Textwidget(controller: nameCont, hintText: 'Name', hiddenText: false),
                const SizedBox(height: 10),
                Textwidget(controller: emailCont, hintText: 'Email', hiddenText: false),
                const SizedBox(height: 10),
                Textwidget(controller: passwordCont, hintText: 'Password', hiddenText: true),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Select User Type:',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile<String>(
                              title: const Text('Patient'),
                              value: 'Patient',
                              groupValue: userType,
                              onChanged: (value) => setState(() => userType = value!),
                            ),
                          ),
                          Expanded(
                            child: RadioListTile<String>(
                              title: const Text('Doctor'),
                              value: 'Doctor',
                              groupValue: userType,
                              onChanged: (value) => setState(() => userType = value!),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                MyButton(text: 'Sign Up', onPressed: signUp),
                const SizedBox(height: 10),
                const Text(
                  'or continue with',
                  style: TextStyle(color: Color.fromRGBO(12, 12, 106, 1.0)),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    logoTile(path: 'lib/images/Google_logo.png', onTap: () {}),
                    const SizedBox(width: 16),
                    logoTile(path: 'lib/images/mobile_logo.png', onTap: () {}),
                  ],
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  ),
                  child: const Text(
                    "Already have an account? Log in here!",
                    style: TextStyle(
                      color: Color.fromRGBO(12, 12, 106, 1.0),
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
