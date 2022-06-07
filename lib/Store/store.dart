import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class HomeData extends ChangeNotifier {
  var homeData = [];
  var boardItem = {};

  late String _image;
  String get image => _image;
  late String _content;
  String get content => _content;
  var _now;
  DateTime get now => _now;

  // 처음 홈에서 렌더링 될 때 나오는 아이템 데이터를 불러옴
  getData() async{
    var rawData = await http.get(Uri.parse('https://codingapple1.github.io/app/data.json'));
    if (rawData.statusCode == 200) {
      var jsonData =  await jsonDecode(rawData.body);
      homeData = jsonData;
      print(homeData);

   }
    else{
      print('statusCode : ${rawData.statusCode}');
    }

    notifyListeners();
  }

  // Upload 페이지에서 사진과 글을 생성할 때 사용됨
  putData(image, content, now){
      boardItem['id'] = 3;
      boardItem['likes'] = 0;
      boardItem['user'] = 'GilDong Hong';
      boardItem['liked'] = false;
      boardItem['date'] =  DateFormat('MMM dd').format(now);
      boardItem['image'] = image;
      boardItem['content'] = content;
      print('업로드 $boardItem');
      homeData.insert(0, boardItem);

      notifyListeners();
  }


  // 무한스크롤처럼 자동으로 api를 호출해서 자동으로 데이터를 가져온다.
  getMoreData() async{
    var rawData = await http.get(Uri.parse('https://codingapple1.github.io/app/more2.json'));
    var moreData = await jsonDecode(rawData.body);
    print('moreData : $moreData');
    return moreData;
    // await addData(moreData);
  }
  // addData(data){
  //     homeData.add(data);
  // }
}