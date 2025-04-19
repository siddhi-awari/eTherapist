import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';

import 'after_session.dart';

class WebViewScreen2 extends StatefulWidget {
  @override
  _WebViewScreen2State createState() => _WebViewScreen2State();
}

class _WebViewScreen2State extends State<WebViewScreen2> {
  late final WebViewController _controller;
  bool isLoading = true;

  final FlutterSoundRecorder _audioRecorder = FlutterSoundRecorder();
  bool _isRecording = false;
  String? _filePath;

  @override
  void initState() {
    super.initState();
    _initPermissions();
    _initWebView();
    _initializeRecorder();
  }

  Future<void> _initPermissions() async {
    await Permission.microphone.request();
    await Permission.storage.request();
  }

  void _initWebView() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) => setState(() => isLoading = true),
          onPageFinished: (_) => setState(() => isLoading = false),
        ),
      )
      ..loadFlutterAsset('lib/images/new.html');
  }

  Future<void> _initializeRecorder() async {
    await _audioRecorder.openRecorder();
  }

  Future<void> _startRecording() async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = '${tempDir.path}/audio_recording.aac';
    await _audioRecorder.startRecorder(toFile: tempPath);
    setState(() {
      _isRecording = true;
      _filePath = tempPath;
    });
  }

  Future<void> _stopRecording() async {
    await _audioRecorder.stopRecorder();
    setState(() {
      _isRecording = false;
    });
    _saveToLocalStorage();
  }

  Future<void> _saveToLocalStorage() async {
    if (_filePath != null) {
      Directory downloadsDir = Directory('/storage/emulated/0/Download');
      File tempFile = File(_filePath!);
      String savedFilePath = '${downloadsDir.path}/audio_recording.aac';
      await tempFile.copy(savedFilePath);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Recording saved: $savedFilePath')),
      );
      print('Saved File Path: $savedFilePath');
    }
  }

  @override
  void dispose() {
    _audioRecorder.closeRecorder();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interview Session'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => _controller.reload(),
          ),
        ],
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (isLoading)
            Center(child: CircularProgressIndicator()),

          // VR Button
          Positioned(
            bottom: 140,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                _controller.runJavaScript("document.querySelector('a-scene').enterVR();");
              },
              backgroundColor: Colors.blue,
              child: Icon(Icons.vrpano, color: Colors.white, size: 28),
            ),
          ),

          // Start/Stop Recording Button
          Positioned(
            bottom: 80,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                _isRecording ? _stopRecording() : _startRecording();
              },
              backgroundColor: _isRecording ? Colors.red : Colors.green,
              child: Icon(
                _isRecording ? Icons.stop : Icons.mic,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),

          // End Session Button
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AfterSession()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[400],
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'End Session',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'K2D',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




//
//
//
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// import 'after_session.dart';
//
// class WebViewScreen2 extends StatefulWidget {
//   @override
//   _WebViewScreen2State createState() => _WebViewScreen2State();
// }
//
// class _WebViewScreen2State extends State<WebViewScreen2> {
//   late final WebViewController _controller;
//   bool isLoading = true; // For loading indicator
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onPageStarted: (_) => setState(() => isLoading = true),
//           onPageFinished: (_) => setState(() => isLoading = false),
//         ),
//       )
//       ..loadFlutterAsset('lib/images/new.html'); // Ensure correct path
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//             icon: Icon(Icons.refresh),
//             onPressed: () => _controller.reload(),
//           ),
//         ],
//       ),
//       body: Stack(
//         children: [
//           WebViewWidget(controller: _controller),
//           if (isLoading) Center(child: CircularProgressIndicator()),
//
//           // VR Button (Floating in Bottom-Right)
//           Positioned(
//             bottom: 80,
//             right: 20,
//             child: FloatingActionButton(
//               onPressed: () {
//                 _controller.runJavaScript("document.querySelector('a-scene').enterVR();");
//               },
//               backgroundColor: Colors.blue,
//               child: Icon(Icons.vrpano, color: Colors.white, size: 28),
//             ),
//           ),
//
//           Positioned(
//             bottom: 20, // Keep button at the bottom
//             left: 0,
//             right: 0,
//             child: Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(builder: (context) => AfterSession()),
//                   );
//                   ; // Closes WebViewScreen
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.red[400],
//                   padding: EdgeInsets.symmetric(horizontal: 25, vertical: 9),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 child: Text(
//                   'End Session',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontFamily: 'K2D',
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
//
//
// // import 'package:app/pages/after_session.dart';
// // import 'package:flutter/material.dart';
// //
// // class VrPage2 extends StatefulWidget {
// //   @override
// //   State<VrPage2> createState() => _VrPageState2();
// // }
// //
// // class _VrPageState2 extends State<VrPage2> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Stack(
// //         children: <Widget>[
// //           // Background Image
// //           Container(
// //             width: double.infinity,
// //             height: double.infinity,
// //             decoration: BoxDecoration(
// //               image: DecorationImage(
// //                 image: AssetImage('lib/images/public.jpg'),
// //                 fit: BoxFit.cover,
// //               ),
// //             ),
// //           ),
// //           // "Please look at the screen" Text positioned over the image
// //           Positioned(
// //             top: 194,
// //             left: 80,
// //             child: Text(
// //               'Please look at the screen',
// //               textAlign: TextAlign.left,
// //               style: TextStyle(
// //                 color: Color.fromRGBO(0, 0, 0, 1),
// //                 fontFamily: 'K2D',
// //                 fontSize: 24,
// //                 letterSpacing: 0,
// //                 fontWeight: FontWeight.normal,
// //                 height: 1,
// //               ),
// //             ),
// //           ),
// //           // Top part with eTherapist text
// //
// //           // "End Session" Button at the bottom
// //           Positioned(
// //             bottom: 30,  // position it at the bottom with some margin
// //             left: 147,  // center the button horizontally
// //             child: TextButton(
// //               onPressed: () {
// //                 // Navigate to a new page when clicked
// //                 Navigator.push(
// //                   context,
// //                   MaterialPageRoute(builder: (context) => AfterSession()),
// //                 );
// //               },
// //               style: TextButton.styleFrom(
// //                 backgroundColor: Color.fromRGBO(0, 0, 0, 0.72),
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(50),
// //                 ),
// //                 minimumSize: Size(135, 39),
// //               ),
// //               child: Text(
// //                 'End Session',
// //                 style: TextStyle(
// //                   color: Color.fromRGBO(246, 245, 245, 1),
// //                   fontFamily: 'K2D',
// //                   fontSize: 20,
// //                   letterSpacing: 0,
// //                   fontWeight: FontWeight.normal,
// //                   height: 1,
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
