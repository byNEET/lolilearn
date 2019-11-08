import 'package:adminkursus/src/provider/newloginprov.dart';
import 'package:adminkursus/src/ui/home/newhomepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginCasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginProv = Provider.of<NewLoginProv>(context);
    switch (loginProv.loginStat) {
      case LoginStat.Loading:
        return NewSplash();
      case LoginStat.NotLogin:
        return Logincoeg();
      case LoginStat.DahLogin:
        return NewHomePage();
      default:
        return Container();
    }
  }
}
 
class NewSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<NewLoginProv>(context).cekSharedPref();
    return Scaffold(
      body: Container(
          child: Center(
        child: CircularProgressIndicator(),
      )),
    );
  }
}
 
class Logincoeg extends StatefulWidget {
  @override
  _LogincoegState createState() => _LogincoegState();
}
 
class _LogincoegState extends State<Logincoeg> {
  bool isLoading;
  final _formkey = GlobalKey<FormState>();
 
  @override
  void initState() {
    // TODsO: implement initState
    super.initState();
    isLoading = false;
  }
  
 
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
 
    final newUserprov = Provider.of<NewLoginProv>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Image.asset("images/image_01.png"),
                ),
                Expanded(
                  child: Container(),
                ),
                Image.asset("images/image_02.png")
              ],
            ),
            SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 40.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset(
                          "images/logo.png",
                          width: ScreenUtil.getInstance().setWidth(110),
                          height: ScreenUtil.getInstance().setHeight(110),
                        ),
                        Text("Q Smart",
                            style: TextStyle(
                                fontFamily: "Poppins-Bold",
                                fontSize: ScreenUtil.getInstance().setSp(46),
                                letterSpacing: .6,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(180),
                    ),
                    Container(
                      width: double.infinity,
                      height: ScreenUtil.getInstance().setHeight(600),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0.0, 15.0),
                                blurRadius: 15.0),
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0.0, -10.0),
                                blurRadius: 10.0),
                          ]),
                      child: Padding(
                        padding:
                            EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                        child: Form(
                          key: _formkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Selamat Datang!",
                                  style: TextStyle(
                                      fontSize:
                                          ScreenUtil.getInstance().setSp(45),
                                      fontFamily: "Poppins-Bold",
                                      letterSpacing: .6)),
                              SizedBox(
                                height: ScreenUtil.getInstance().setHeight(30),
                              ),
                              Text("No anggota",
                                  style: TextStyle(
                                      fontFamily: "Poppins-Medium",
                                      fontSize:
                                          ScreenUtil.getInstance().setSp(26))),
                              TextFormField(
                                decoration: InputDecoration(
                                    hintText: "No anggota",
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 12.0)),
                                controller: newUserprov.tid,
                                validator: (e) {
                                  return e.length < 1
                                    ? "id/ No Anggota tidak boleh kosong"
                                    : e.contains(" ")?"tak boleh ada spasi":null;
                                },
                              ),
                              SizedBox(
                                height: ScreenUtil.getInstance().setHeight(30),
                              ),
                              Text("Password",
                                  style: TextStyle(
                                      fontFamily: "Poppins-Medium",
                                      fontSize:
                                          ScreenUtil.getInstance().setSp(26))),
                              TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 12.0)),
                                controller: newUserprov.tpass,
                                validator: (e) => e.length < 1
                                    ? "Password tidak boleh kosong"
                                    : null,
                              ),
                              SizedBox(
                                height: ScreenUtil.getInstance().setHeight(35),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  // Text(
                                  //   "Forgot Password?",
                                  //   style: TextStyle(
                                  //       color: Colors.blue,
                                  //       fontFamily: "Poppins-Medium",
                                  //       fontSize:
                                  //           ScreenUtil.getInstance().setSp(28)),
                                  // )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: ScreenUtil.getInstance().setHeight(40)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          child: Container(
                            width: ScreenUtil.getInstance().setWidth(330),
                            height: ScreenUtil.getInstance().setHeight(100),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color(0xFF17ead9),
                                  Color(0xFF6078ea)
                                ]),
                                borderRadius: BorderRadius.circular(6.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xFF6078ea).withOpacity(.3),
                                      offset: Offset(0.0, 8.0),
                                      blurRadius: 8.0)
                                ]),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () async {
                                  if (_formkey.currentState.validate()) {
                                    
                                    setState(() {
                                      isLoading = true;
                                    });
                                    newUserprov
                                        .loginator(newUserprov.tid.text,
                                            newUserprov.tpass.text)
                                        .then((onValue) {
                                      if (onValue == null) {
                                        setState(() {
                                          isLoading = false;
                                        });
                                        showDialog(
                                            context: context,
                                            builder: (_) => AlertDialog(
                                                  content: Text(
                                                      'No Anggota atau Password salah'),
                                                ));
                                      }else{
                                        newUserprov.clear();
                                      }
                                    });
                                  }
                                },
                                child: Center(
                                  child: Text("SIGNIN",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Poppins-Bold",
                                          fontSize: 18,
                                          letterSpacing: 1.0)),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODsO: implement dispose
    _formkey.currentState.dispose();
    super.dispose();
  }
}










// class LoginCasePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final loginProv = Provider.of<NewLoginProv>(context);
//     switch (loginProv.loginStat) {
//       case LoginStat.Loading:
//         return NewSplash();
//       case LoginStat.NotLogin:
//         return Logincoeg();
//       case LoginStat.DahLogin:
//         return NewHomePage();
//       default:
//       return Container();
//     }
//   }
// }

// class NewSplash extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Provider.of<NewLoginProv>(context).cekSharedPref();
//     return Scaffold(
//       body: Container(child: Center(child: CircularProgressIndicator(),)),
//     );
//   }
// }

// class Logincoeg extends StatefulWidget {
//   @override
//   _LogincoegState createState() => _LogincoegState();
// }

// class _LogincoegState extends State<Logincoeg> {
//   bool isLoading;
//   final _formkey = GlobalKey<FormState>();

//   @override
//   void initState() {
//     // TODsO: implement initState
//     super.initState();
//     isLoading = false;
//   }
//   @override
//   Widget build(BuildContext context) {
//     final newUserprov = Provider.of<NewLoginProv>(context);
//     return Scaffold(
//      // appBar: AppBar(title: Text("login boy"),),
//       body: SingleChildScrollView(
//         child: Form(
//           key: _formkey,
//                   child: Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Column(
//             children: <Widget>[
//               SizedBox(height: 50,),
//               Image.asset('images/lolicon.png'),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Id/No anggota'),
//                 controller: newUserprov.tid,
//                 validator: (e)=> e.length<1?"tak boleh kosong":null,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Password'),obscureText: true,
//                 controller: newUserprov.tpass,
//                 validator: (e)=> e.length<1?"tak boleh kosong":null,
//               ),
//               RaisedButton(child: isLoading?CircularProgressIndicator():Text('Login'),
//               onPressed: ()async{
//                 if(_formkey.currentState.validate()){
//                 setState(() {
//                  isLoading=true; 
//                 });
//                 newUserprov.loginator(newUserprov.tid.text, newUserprov.tpass.text).then((onValue){
//                     if (onValue==null){
//                       setState(() {
//                        isLoading=false; 
//                       });
//                       showDialog(context: context,builder: (_)=>AlertDialog(content: Text('id atau pasword salah'),));
//                     }
//                 });
//                 }
//               },)
//             ],
//           ),
//                   ),
//         ),
//       ),
//     );
//   }
// }