// import 'package:adminkursus/src/provider/newloginprov.dart';
// import 'package:adminkursus/src/ui/home/newhomepage.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'newloginpage.dart';

// class HomeLogin extends StatefulWidget {
//   @override
//   _HomeLoginState createState() => _HomeLoginState();
// }

// class _HomeLoginState extends State<HomeLogin> {
//  @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Future.delayed(Duration.zero,()async{
//       var coeg = await Provider.of<NewLoginProv>(context).cekSharedPref();
//       if (coeg !=null){
//         Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>NewHomePage()));
//       }else{
//         Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>NewLoginPage()));
//       }
//     });
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text('loading ...'),
//       ),
//     );
//   }
// }