import 'package:adminkursus/src/provider/newloginprov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfilPage extends StatelessWidget {
  final _formkei = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final loginProv = Provider.of<NewLoginProv>(context);
    Widget _buildTextformfield({TextEditingController controller,String label}){
      return TextFormField(controller: controller,
      decoration: InputDecoration(labelText: label,),
      );
    }
    // Widget _buildDropdownbuton(){
    //   return DropdownButton();
    // }
    return Form(
      key: _formkei,
          child: Scaffold(
        appBar: AppBar(title: Text('edit profil'),),
        body: SingleChildScrollView(child: Padding(padding: EdgeInsets.all(8),child: Card(
                child: Column(children: <Widget>[
            _buildTextformfield(controller: loginProv.tnama,label: 'Nama lengkap',),
            _buildTextformfield(controller: loginProv.tpass,label: 'password')
          ],),
        ),),),
      ),
    );
  }
}