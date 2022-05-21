import 'package:flutter/material.dart';
import 'package:islami_app/HadethDetails/HadethDetails.dart';
import 'package:islami_app/Home/ahadeth/Ahadeth.dart';

class ItemHadethName extends StatelessWidget {
Hadeth hadeth ;
ItemHadethName(this.hadeth);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, HadehtDetails.ROUTE_NAME,
              arguments: hadeth);
        },
        child: Text(
          hadeth.title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
