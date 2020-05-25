import 'package:flutter/material.dart';
import 'package:netra/menu_dashboard/menu_dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart'as splash;

class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  bool pass=false;
//  void initState(){
//     data();
//   }

  void data()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    String token= pref.getString('token');
    if(token=='data'){
    
   setState(() {
    pass=true; 
   });
    }
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: 
           Stack(
          children: <Widget>[
            Positioned(
              top: (height-400)/2,
              left: (width-400)/2,
              child: Center(

               
                                  child: Container(
                    color: Colors.white,
                    height:
                    650,
                    width: 400,
               
                                          child: splash.SplashScreen(
                          seconds: 6,
                          navigateAfterSeconds: pass==true?MenuDashboardLayout():MenuDashboardLayout(),
                          image: new Image.asset("assets/eye.gif",fit: BoxFit.cover,),

                          backgroundColor: Colors.white,
                          styleTextUnderTheLoader: new TextStyle(),
                          photoSize: 200.0,
                          loaderColor: Colors.white),
                    
                  ),
               
              ),
            ),
          ],
        ),
     
    );
  }
}