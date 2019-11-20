import 'package:adminkursus/src/model/banksoall_quicktype.dart';
import 'package:adminkursus/src/provider/jawabanprov.dart';
import 'package:adminkursus/src/provider/newloginprov.dart';
import 'package:adminkursus/src/provider/soalRepositoryProv.dart';
import 'package:adminkursus/src/service/realdb_api.dart';
import 'package:adminkursus/src/ui/resultnilai_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewSoalnyaPage extends StatelessWidget {
  final String idSoalnya;
  NewSoalnyaPage({this.idSoalnya});

  final RealdbApi db = RealdbApi();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showDialog<bool>(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text('Yakin keluar?'),
                  content: Text(
                      'Jawaban kamu akan dihapus dan tidak akan disimpan...'),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Tidak'),
                      onPressed: () {
                        return Navigator.pop(_, false);
                      },
                    ),
                    FlatButton(
                      child: Text('Iya, saya yakin'),
                      onPressed: () {
                        Provider.of<JawabanProv>(context).listJawaban.clear();
                        return Navigator.pop(_, true);
                      },
                    ),
                  ],
                )).then((onValue) => onValue ?? false);
      },
      child: FutureBuilder<BanksoalModel>(
        future: Provider.of<SoalRepositoryProv>(context)
            .getsetBankSoalnye(idSoalnya),
        builder: (context, snapsut) {
          print(snapsut.data);
          if ((snapsut.connectionState == ConnectionState.done)) {
            return (snapsut.hasData)
                ? DefaultTabController(
                    // key: GlobalKey(),
                    key: UniqueKey(),
                    initialIndex: 0,
                    length: snapsut.data.soalnye.length - 1,
                    child: Scaffold(
                      key: UniqueKey(),
                      appBar: AppBar(
                        title: Text(snapsut.data.mapel + snapsut.data.kelas),
                        actions: <Widget>[
                          TombolSudahdiUjungKananAppbar(
                            idsoal: snapsut.data.id,
                            jumlahsoal: snapsut.data.soalnye.length - 1,
                          )
                        ],
                        bottom: TabBar(
                          isScrollable: true,
                          tabs: List<int>.generate(
                                  snapsut.data.soalnye.length - 1,
                                  //(i)=>i+1).map((f)=>
                                  (i) => i + 1)
                              .map((f) => TabItemWiget(
                                    f: f,
                                  ))
                              .toList(),
                        ),
                      ),
                      body: TabBarView(
                          key: UniqueKey(),
                          children: List<Widget>.generate(
                              snapsut.data.soalnye.length - 1, (int index) {
                            //  if (snapsut.data.soalnye[index+1]!=null){
                            return TabSoalBody(
                              soalnye: snapsut.data.soalnye,
                              index: index + 1,
                            );
                            // }else{
                            //    return Container(child: Text('data null: be intro, '),);
                            //  }
                          })),
                    ),
                  )
                : Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.blue,
                    child: Center(
                      child: Text('something wrong :('),
                    ),
                  );
          } else {
            return Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}

class TombolSudahdiUjungKananAppbar extends StatelessWidget {
  final int jumlahsoal;
  final String idsoal;
  TombolSudahdiUjungKananAppbar({this.jumlahsoal, this.idsoal});
  final RealdbApi api = RealdbApi();

  // void _submitJawaban(idsoal,n,uid,nilai,context)async{
  //   api.simpanJawaban(idsoal,n, uid, nilai).then((_){
  //     Provider.of<JawabanProv>(context).clear();
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (__)=>ResultNilaiPage(nilai:nilai)));
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    final jawabanProv = Provider.of<JawabanProv>(context);
    final user = Provider.of<NewLoginProv>(context);
    var data = jawabanProv.listJawaban;
    var nilai = jawabanProv.nilai;
    return Container(
      child: RaisedButton.icon(
        color: Colors.redAccent,
        icon: Icon(Icons.done),
        label: Text('Selesai'),
        onPressed: (data.length == jumlahsoal)
            ? () async {
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          title: Text('Yakin mengumpulkan jawaban?'),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Batal'),
                              onPressed: () => Navigator.pop(_),
                            ),
                            FlatButton(
                              child: Text('Iya, Saya yakin'),
                              onPressed: () async {
                                Navigator.pop(_);
                                api
                                    .simpanJawaban(
                                        idsoal, data, user.userNew.id, nilai)
                                    .then((_) {
                                  //jawabanProv.clear();
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (__) =>
                                              ResultNilaiPage(nilai: nilai)));
                                });
                              },
                            ),
                          ],
                        ));
              }
            : null,
      ),
    );
  }
}

class TabItemWiget extends StatelessWidget {
  final int f;
  TabItemWiget({this.f});
  @override
  Widget build(BuildContext context) {
    final jawabanProv = Provider.of<JawabanProv>(context);
    return Tab(
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.black54,
        child: Text(
          f.toString(),
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: (jawabanProv.listJawaban[f.toString()] == null)
                  ? Colors.black
                  : Colors.green),
        ),
      ),
    );
  }
}

class TabSoalBody extends StatelessWidget {
  final List<Soalnye> soalnye;
  final int index;
  TabSoalBody({Key key, this.soalnye, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final jawabanProv = Provider.of<JawabanProv>(context);
    return Container(
      key: UniqueKey(),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                // "$index.
                "${soalnye[index].pertanyaan}",
                style: TextStyle(color: Colors.black, fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          Container(
            child: Column(
              children: ["A", "B", "C", "D"]
                  .map((f) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17),
                              color: Colors.black12),
                          child: ListTile(
                              leading: CircleAvatar(
                                radius: 20,
                                backgroundColor: jawabanProv
                                            .listJawaban[(index).toString()] ==
                                        f
                                    ? Colors.lightGreenAccent
                                    : Colors.black26,
                                child: Container(
                                  child: Text(
                                    '$f',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  // color: Colors.
                                ),
                              ),
                              title: Text(soalnye[index].jawaban[f]),
                              onTap: () => jawabanProv.addListJawabanAndPoint(
                                  (index).toString(),
                                  f,
                                  soalnye[index].jawabanbenar)),
                        ),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
