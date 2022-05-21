import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/HadethDetails/HadethDetails.dart';
import 'package:islami_app/Home/ahadeth/ItemHadethName.dart';
import 'package:islami_app/MyThemData.dart';

class Ahadeth extends StatefulWidget {
  @override
  State<Ahadeth> createState() => _AhadethState();
}

class _AhadethState extends State<Ahadeth> {
  List<Hadeth> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    if (ahadethList.isEmpty) {
      readHadethFile();
    }
    return Container(
      child: Column(children: [
        Image.asset('assets/images/hadeth_logo.png'),
        Divider(
          color: MyThemeData.primaryColor,
          thickness: 2,
        ),
        Container(
            margin: EdgeInsets.all(8),
            child: Text(
              'Ahadeth',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            )),
        Container(
          width: double.infinity,
          height: 2,
          color: MyThemeData.primaryColor,
        ),
        Expanded(
          child: ListView.separated(
            itemCount: ahadethList.length,
            itemBuilder: (context, index) {
              //  print(ahadethList[index].title);
              return ItemHadethName(ahadethList[index]);
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: MyThemeData.primaryColor,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              );
            },
          ),
        )
      ]),
    );
  }

  void readHadethFile() async {
    String fileContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    print(fileContent);
    List<String> ahadeth = fileContent.split('#');
    for (int i = 0; i < ahadeth.length; i++) {
      String singleHadeth = ahadeth[i].trim();
      if (singleHadeth.isEmpty) continue;
      List<String> hadethLines = singleHadeth.split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      String content = hadethLines.join();
      Hadeth hadeth = Hadeth(title, content);
      ahadethList.add(hadeth);
    }
    print('${ahadethList[ahadethList.length - 1].title} -----');
    setState(() {});
  }
}

class Hadeth {
  String title;
  String content;

  Hadeth(this.title, this.content);
}
