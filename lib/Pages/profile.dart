import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key, this.profileImage, this.user}) : super(key: key);
  final profileImage;
  final user;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  putImage(){
    if(widget.profileImage.runtimeType == String){
      return NetworkImage(widget.profileImage);
    }
    else{
      return FileImage(widget.profileImage);
    }
  }

  @override
  void initState(){
    super.initState();
    putImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
          color: Theme.of(context).iconTheme.color,
        ),
        title: Text(widget.user),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.blue,
              foregroundImage: putImage(),
            ),
            title: Text(widget.user,
              // style: Theme.of(context).textTheme.bodyText2,
            ),
          )
        ],
      ),
    );
  }
}
