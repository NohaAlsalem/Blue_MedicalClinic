import 'package:flutter/material.dart';

class doctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [
                Color(0xAAf3e5f5),
                Color(0xAA93f0fc),
                Color(0xAAd1c4e9),
                Color(0xAAf3e5f5),
              ],
            ),
          ),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Stack(
                  children: [
                    Container(
                      height: 215.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(
                              MediaQuery.of(context).size.width,115.0
                          ),
                        ),
                        color: Colors.indigo,
                        // image:const DecorationImage(
                        //   image:AssetImage('asset/nn/dd.jpg'),
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                    ),
                    Container(
                      height: 200.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(
                              MediaQuery.of(context).size.width,100.0
                          ),
                        ),
                        image:const DecorationImage(
                          image:AssetImage('assets/nnn.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: const [
                      CircleAvatar(
                        radius: 60.0,
                        backgroundColor: Colors.indigo,
                        child: CircleAvatar(
                          radius: 55.0,
                          backgroundImage: AssetImage('assets/nn.jpg'),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Dr.Ali Ahmad",
                        // 'Medical Clinic',
                        style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 40,
                          //fontFamily: 'The Life-Serif',
                        ),
                      ),
                      Text(
                        'Medical Clinic',
                        style: TextStyle(
                          // color: Color(0xAA001D6E),
                          color: Colors.indigo,
                          fontSize: 25,
                          //fontFamily: 'The Life-Serif',
                        ),
                      ),
                    ],
                  ),
                ),
                const  SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Material(
                    shadowColor: const Color(0xFF326fa5),
                    elevation: 20,
                    borderRadius: BorderRadius.circular(30.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.pushNamed(context,'times');
                      },
                      child: Container(
                        height: 60,
                        width: double.infinity ,
                        padding: const EdgeInsets.all(19.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.topLeft,
                            colors: [
                              // Color(0xAA9696C8),
                              // Color(0xAAEBE6EC),
                              // Color(0xAAf3e5f5),
                              Color(0xAAf3e5f5),
                              Color(0xAAEBE6EC),
                              Color(0xAA9696C8),
                            ],
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Times',
                            style: TextStyle(
                              // color: Colors.indigo,
                              color: Colors.indigo,
                              fontWeight: FontWeight.w500,
                              fontSize: 20.0,
                              //fontFamily: 'The Life-Serif',
                            ),),
                        ),
                      ),
                    ),
                  ),
                ),
                // const SizedBox(
                //   height: 20,
                // ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 20.0,end: 20.0),
                  child: Material(
                    shadowColor: const Color(0xFF326fa5),
                    elevation: 20,
                    borderRadius: BorderRadius.circular(30.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.pushNamed(context,'report');
                      },
                      child: Container(
                        height: 60,
                        width: double.infinity ,
                        padding: const EdgeInsets.all(19.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.topLeft,
                            colors: [
                              // Color(0xAA9696C8),
                              // Color(0xAAEBE6EC),
                              // Color(0xAAf3e5f5),
                              Color(0xAAf3e5f5),
                              Color(0xAAEBE6EC),
                              Color(0xAA9696C8),
                            ],
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Reports',
                            style: TextStyle(
                              // color: Colors.indigo,
                              color: Colors.indigo,
                              fontWeight: FontWeight.w500,
                              fontSize: 20.0,
                              fontFamily: 'The Life-Serif',
                            ),),
                        ),
                      ),
                    ),
                  ),
                )
              ]
          ),
        ),
      ),
    );
  }
}