import 'package:adminkursus/src/model/materi_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

class DetilMateri extends StatelessWidget {
  final MateriModel materi;
  DetilMateri({this.materi});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(materi.titel),),
      body: SingleChildScrollView(child: TeXView(teXHTML: materi.isimateri,),),
      
    );
  }
}