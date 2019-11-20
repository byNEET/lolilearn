import 'package:adminkursus/src/helper/itemlistguru.dart';
import 'package:flutter/material.dart';

class DetailGuruUI extends StatelessWidget {
  final InfoGuru infoGuru;
  DetailGuruUI({this.infoGuru});

  @override
  Widget build(BuildContext context) {
    final _scrollController = ScrollController();
    return Scaffold(
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        controller: _scrollController,
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            expandedHeight: 380.0,
            elevation: 0.1,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                infoGuru.nama,
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black54,
                ),
              ),
              background: Material(
                child: Hero(
                  tag: infoGuru.id,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(infoGuru.urlgambar),
                      ),
                      shape: BoxShape.rectangle,
                    ),
                    child: Container(
                      margin: EdgeInsets.only(top: 130.0),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        colors: <Color>[
                          new Color(0x00FFFFFF),
                          new Color(0xFFFFFFFF),
                        ],
                        stops: [
                          0.0,
                          1.0,
                        ],
                        begin: FractionalOffset(0.0, 0.0),
                        end: FractionalOffset(0.0, 1.0),
                      )),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 370.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top: 30.0, left: 20.0, right: 20.0),
                            child: Text(
                              infoGuru.detailguru.bio,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15.0,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
