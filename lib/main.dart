import 'package:flutter/material.dart';
import 'package:islami_app/HadethDetails/HadethDetails.dart';
import 'package:islami_app/Home/Home.dart';
import 'package:islami_app/MyThemData.dart';
import 'package:islami_app/Provider/AppConfigProvider.dart';
import 'package:islami_app/SuraDetails/SuraDetails.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( ChangeNotifierProvider(
      create: (context)=>AppConfigProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  String language = 'en';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      title: 'Flutter Demo',
      theme: MyThemeData.LIGHT_THEME,
      darkTheme: MyThemeData.DARK_THEME,
      themeMode: provider.mode,
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      locale: Locale(provider.language),
      routes: {
        Home.ROUTE_NAME:(context)=>Home(),
        SuraDetails.ROUTE_NAME:(context)=>SuraDetails(),
        HadehtDetails.ROUTE_NAME:(context)=>HadehtDetails()
      },
      initialRoute: Home.ROUTE_NAME,
    );
  }
}
