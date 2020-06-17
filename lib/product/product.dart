import 'dart:io';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/material.dart';
import 'package:netra/menu_dashboard/menu_dashboard.dart';
import 'package:netra/query/query.dart';

class Product extends StatefulWidget {
  File image;
  Product(this.image, this.response);
  var response;

  @override
  _ProductState createState() => _ProductState(image, response);
}

class _ProductState extends State<Product> {
  File image;
  var response;
  _ProductState(this.image, this.response) {
    print('rg');
    //print(response);
    //print('rgarg5');
    print(response[0]['caption']);
    print('rgarg2');
    // print(response.predictions[0].caption);
    //print('rgarg');
  }

  bool isPlaying = false;
  FlutterTts _flutterTts;

  void initState() {
    super.initState();
    initializeTts();
  }

  @override
  void dispose() {
    super.dispose();
    _flutterTts.stop();
  }

  initializeTts() {
    _flutterTts = FlutterTts();

    // if (PlatformUtil.myPlatform() == MyPlatform.ANDROID) {
    //   _flutterTts.ttsInitHandler(() {
    //     setTtsLanguage();
    //   });
    // } else if (PlatformUtil.myPlatform() == MyPlatform.IOS) {
    //   setTtsLanguage();
    // } else if (PlatformUtil.myPlatform() == MyPlatform.WEB) {
    //   //not-supported by plugin
    // }

    _flutterTts.setStartHandler(() {
      setState(() {
        isPlaying = true;
      });
    });

    _flutterTts.setCompletionHandler(() {
      setState(() {
        isPlaying = false;
      });
    });

    _flutterTts.setErrorHandler((err) {
      setState(() {
        print("error occurred: " + err);
        isPlaying = false;
      });
    });
  }

  void setTtsLanguage() async {
    await _flutterTts.setLanguage("en-US");
  }

  void speechSettings1() {
    _flutterTts.setVoice("en-us-x-sfg#male_1-local");
    _flutterTts.setPitch(1.5);
    _flutterTts.setSpeechRate(.9);
  }

  void speechSettings2() {
    _flutterTts.setVoice("en-us-x-sfg#male_2-local");
    _flutterTts.setPitch(1);
    _flutterTts.setSpeechRate(0.5);
  }

  Future _speak(String text) async {
    if (text != null && text.isNotEmpty) {
      var result = await _flutterTts.speak(text);
      if (result == 1)
        setState(() {
          isPlaying = true;
        });
    }
  }

  Future _stop() async {
    var result = await _flutterTts.stop();
    if (result == 1)
      setState(() {
        isPlaying = false;
      });
  }

  void MoveToLastScreen() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => MenuDashboardLayout()),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        MoveToLastScreen();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => MenuDashboardLayout()),
                  (Route<dynamic> route) => false)),
          title: Text(
            "Product",
            style: TextStyle(
              fontFamily: 'Crimson Text',
              fontSize: 26,
              //           fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //               child: Row(

                    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    //                   mainAxisSize: MainAxisSize.max,

                    //                   children: [

                    //                         IconButton(
                    //   icon: Icon(Icons.arrow_back),
                    //   color: Colors.black,
                    //   onPressed: () {Navigator.pop(context);},
                    // ),

                    //                Center(child: Text("Product", style: TextStyle(fontSize: 24, color: Colors.black))),

                    //           Icon(Icons.picture_in_picture, color: Colors.black),

                    //                   ],

                    //               ),

                    SizedBox(height: 10),

                    image == null
                        ? Text('')
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 5.0,
                                ),
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Colors.black.withOpacity(0.8),
                                //     spreadRadius: 10,
                                //     blurRadius: 5,
                                //     offset: Offset(0, 7), // changes position of shadow
                                //   ),
                                // ],
                              ),
                              child: Image.file(
                                image,
                                fit: BoxFit.fill,
                                height: 450.0,
                                alignment: Alignment.topCenter,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                          ),

                    SizedBox(height: 10),

                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            response[0]['caption'],
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Crimson Text',
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 10),

                    Container(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 3.0, horizontal: 16.0),
                            margin: const EdgeInsets.only(
                                left: 130.0, right: 30.0, bottom: 20.0),
                            child: FlatButton(
                              onPressed: () {
                                //fetch another image
                                setState(() {
                                  //speechSettings1();
                                  isPlaying
                                      ? _stop()
                                      : _speak(response[0]['caption']);
                                });
                              },
                              child: isPlaying
                                  ? Icon(
                                      Icons.stop,
                                      size: 60,
                                      color: Colors.blue[900],
                                    )
                                  : Icon(
                                      Icons.play_arrow,
                                      size: 60,
                                      color: Colors.black,
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(1),
                      child: new GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Query()),
                          );
                        },
                        child: Center(
                            child: new Text(
                          "Click Here For Any Query",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontFamily: 'Crimson Text',
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                    SizedBox(height: 10)
                    // SizedBox(height: 05),

                    // new Container(
                    //   decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       borderRadius: BorderRadius.only(
                    //           topLeft: Radius.circular(20),
                    //           topRight: Radius.circular(20))),
                    //   constraints: BoxConstraints(maxHeight: 150.0),
                    //   padding:
                    //       const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    // ),
                    // SizedBox(height:10),

                    //Chat list
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
