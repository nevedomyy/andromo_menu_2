import 'package:andromomenu2/ui/general/color.dart';
import 'package:andromomenu2/ui/general/keys.dart';
import 'package:andromomenu2/ui/pages/about_page.dart';
import 'package:andromomenu2/ui/pages/blabla_page.dart';
import 'package:andromomenu2/ui/pages/home_page.dart';
import 'package:andromomenu2/ui/widgets/andromo_menu.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Material(
      child: AndromoMenu(
        key: Keys.menuPageKey,
        backgroundColor: AppColor.background,
        itemColor: AppColor.item,
        menuCaptions: ['Home', 'Blabla', 'About'],
        menuItems: <Widget>[
          HomePage(),
          BlaBlaPage(),
          AboutPage(),
        ],
      ),
    );
  }
}
