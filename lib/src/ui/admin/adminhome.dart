import 'package:adminkursus/src/ui/admin/carisoalvadmin.dart';
import 'package:adminkursus/src/ui/admin/daftarsoal.dart';
import 'package:adminkursus/src/ui/admin/listmateriadmin_page.dart';
import 'package:adminkursus/src/ui/admin/usermanagementpage.dart';
import 'package:flutter/material.dart';
 
class AdminHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Admin Q Smart",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(left: 12.0, top: 20.0, bottom: 15.0),
                child: Text(
                  "User Management",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UserManagementPage()));
                    },
                    child: Container(
                      width: 150,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          stops: [
                            0.4,
                            0.7,
                          ],
                          colors: <Color>[
                            Colors.orangeAccent,
                            Colors.orange,
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                Icons.account_box,
                                color: Colors.white,
                                size: 30.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'List Murid',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TambahUserPage()));
                    },
                    child: Container(
                      width: 150,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          stops: [
                            0.4,
                            0.7,
                          ],
                          colors: <Color>[
                            Colors.blue[700],
                            Colors.blue,
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                Icons.add_circle_outline,
                                color: Colors.white,
                                size: 30.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Tambah Murid',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 12.0, top: 20.0, bottom: 15.0),
                child: Text(
                  "Soal Management",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DaftarSoalAdminPage()));
                    },
                    child: Container(
                      width: 150,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          stops: [
                            0.4,
                            0.7,
                          ],
                          colors: <Color>[
                            Colors.pinkAccent,
                            Colors.pink,
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                Icons.format_list_numbered,
                                color: Colors.white,
                                size: 30.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Bank Soal',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CariSoalVAdmin()));
                    },
                    child: Container(
                      width: 150,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          stops: [
                            0.4,
                            0.7,
                          ],
                          colors: <Color>[
                            Colors.teal[400],
                            Colors.teal,
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 30.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Cari Soal',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              //---------------------------------------------------------materi------------------------

              Padding(
                padding:
                    const EdgeInsets.only(left: 12.0, top: 20.0, bottom: 15.0),
                child: Text(
                  "Materi Management",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ListMateriAdminPage()));
                    },
                    child: Container(
                      width: 150,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          stops: [
                            0.4,
                            0.7,
                          ],
                          colors: <Color>[
                            Colors.orangeAccent,
                            Colors.orange,
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                Icons.book,
                                color: Colors.white,
                                size: 30.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'List Materi',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.of(context).push(MaterialPageRoute(
                  //         builder: (context) => TambahUserPage()));
                  //   },
                  //   child: Container(
                  //     width: 150,
                  //     height: 100,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10),
                  //       gradient: LinearGradient(
                  //         begin: Alignment.centerRight,
                  //         end: Alignment.centerLeft,
                  //         stops: [
                  //           0.4,
                  //           0.7,
                  //         ],
                  //         colors: <Color>[
                  //           Colors.blue[700],
                  //           Colors.blue,
                  //         ],
                  //       ),
                  //     ),
                  //     child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //       children: <Widget>[
                  //         Padding(
                  //           padding: const EdgeInsets.only(left: 10),
                  //           child: Align(
                  //             alignment: Alignment.centerLeft,
                  //             child: Icon(
                  //               Icons.add_circle_outline,
                  //               color: Colors.white,
                  //               size: 30.0,
                  //             ),
                  //           ),
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.only(left: 10.0),
                  //           child: Align(
                  //             alignment: Alignment.centerLeft,
                  //             child: Text(
                  //               'Tambah Murid',
                  //               style: TextStyle(
                  //                 color: Colors.white,
                  //                 fontSize: 17.0,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 
// class AdminHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Widget _buildListile({String titel, Widget routeto}) {
//       return ListTile(
//         title: Text(titel),
//         onTap: () =>
//             Navigator.push(context, MaterialPageRoute(builder: (_) => routeto)),
//       );
//     }
 
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('menu admin'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 'User Management',
//                 style: TextStyle(
//                   fontFamily: "Poppins-Bold",
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//             Divider(),
//             Container(
//               decoration: BoxDecoration(
//                   // color: Colors.black12,
//                   ),
//               child: _buildListile(
//                 titel: 'List User',
//                 routeto: UserManagementPage(),
//               ),
//             ),
//             Divider(),
//             Container(
//               decoration: BoxDecoration(
//                   // color: Colors.black12,
//                   ),
//               child: _buildListile(
//                 titel: 'Tambah User',
//                 routeto: TambahUserPage(),
//               ),
//             ),
//             Divider(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 // Icon(Icons.list),
//                 Text(
//                   'Soal Management',
//                   style: TextStyle(
//                     fontFamily: "Poppins-Bold",
//                     fontSize: 20,
//                   ),
//                 ),
//               ],
//             ),
//             Divider(),
//             _buildListile(
//                 titel: 'List Bank soal', routeto: DaftarSoalAdminPage()),
//             Divider(),
//             _buildListile(titel: 'Edit Cari Soal', routeto: CariSoalVAdmin()),
//           ],
//         ),
//       ),
//     );
//   }
// }


















//----------------------------------------------------------------------------------------------------------
// import 'package:adminkursus/src/ui/admin/carisoalvadmin.dart';
// import 'package:adminkursus/src/ui/admin/daftarsoal.dart';
// import 'package:adminkursus/src/ui/admin/usermanagementpage.dart';
// import 'package:flutter/material.dart';

// class AdminHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
    
//     Widget _buildListile({String titel,Widget routeto}){
//       return ListTile(title: Text(titel),onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>routeto)),);
//     }
//     return Scaffold(
//       appBar: AppBar(title: Text('menu admin'),),
//       body: SingleChildScrollView(child: Column(children: <Widget>[
//         Text('User Management'),
//         Divider(),
//         _buildListile(titel: 'List User',routeto: UserManagementPage()),
//         _buildListile(titel: 'Tambah User',routeto: TambahUserPage()),
//         Divider(),
//         Text('Soal Management'),
//         Divider(),
//         _buildListile(titel: 'List Bank soal',routeto: DaftarSoalAdminPage()),
//         _buildListile(titel: 'Edit Cari Soal',routeto: CariSoalVAdmin()),
//       ],),),
//     );
//   }
// }