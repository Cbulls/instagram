import 'package:flutter/material.dart';
import '../widgets/homeItem.dart';

class BodyPage extends StatelessWidget {
  BodyPage({Key? key,
    this.changePage,
    this.currentIndex,
    this.pageController,
    // this.homeData,
    // this.addData
  }) : super(key: key);

  final pageController;
  final changePage;
  final currentIndex;
  // final homeData;
  // final addData;


  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        HomeItem(
          // homeData: homeData, addData: addData,
        ),
        Center(
          child: Text('2'),
        ),
        Center(
          child: Text('3'),
        ),
        Center(
          child: Text('4'),
        ),
      ],
      onPageChanged: (int index){
        changePage(index);
      },
    );
  }
}
