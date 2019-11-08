// import 'package:adminkursus/src/helper/Screen.dart';
import 'package:adminkursus/src/provider/newloginprov.dart';
import 'package:adminkursus/src/ui/admin/adminhome.dart';
import 'package:adminkursus/src/ui/materi/listmateri_page.dart';
import 'package:adminkursus/src/ui/soal/carisoalpage.dart';
// import 'package:adminkursus/src/ui/tentang/tentang_view.dart';
// import 'package:adminkursus/src/widgets/carousel_movie_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
class NewHomePage extends StatefulWidget {
  @override
  _NewHomePageState createState() => _NewHomePageState();
}
 
class _NewHomePageState extends State<NewHomePage> {
  @override
  Widget build(BuildContext context) {
   // final newuserprov = Provider.of<NewLoginProv>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          // bottomOpacity: 0.2,
          title: Text(
            "Q Smart",
            style: TextStyle(
              fontFamily: "Poppins-Bold",
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          actions: <Widget>[
            RaisedButton(
              child: Text("admin"),
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => AdminHomePage())),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // CarouselItem(),
 
              Container(
                padding: EdgeInsets.only(bottom: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.black12,
                ),
                margin: EdgeInsets.all(12.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      child: Text(
                        'Menu Utama',
                        style: TextStyle(
                          fontFamily: "Poppins-Bold",
                          color: Colors.black,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => CariSoalPage()));
                            },
                            child: Container(
                              width: 145,
                              height: 100,
                              // margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.orange,
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  stops: [
                                    0.4,
                                    0.8,
                                  ],
                                  colors: [
                                    Colors.black26,
                                    Colors.black45,
                                  ],
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'images/carisoal.png',
                                    height: 40,
                                    width: 40,
                                  ),
                                  Text(
                                    'Cari soal',
                                    style: TextStyle(
                                      fontFamily: "Poppins-Medium",
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 145,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.redAccent,
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                stops: [
                                  0.4,
                                  0.9,
                                ],
                                colors: [
                                  Colors.blue.withOpacity(0.5),
                                  Colors.blueAccent,
                                ],
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'images/panduan.png',
                                  height: 40,
                                  width: 40,
                                ),
                                Text(
                                  'Info Guru',
                                  style: TextStyle(
                                    fontFamily: "Poppins-Medium",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>ListMateriPage())),
                                                      child: Container(
                              width: 145,
                              height: 100,
                              // margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blueGrey,
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  stops: [
                                    0.3,
                                    0.9,
                                  ],
                                  colors: [
                                    Colors.orange[200],
                                    Colors.orangeAccent,
                                  ],
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'images/tips.png',
                                    height: 40,
                                    width: 40,
                                  ),
                                  Text(
                                    'Materi',
                                    style: TextStyle(
                                      fontFamily: "Poppins-Medium",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 145,
                            height: 100,
                            // margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.tealAccent,
                              gradient: LinearGradient(
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                                stops: [
                                  0.3,
                                  0.8,
                                ],
                                colors: [
                                  Colors.redAccent,
                                  Colors.red[300],
                                ],
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'images/about.png',
                                  height: 40,
                                  width: 40,
                                ),
                                Text(
                                  'Tentang Q Smart',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: "Poppins-Medium",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
 
                        // Column(
                        //   children: <Widget>[
                        //     Image.asset(
                        //       'images/tips.png',
                        //       height: 40,
                        //       width: 40,
                        //     ),
                        //     Text('tips')
                        //   ],
                        // ),
                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => Tentang()));
                        //   },
                        //   child: Column(
                        //     children: <Widget>[
                        //       Image.asset(
                        //         'images/about.png',
                        //         height: 40,
                        //         width: 40,
                        //       ),
                        //       Text('tentang')
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
              // Container(
              //   padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
              //   alignment: Alignment.topLeft,
              //   child: Text(
              //     'Artikel',
              //     style: TextStyle(
              //       fontSize: 20,
              //       fontFamily: 'Poppins-Bold',
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.all(10),
              //   width: Screen.width(context),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color: Colors.black12,
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Column(
              //       children: <Widget>[
              //         Image.network(
              //           'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg',
              //           width: Screen.width(context),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Text(
              //             'Waw hebat, ini artikel nya gan!',
              //             style: TextStyle(color: Colors.black, fontSize: 15),
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              RaisedButton(
                child: Text('LogOut'),
                onPressed: () =>
                    Provider.of<NewLoginProv>(context).usernewLogout(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




// import 'package:adminkursus/src/provider/newloginprov.dart';
// import 'package:adminkursus/src/ui/admin/adminhome.dart';
// import 'package:adminkursus/src/ui/soal/carisoalpage.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class NewHomePage extends StatefulWidget {
//   @override
//   _NewHomePageState createState() => _NewHomePageState();
// }

// class _NewHomePageState extends State<NewHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     final newuserprov = Provider.of<NewLoginProv>(context);
//     return SafeArea(
//           child: Scaffold(
//             appBar: AppBar(actions: <Widget>[RaisedButton(child: Text("admen"),onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>AdminHomePage())),)],),
//         body: SingleChildScrollView(
//           child: Column(children: <Widget>[
//             SizedBox(height: 100,),
//             Text(newuserprov.userNew.nama),
//             Text(newuserprov.userNew.id),
            
//             Container(child: Card(child: Text('carousel'),),height: 100,width: double.infinity,),
//             Container(child: Card(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: <Widget>[
//                 InkWell(
//                   onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (_)=>CariSoalPage())),
//                     child: Column(children: <Widget>[
//                     Icon(Icons.add_circle),
//                     Text('Cari soal')
//                   ],),
//                 ),
//                 Column(children: <Widget>[
//                   Icon(Icons.add_circle),
//                   Text('panduan')
//                 ],),
//                 Column(children: <Widget>[
//                   Icon(Icons.add_circle),
//                   Text('tips')
//                 ],),
//                 Column(children: <Widget>[
//                   Icon(Icons.add_circle),
//                   Text('tentang')
//                 ],),
//               ],
//             ),),),
//             RaisedButton(child: Text('LogOut'),onPressed: ()=>Provider.of<NewLoginProv>(context).usernewLogout(),)
//           ],),
//         ),
//       ),
//     );
//   }
// }