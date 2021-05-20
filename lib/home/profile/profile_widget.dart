import 'package:flutter/material.dart';
import 'package:shashliki/home/profile/api_profile.dart';
import 'package:shashliki/non_component/singleton_ds.dart';

class ProfileWidget extends StatefulWidget {
  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  // String name = " ";

  // _setName() async {
  //   String t = await getUserName();

  //   setState(() {
  //     name = t;
  //   });
  // }
  SingletonDS ds=SingletonDS();

  @override
  void initState() {
    // _setName();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('Error');
          return Text('Error');
        } else if (snapshot.hasData) {
          return Column(
            children: [
              Container(
                height: MediaQuery.of(context).padding.top,
                color: Colors.transparent,
              ),
              Container(
                width: 300.0,
                height: 300.0,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: "${snapshot.data.toString()[0]}",
                      style: TextStyle(color: Colors.black, fontSize: 100),
                    ),
                  ),
                ),
              ),
              Container(
                height: 30,
              ),
              RichText(
                text: TextSpan(
                  text: "${snapshot.data}",
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
              ),
              Container(
                height: 30,
              ),
              RichText(
                text: TextSpan(
                  text: "id:${ds.userId}",
                  style: TextStyle(color: Colors.grey, fontSize: 30),
                ),
              ),
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      future: getUserName(),
    );
  }
}
