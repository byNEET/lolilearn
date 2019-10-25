import 'package:adminkursus/src/model/banksoall_quicktype.dart';
import 'package:adminkursus/src/service/realdb_api.dart';
import 'package:adminkursus/src/ui/admin/buatPaketsoal.dart';
import 'package:adminkursus/src/ui/admin/detilsoal.dart';
import 'package:flutter/material.dart';

class DaftarSoalAdminPage extends StatefulWidget {
  @override
  _DaftarSoalAdminPageState createState() => _DaftarSoalAdminPageState();
}

class _DaftarSoalAdminPageState extends State<DaftarSoalAdminPage> {
  final RealdbApi api = RealdbApi();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BanksoalModel>>(
        future: api.getListSoal(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (!snapshot.hasData) {
              return Container(
              color: Colors.pink,
              child: Center(
                child: Text('hasdata == false (something werong)'),
              ),
            );
            } else {
              var data = snapshot.data;
              return Scaffold(
                appBar: AppBar(
                  title: Text('daftar soal'),
                ),
                floatingActionButton: FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => BuatPaketSoalPage())).then((onValue)=>setState((){})),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: data
                        .map((f) => Container(
                              child: ListTile(
                                title: Text(f.titel),
                                subtitle: Text(f.kelas +" : " +f.mapel +" : " +f.jenis),
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => DetilSoalAdminPage(
                                              soalCoeg: f,
                                            ))).then((onValue)=>setState((){})),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              );
            }
          } else {
            return Container(
              color: Colors.pink,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
