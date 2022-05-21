import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:islami_app/Home/ahadeth/Ahadeth.dart';
import 'package:islami_app/Home/quran/Quran.dart';
import 'package:islami_app/Home/radio/Radio.dart';
import 'package:islami_app/Home/sebha/Sebha.dart';
import 'package:islami_app/Home/settings/settings.dart';
import 'package:islami_app/Provider/AppConfigProvider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  static String ROUTE_NAME = 'home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex=1;

  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider=Provider.of(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(provider.mode==ThemeMode.light?
              'assets/images/default_bg.png':
              'assets/images/dark_bg.png'))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Islami',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(canvasColor: Color(0xffB7935f)),
          child: BottomNavigationBar(
            onTap: (index){

              setState(() {
                currentIndex=index;
              });
            },
            selectedItemColor:Color(0xff242424) ,
            currentIndex:currentIndex,

            items: [
              BottomNavigationBarItem(
                  label: 'quran',
                  icon: ImageIcon(AssetImage('assets/images/icon_quran.png'))),
              BottomNavigationBarItem(
                  label: 'ahadeth',
                  icon: ImageIcon(AssetImage('assets/images/icon_hadeth.png'))),
              BottomNavigationBarItem(
                  label: 'tasbeh',
                  icon: ImageIcon(AssetImage('assets/images/icon_sebha.png'))),
              BottomNavigationBarItem(
                  label: 'radio',
                  icon: ImageIcon(AssetImage('assets/images/icon_radio.png'))),
              BottomNavigationBarItem(
                  label: 'Settings',
                  icon: Icon(Icons.settings)
              )],
          ),
        ),
        body: getBody(),
      ),
    );
  }
  Widget getBody() {
    if (currentIndex == 0) {
      return Quran();
    } else if (currentIndex == 1) {
      return Ahadeth();
    } else if (currentIndex == 2) {
      return Sebha();
    } else if (currentIndex == 4) {
      return Settings();
    }else {
      return RadioFragment();
    }
  }
}
