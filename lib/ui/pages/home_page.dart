import 'package:andromomenu2/ui/general/color.dart';
import 'package:andromomenu2/ui/general/keys.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.menu, color: AppColor.background),
                onPressed: () => Keys.menuPageKey.currentState.startAnimation()
            ),
            title: Text(
              'Home',
              style: TextStyle(fontSize: 44.0, color: AppColor.background, fontFamily: 'JosefinSans-Thin'),
            ),
            centerTitle: true,
          ),
          body: Container(),
        )
    );
  }
}
