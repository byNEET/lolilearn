import 'package:flutter/material.dart';

class ResultNilaiPage extends StatelessWidget {
  final int nilai;
  ResultNilaiPage({this.nilai});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('result'),),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text('nilai anda: $nilai'),
            RaisedButton(child: Text('OK'),
            onPressed: ()=>Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }
}