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
        'title1',
        'assets/pageView2.jpg',
        ),
    PageViewModel(
        'title2',
        'description2',
        'assets/pageView1.jpg',
        ),
    PageViewModel(
      'title3',
      'description3',
      'assets/pageView3.jpg',
      ),
  ];
  var pageViewController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar :AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
    body : Padding(
      padding: const EdgeInsets.all(8.0),
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
      style: Theme.of(context).textTheme.headline4,
      textAlign: TextAlign.left,
    ),
    const SizedBox(height : 20),
    Text(
      '${pageView.description}',
      style: Theme.of(context).textTheme.headline6,
      textAlign: TextAlign.left,
    ),
  ],
);
