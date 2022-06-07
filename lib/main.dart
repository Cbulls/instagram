import 'package:flutter/material.dart';
import 'package:instagram/Store/store.dart';
import 'package:instagram/widgets/bottomBar.dart';
// 그냥 style 변수는 다른 style 변수가 생겨 겹칠 수도 있어서 as theme을 만든다
import 'constants/theme.dart' as theme;
import 'Pages/bodyPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'widgets/appBar.dart';
import 'package:provider/provider.dart';

// 변수를 다른 파일에서 쓰기 싫을 때 : _변수 _함수명 _클래스명

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<HomeData>(create: (context)=>HomeData()),
        ],
        child: MaterialApp(
          // 요소 하나하나 마다 각각의 style code를 작성하면 코드가 길어지기 때문에 themedata를 쓴다.
          theme: theme.style,
          home: MyApp(),
          debugShowCheckedModeBanner: false,
        ),
      )
  );
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  // var homeData = [];
  final PageController _pageController = PageController(initialPage: 0);
  var scrollController = ScrollController();

  void _changePage(int index){
    setState(()=>{
      _currentIndex = index
    });
  }

  // uploadData(item){
  //   setState((){
  //     homeData.insert(0, item);
  //   });
  //   // scrollController.animateTo(0, duration: Duration(milliseconds: 1), curve: Curves.linear);
  // }

  // addData(list){
  //   setState(() {
  //     homeData.add(list);
  //   });
  // }

  // void getData() async{
  //   var rawData = await http.get(Uri.parse('https://codingapple1.github.io/app/data.json'));
  //   // context.read<HomeData>().decodeData(rawData);
  //   if (rawData.statusCode == 200) {
  //     setState(() {
  //       context.read<HomeData>().homeData = jsonDecode(rawData.body);
  //     });
  //     // print(homeData);
  //   }
  //   else{
  //     print('statusCode : ${rawData.statusCode}');
  //   }
  // }

  @override
  void initState(){
    super.initState();
    // getData();
   //  Future.delayed(Duration(seconds: 0), () {
    // Provider.of<HomeData>(context, listen: false).getData();
   // });
    context.read<HomeData>().getData();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   await context.read<HomeData>().getData();
    // });
    // print(context.read<HomeData>().getData());
  }
  @override
  void dispose(){
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: TopAppBar(
            // uploadData : uploadData
        ),
        body: BodyPage(
          changePage : _changePage,
          pageController : _pageController,
          currentIndex : _currentIndex,
         // homeData : homeData,
         // addData : addData,
        ),
        bottomNavigationBar: BottomBar(currentIndex: _currentIndex, pageController: _pageController),
        extendBodyBehindAppBar: true,
      ),
    );
  }
}
