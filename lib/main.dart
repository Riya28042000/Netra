import 'package:flutter/material.dart';
import 'package:netra/splash/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       builder: (context, child) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: child,
    );
  },
        title: 'Netra',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        
        home: SplashScreen());
  }
}
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}