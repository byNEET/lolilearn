import 'package:flutter/material.dart';

class MaterialPoster extends StatelessWidget {
  final String id;
  final String nama;
  final String email;
  final String posisi;
  final String heroTag;
  final String urlgambar;
  final Function onTap;
  MaterialPoster({
    this.id,
    this.nama,
    this.email,
    this.posisi,
    this.heroTag,
    this.urlgambar,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // height: 1000,
        // color: Colors.brown,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // color: Colors.black12,
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Hero(
              tag: id,
              child: CircleAvatar(
                radius: 60.0,
                backgroundImage: AssetImage(urlgambar),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              nama,
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              posisi,
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
