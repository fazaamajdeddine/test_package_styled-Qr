import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:styled_qr/styled_qr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? qrCodeSvg;

  @override
  void initState() {
    super.initState();
    _generateQrCode();
  }

  // Generate the QR code
  Future<void> _generateQrCode() async {
    String svgString = await StyledQr(
            version: 2,
            data: 'https://www.linkedin.com/in/el-fazaa-majd-eddine-6b2439165/',
            eyeColor: "#f54242",
            pixelColor: "#6642f5",
            size: 400)
        .toSvgString();
    setState(() {
      qrCodeSvg = svgString; // Update state with the generated SVG
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Test Styled QR ')),
        body: Center(
          child: qrCodeSvg == null
              ? CircularProgressIndicator() // Show a loader while waiting for the QR code
              : SvgPicture.string(qrCodeSvg!), // Display the QR code
        ),
      ),
    );
  }
}
