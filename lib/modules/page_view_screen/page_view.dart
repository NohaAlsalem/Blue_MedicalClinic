import 'package:blue_medical_clinic/models/page_view_model/page_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class PageViewScreen extends StatefulWidget {
  const PageViewScreen({Key? key}) : super(key: key);

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {

  List<PageViewModel> myPageView =
  [
    PageViewModel(
        'Welcome in Blue Medical Clinic',
        'assets/pageView1.png',
        ),
    PageViewModel(
        'Find your Doctor &\nBook an Appointment',
        'assets/pageView2.png',
        ),
    PageViewModel(
      'Get your Best Services From US',
      'assets/pageView3.png',
      ),
  ];
  var pageViewController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    body : Container(
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xAA1a76b5),
              Color(0xAAf3e5f5),
              Color(0xAAf3e5f5),
              Color(0xAAf3e5f5),
              Color(0xAAf3e5f5),
              Color(0xAA1a76b5),
            ]),
      ),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemBuilder: (context , index ) => buildPageView(context , myPageView[index]),
            itemCount: myPageView.length,
              controller: pageViewController,
              physics: const BouncingScrollPhysics(),
            ),
          ),
          const SizedBox(height : 50),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SmoothPageIndicator(
                  controller: pageViewController,
                  count: myPageView.length,
                effect: const ExpandingDotsEffect(
                  dotHeight: 10,
                  expansionFactor: 3,
                  dotWidth: 10,
                  spacing: 5.0,
                ),
              ),
             const Spacer(),
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {
                  pageViewController.nextPage(
                  duration: const Duration(
                    seconds: 2,
                  ), curve: Curves.easeIn
                  );
                },),
            ],
          ),
        ],
      ),
    ),
    );
  }
}
Widget buildPageView(context , PageViewModel pageView) => Column(
  crossAxisAlignment: CrossAxisAlignment.start    ,
  children: [
     Expanded(
      child: Image(
        image : AssetImage('${pageView.imageUrl}'),
      ),
    ),
    const SizedBox(height : 40),
    Text(
      '${pageView.title}',
       style: TextStyle(
         fontSize: 30,
         fontWeight: FontWeight.w700,
         color:   Colors.indigo,
         shadows: [
           Shadow(
             blurRadius: 4.0,
             color: Colors.white,
             offset: Offset(3.0, 3.0),
           ),
         ],
       ),
        textAlign: TextAlign.center,
    ),
  ],
);
