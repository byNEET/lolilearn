// import 'package:adminkursus/src/provider/newloginprov.dart';
// import 'package:adminkursus/src/ui/home/newhomepage.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class NewLoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final newUserprov = Provider.of<NewLoginProv>(context);
//     return Scaffold(
//       appBar: AppBar(title: Text("login boy"),),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             TextFormField(
//               controller: newUserprov.tid,
//             ),
//             TextFormField(
//               controller: newUserprov.tpass,
//             ),
//             RaisedButton(child: Text('Login'),
//             onPressed: ()async{
//               var okesip = newUserprov.loginator(newUserprov.tid.text, newUserprov.tpass.text);
//               if(okesip!=null){
//                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>NewHomePage()));
//               }else{
//                 showDialog(context: context,builder: (_)=>AlertDialog(content: Text('username / password salah!'),));
//               }
//             },)
//           ],
//         ),
//       ),
//     );
//   }
// }