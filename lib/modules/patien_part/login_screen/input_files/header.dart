import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding : const EdgeInsets.all(20),
      child : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
         const SizedBox(height : 10),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                  border: Border.all(
                      color:  const Color(0xAAf3e5f5),
                      width: 5
                  ),
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image:  const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/blue_logo.jpg'),
                  )
              ),
            ),
          ),
          const SizedBox(height: 30,),
          const Center(
         child : Text('Welcome to Blue Medical Clinic '
             , style : TextStyle(color : Color(0xFF0876D4)
                 , fontSize: 20,
                 fontWeight: FontWeight.w600)),),
        ],
      ),
    );
  }
}
