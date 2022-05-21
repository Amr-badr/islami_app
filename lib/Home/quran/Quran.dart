import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/Home/quran/SuraName.dart';
import 'package:islami_app/MyThemData.dart';

class Quran extends StatelessWidget {
List<String>suraNames=["الفاتحه","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
"الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس"];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
              flex: 3,
              child: Image.asset('assets/images/quran_logo.png')),
        Divider(color: MyThemeData.primaryColor,thickness: 4,),
          Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              child: Text('Sura Name',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),)),
          Divider(color: MyThemeData.primaryColor,thickness: 4,),
          Expanded(flex: 7,child: Container(
            child: ListView.separated(
              separatorBuilder: (context,index){
                return Divider(thickness: 2,);
              },
                itemCount: suraNames.length,
                itemBuilder: (context,index){
              return SuraName(suraNames[index],index);
            }),
          ),)
        ],
      ),
    );
  }
}