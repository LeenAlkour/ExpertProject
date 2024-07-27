import 'package:flutter/material.dart';
import 'package:project1/Local_login.dart';



class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 6)).then((val) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Local_login()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
             Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Colors.white, //.withOpacity(0.5)
                        Color(0xFF880e4f),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                    ))),

          ],
        ),
      ),
    );
  }
}
