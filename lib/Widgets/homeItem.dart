import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:instagram/Store/store.dart';
import 'package:provider/provider.dart';
import '../Pages/profile.dart';

class HomeItem extends StatefulWidget {
  const HomeItem({Key? key}) : super(key: key);

  @override
  State<HomeItem> createState() => _HomeItemState();
}

class _HomeItemState extends State<HomeItem> {
  var scrollController = ScrollController();
  int countAPI = 0;
  getMoreData() async{
    var rawData = await http.get(Uri.parse('https://codingapple1.github.io/app/more2.json'));
    var moreData = await jsonDecode(rawData.body);
    print('moreData : $moreData');
    await addData(moreData);
  }
  addData(data){
    setState(() {
      context.read<HomeData>().homeData.add(data);
    });
  }

  @override
  void initState(){
    super.initState();
    // context.read<HomeData>().getData();
    scrollController.addListener(() {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent && countAPI < 1){
        getMoreData();
        countAPI++;

      }
    });
  }
  @override
  void dispose(){
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    if (
    // widget.homeData.isNotEmpty
    context.watch<HomeData>().homeData.isNotEmpty
    ) {
      return ListView.builder(itemCount: context.watch<HomeData>().homeData.length, controller: scrollController, itemBuilder: (context, index){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            context.watch<HomeData>().homeData[index]['image'].runtimeType == String? Image.network(context.watch<HomeData>().homeData[index]['image']) :
            Image.file(context.watch<HomeData>().homeData[index]['image']),
            Text('Likes ${context.watch<HomeData>().homeData[index]['likes']}'),
            GestureDetector(
              child: Text(context.watch<HomeData>().homeData[index]['user']),
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>
                        Profile(profileImage : context.watch<HomeData>().homeData[index]['image'], user: context.watch<HomeData>().homeData[index]['user'])
                    ));
              },
            ),
            Text(context.watch<HomeData>().homeData[index]['content'])
          ],
        );
      });
    }
    else{
      print('안불러와짐');
      // context.read<HomeData>().getData();
    }
    return Text('잘 안되네요');
  }
}
