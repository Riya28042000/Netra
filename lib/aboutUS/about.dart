import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:netra/menu_dashboard/menu_dashboard.dart';
import 'package:netra/navigation/navigation.dart';

class About extends StatefulWidget with NavigationStates {
  final Function onMenuTap;

  const About({Key key, this.onMenuTap}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {

//  Future <bool> _SaveAndBack(){
//            return showDialog(context: context,
//            builder: (context)=> AlertDialog(title: Text('Do you want to exit netra?'),
//            actions: <Widget>[
//              FlatButton(onPressed:()=>Navigator.pop(context,false), child: Text('No')
//              ),
//               FlatButton(onPressed:()=>Navigator.pop(context,true), child: Text('Yes'))
//            ],
//            ));
          
//   }
void MoveToLastScreen(){
   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                            MenuDashboardLayout()), (Route<dynamic> route) => false);
}

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
       onWillPop:(){
                    MoveToLastScreen();
       },
          child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          color: Colors.white,
        ),
        padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    child: Icon(Icons.menu, color: Colors.black),
                    onTap: widget.onMenuTap,
                  ),
                  Text("About Us",
                      style: TextStyle(fontSize: 24, color: Colors.black)),
                  Icon(Icons.info, color: Colors.black),
                ],
              ),
              SizedBox(height: 50),
              Card(
                  child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/netraa.png',
                    fit: BoxFit.fill,
                    height: 200.0,
                  ),
                ],
              )),
              SizedBox(height: 10),
              Column(
                children: <Widget>[
                  Container(
                    decoration: new BoxDecoration(color: Colors.blue[900]),
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 19.0, vertical: 10.0),
                      leading: Container(
                        padding: EdgeInsets.only(right: 12.0),
                        decoration: new BoxDecoration(
                            border: new Border(
                                right: new BorderSide(
                                    width: 1.0, color: Colors.white))),
                        child: Icon(Icons.text_fields, color: Colors.white),
                      ),
                      title: Text(
                        "SHORT TEXT",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                      subtitle: Row(
                        children: <Widget>[
                          //  Icon(Icons.linear_scale, color: Colors.yellowAccent),
                          Flexible(
                              child: Text(
                                  "Speaks text as soon as it appears in front of the camera.",
                                  style: TextStyle(color: Colors.white,
                                  fontFamily: 'Crimson Text'
                                  ))),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: new BoxDecoration(color: Colors.blue[900]),
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 19.0, vertical: 10.0),
                      leading: Container(
                        padding: EdgeInsets.only(right: 12.0),
                        decoration: new BoxDecoration(
                            border: new Border(
                                right: new BorderSide(
                                    width: 1.0, color: Colors.white))),
                        child: Icon(Icons.description, color: Colors.white),
                      ),
                      title: Text(
                        "DOCUMENTS",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                      subtitle: Row(
                        children: <Widget>[
                          //  Icon(Icons.linear_scale, color: Colors.yellowAccent),
                          Flexible(
                              child: Text(
                                  "Provides audio guidance to capture a printed page, and recognizes the text along with it's original formatting.",
                                  style: TextStyle(color: Colors.white,
                                  fontFamily: 'Crimson Text'
                                  )))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: new BoxDecoration(color: Colors.blue[900]),
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 19.0, vertical: 10.0),
                      leading: Container(
                        padding: EdgeInsets.only(right: 12.0),
                        decoration: new BoxDecoration(
                            border: new Border(
                                right: new BorderSide(
                                    width: 1.0, color: Colors.white))),
                        child: Icon(MdiIcons.barcodeScan, color: Colors.white),
                      ),
                      title: Text(
                        "PRODUCTS",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                      subtitle: Row(
                        children: <Widget>[
                          //  Icon(Icons.linear_scale, color: Colors.yellowAccent),
                          Flexible(
                              child: Text(
                                  "Gives audio beeps to help locate barcodes and then scans them to identify products.",
                                  style: TextStyle(color: Colors.white,
                                  fontFamily: 'Crimson Text')))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: new BoxDecoration(color: Colors.blue[900]),
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 19.0, vertical: 10.0),
                      leading: Container(
                        padding: EdgeInsets.only(right: 12.0),
                        decoration: new BoxDecoration(
                            border: new Border(
                                right: new BorderSide(
                                    width: 1.0, color: Colors.white))),
                        child: Icon(Icons.accessibility, color: Colors.white),
                      ),
                      title: Text(
                        "PERSON",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                      subtitle: Row(
                        children: <Widget>[
                          //  Icon(Icons.linear_scale, color: Colors.yellowAccent),
                          Flexible(
                              child: Text(
                                  "Recognises friends and describes people around you, including their emotions.",
                                  style: TextStyle(color: Colors.white,
                                  fontFamily: 'Crimson Text')))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: new BoxDecoration(color: Colors.blue[900]),
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 19.0, vertical: 10.0),
                      leading: Container(
                        padding: EdgeInsets.only(right: 12.0),
                        decoration: new BoxDecoration(
                            border: new Border(
                                right: new BorderSide(
                                    width: 1.0, color: Colors.white))),
                        child: Icon(Icons.streetview, color: Colors.white),
                      ),
                      title: Text(
                        "SCENE",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                      subtitle: Row(
                        children: <Widget>[
                          //  Icon(Icons.linear_scale, color: Colors.yellowAccent),
                          Flexible(
                              child: Text(
                                  "An experimental feature to describe the scene around you.",
                                  style: TextStyle(color: Colors.white,
                                  fontFamily: 'Crimson Text')))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: new BoxDecoration(color: Colors.blue[900]),
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 19.0, vertical: 10.0),
                      leading: Container(
                        padding: EdgeInsets.only(right: 12.0),
                        decoration: new BoxDecoration(
                            border: new Border(
                                right: new BorderSide(
                                    width: 1.0, color: Colors.white))),
                        child: Icon(Icons.attach_money, color: Colors.white),
                      ),
                      title: Text(
                        "CURRENCY",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                      subtitle: Row(
                        children: <Widget>[
                          //  Icon(Icons.linear_scale, color: Colors.yellowAccent),
                          Flexible(
                              child: Text(
                                  "Identify currency bills when paying with cash.",
                                  style: TextStyle(color: Colors.white,
                                  fontFamily: 'Crimson Text')))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  // static List getDummyList() {
  //   List list = List.generate(6, (i) {
  //     return "Item ${i + 1}";
  //   });
  //   return list;
  // }
}
