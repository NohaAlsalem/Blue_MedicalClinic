
import 'package:flutter/material.dart';

class CoronaSection extends StatefulWidget {
  const CoronaSection({Key? key}) : super(key: key);
  @override
  State<CoronaSection> createState() => _CoronaSection();
}
class _CoronaSection extends State<CoronaSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration:  const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter ,
              colors: [
                Color(0xAA1a76b5),
                Color(0xAAf3e5f5),
              ]),
        ),
        child: Center(
            child: Text('S O 0 O 0 N',
                style: TextStyle(
                  color :Color(0xFF0876D4),
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 4.0,
                      color: Colors.white,
                      offset: Offset(3.0, 3.0),
                    ),
                  ],
                )),
        ),
      ),
    );
  }
}