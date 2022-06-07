import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../Store/store.dart';

class Upload extends StatefulWidget {
  Upload({Key? key, this.image, this.uploadData}) : super(key: key);
  late final image;
  final uploadData;

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  var textController = TextEditingController();

  var now = DateTime.now();

  // var boardItem = {};

  showImage(){
    if(widget.image != null){
      // print('이미지 : ${Image.file(widget.image).image}');
      return Image.file(widget.image);
    }
  }

  // putData(){
  //   setState(() {
  //     boardItem['id'] = 3;
  //     boardItem['likes'] = 0;
  //     boardItem['user'] = 'GilDong Hong';
  //     boardItem['liked'] = false;
  //     boardItem['date'] =  DateFormat('MMM dd').format(now);
  //     boardItem['image'] = widget.image;
  //     boardItem['content'] = textController.text;
  //     widget.uploadData(boardItem);
  //   });
  // }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('이미지 업로드 페이지'),
              Text('날짜 : ${DateFormat('MMM dd').format(now)}'),
              Text(''),
              showImage(),
              TextField(
                controller: textController,
                decoration: InputDecoration(
                    hintText: '설명'
                ),
              ),
              IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close)
              ),
              IconButton(
                  onPressed: (){
                    // putData();
                    // widget.image = context.read<HomeData>().image;
                    // textController = TextEditingController(text: context.read<HomeData>().content);
                    Provider.of<HomeData>(context, listen: false).putData(widget.image, textController.text, now);
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.add)
              ),
            ],
          ),
        )
    );

  }
}