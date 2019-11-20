import 'package:adminkursus/src/helper/itemlistguru.dart';
import 'package:adminkursus/src/widgets/materialPoster_widget.dart';
import 'package:flutter/material.dart';
import '../../../src/ui/infoguru/detailguru.dart';

class InfoGuruIndex extends StatelessWidget {
  // InfoGuru infoGuru;
  // InfoGuruUI({this.infoGuru});
  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Guru'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: listInfoGuru.length,
          controller: _scrollController,
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.3 / 0.4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (BuildContext context, int index) {
            final infoguru = listInfoGuru[index];

            return MaterialPoster(
              id: infoguru.id,
              nama: infoguru.nama,
              email: infoguru.email,
              posisi: infoguru.posisi,
              heroTag: infoguru.id,
              urlgambar: infoguru.urlgambar,
              onTap: () {
                // print('wow');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailGuruUI(
                              infoGuru: infoguru,
                            )));
              },
            );
          },
        ),
      ),
    );
  }
}
