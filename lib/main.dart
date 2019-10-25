import 'package:adminkursus/src/provider/buatPaketSoalProv.dart';
import 'package:adminkursus/src/provider/buatsoalprov.dart';
import 'package:adminkursus/src/provider/jawabanprov.dart';
import 'package:adminkursus/src/provider/searchprov.dart';
import 'package:adminkursus/src/provider/userrepository.dart';
//import 'package:adminkursus/src/ui/homsekrin.dart';
import 'package:adminkursus/src/ui/login/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (_)=> UserRepository.instance(),
        ),
        ChangeNotifierProvider(
          builder: (_)=> JawabanProv(),
        ),
        ChangeNotifierProvider(
         builder: (_) => SearchProv()),
         ChangeNotifierProvider(
         builder: (_) => BuatPaketSoalProv()),
          ChangeNotifierProvider(
         builder: (_) => BuatSoalProv()),
      ],
          child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}

