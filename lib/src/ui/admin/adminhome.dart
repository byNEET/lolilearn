import 'package:adminkursus/src/ui/admin/carisoalvadmin.dart';
import 'package:adminkursus/src/ui/admin/daftarsoal.dart';
import 'package:adminkursus/src/ui/admin/usermanagementpage.dart';
import 'package:flutter/material.dart';

class AdminHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    Widget _buildListile({String titel,Widget routeto}){
      return ListTile(title: Text(titel),onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>routeto)),);
    }
    return Scaffold(
      appBar: AppBar(title: Text('menu admin'),),
      body: SingleChildScrollView(child: Column(children: <Widget>[
        Text('User Management'),
        Divider(),
        _buildListile(titel: 'List User',routeto: UserManagementPage()),
        _buildListile(titel: 'Tambah User',routeto: TambahUserPage()),
        Divider(),
        Text('Soal Management'),
        Divider(),
        _buildListile(titel: 'List Bank soal',routeto: DaftarSoalAdminPage()),
        _buildListile(titel: 'Edit Cari Soal',routeto: CariSoalVAdmin()),
      ],),),
    );
  }
}