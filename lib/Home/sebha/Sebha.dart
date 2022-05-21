import 'package:flutter/material.dart';
import 'package:islami_app/MyThemData.dart';

class Sebha extends StatefulWidget {
  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  int counter = 0;
  List<String> seb7aList = [
    'سبحان الله',
    'الله اكبر',
    'الحمدلله',
    'لا اله الا الله'
  ];
  int index = 0;
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset('assets/images/head_of_seb7a.png'),
                InkWell(
                  onTap: () {
                    OnSeb7aClick();
                  },
                  child: Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .09),
                      child: Transform.rotate(
                        angle: angle,
                        child: Image.asset(
                          'assets/images/body_of_seb7a.png',
                          height: MediaQuery.of(context).size.height * .35,
                        ),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'عدد التسبيحات',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xffB7935f),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text('$counter',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: MyThemeData.primaryColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                '${seb7aList[index]}',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ],
        ));
  }

  void OnSeb7aClick() {
    counter++;

    if (counter % 33 == 0) {
      index++;
    }
    if (counter % 165 == 0) {
      index = 0;
    }
    setState(() {
      angle += 20;
    });
  }
}
