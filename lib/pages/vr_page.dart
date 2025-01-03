import 'package:app/pages/after_session.dart';
import 'package:flutter/material.dart';

class VrPage extends StatefulWidget {
  @override
  State<VrPage> createState() => _VrPageState();
}

class _VrPageState extends State<VrPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background Image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/images/Mdd.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // "Please look at the screen" Text positioned over the image
          Positioned(
            top: 194,
            left: 80,
            child: Text(
              'Please look at the screen',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'K2D',
                fontSize: 24,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
          // Top part with eTherapist text

          // "End Session" Button at the bottom
          Positioned(
            bottom: 30,  // position it at the bottom with some margin
            left: 147,  // center the button horizontally
            child: TextButton(
              onPressed: () {
                // Navigate to a new page when clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AfterSession()),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Color.fromRGBO(0, 0, 0, 0.72),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                minimumSize: Size(135, 39),
              ),
              child: Text(
                'End Session',
                style: TextStyle(
                  color: Color.fromRGBO(246, 245, 245, 1),
                  fontFamily: 'K2D',
                  fontSize: 20,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
