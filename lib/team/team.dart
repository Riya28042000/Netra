import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:netra/menu_dashboard/menu_dashboard.dart';
import 'package:netra/navigation/navigation.dart';

class Team extends StatefulWidget with NavigationStates {
  final Function onMenuTap;

  const Team({Key key, this.onMenuTap}) : super(key: key);

  @override
  _TeamState createState() => _TeamState();
}

class _TeamState extends State<Team> {

  //   Future <bool> _SaveAndBack(){
  //          return showDialog(context: context,
  //          builder: (context)=> AlertDialog(title: Text('Do you want to exit netra?'),
  //          actions: <Widget>[
  //            FlatButton(onPressed:()=>Navigator.pop(context,false), child: Text('No')
  //            ),
  //             FlatButton(onPressed:()=>Navigator.pop(context,true), child: Text('Yes'))
  //          ],
  //          ));
          
  // }

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
          scrollDirection: Axis.vertical,
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
                  Text("Team",
                      style: TextStyle(fontSize: 24, color: Colors.black)),
                  Icon(Icons.people, color: Colors.black),
                ],
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  child: Text(
                    "We are sincere with a straightforward vision. We believe there is an amazing amount to be learned by working in a real-world app production environment, alongside other like-minded teens. With this in mind we formed our team and started working on this project named NETRA. We've had an amazing journey on working this project and now we feel confident that we can provide you a proffesional and effective solution in a timely manner.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Crimson Text',
                        fontSize: 15),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                  height: 40,
                  color: Colors.blue[900],
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "MENTORS ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                                ,fontFamily: 'Crimson Text'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 2,
                        width: 150,
                        color: Colors.white,
                      )
                    ],
                  )),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: FlipCard(
                      direction: FlipDirection.HORIZONTAL,
                      front: Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 20,
                          color: Colors.black,
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 65,
                                    backgroundColor: Colors.black,
                                    backgroundImage:
                                        AssetImage("assets/akhileshsir.png"),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Akhilesh Verma",
                                    style: TextStyle(color: Colors.white,fontFamily: 'Crimson Text'),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Mentor",
                                    style: TextStyle(color: Color(0xffffffff),fontFamily: 'Crimson Text'),
                                  )
                                ],
                              ),
                            ),
                          )),
                      back: Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 20,
                          color: Colors.black,
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 65,
                                    backgroundColor: Colors.black,
                                    backgroundImage:
                                        AssetImage("assets/akhileshsir.png"),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Akhilesh Verma",
                                    style: TextStyle(color: Colors.white,fontFamily: 'Crimson Text'),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "CSE",
                                    style: TextStyle(color: Color(0xffffffff),fontFamily: 'Crimson Text'),
                                  )
                                ],
                              ),
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: FlipCard(
                      direction: FlipDirection.HORIZONTAL,
                      front: Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 20,
                          color: Colors.black,
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 65,
                                    backgroundColor: Colors.black,
                                    backgroundImage:
                                        AssetImage("assets/nishumaam.png"),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Nishu Bansal",
                                    style: TextStyle(color: Colors.white,fontFamily: 'Crimson Text'),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Mentor",
                                    style: TextStyle(color: Color(0xffffffff),fontFamily: 'Crimson Text'),
                                  )
                                ],
                              ),
                            ),
                          )),
                      back: Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 20,
                          color: Colors.black,
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 65,
                                    backgroundColor: Colors.black,
                                    backgroundImage:
                                        AssetImage("assets/nishumaam.png"),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Nishu Bansal",
                                    style: TextStyle(color: Colors.white,fontFamily: 'Crimson Text'),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "CSE",
                                    style: TextStyle(color: Color(0xffffffff),fontFamily: 'Crimson Text'),
                                  )
                                ],
                              ),
                            ),
                          )),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              // Container(
              //     height: 40,
              //     color: Colors.blue[900],
              //     child: Column(
              //       children: <Widget>[
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           children: <Widget>[
              //             Text(
              //               "OUR ",
              //               style: TextStyle(
              //                   color: Colors.white,
              //                   fontWeight: FontWeight.bold,
              //                   fontSize: 20),
              //             ),
              //             Text(
              //               "TEAM",
              //               style: TextStyle(
              //                   color: Colors.white,
              //                   fontWeight: FontWeight.bold,
              //                   fontSize: 20),
              //             ),
              //           ],
              //         ),
              //         SizedBox(
              //           height: 5,
              //         ),
              //         Container(
              //           height: 2,
              //           width: 170,
              //           color: Colors.white,
              //         )
              //       ],
              //     )),
              // SizedBox(
              //   height: 30,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: <Widget>[
              //     Expanded(
              //       child: FlipCard(
              //         direction: FlipDirection.HORIZONTAL,
              //         front: Card(
              //             clipBehavior: Clip.antiAlias,
              //             elevation: 20,
              //             color: Colors.black,
              //             child: Padding(
              //               padding: const EdgeInsets.all(13.0),
              //               child: Container(
              //                 child: Column(
              //                   children: <Widget>[
              //                     CircleAvatar(
              //                       radius: 65,
              //                       backgroundColor: Colors.black,
              //                       backgroundImage:
              //                           AssetImage("assets/sidsir.png"),
              //                     ),
              //                     SizedBox(
              //                       height: 10,
              //                     ),
              //                     Text(
              //                       "Siddharth Singh",
              //                       style: TextStyle(color: Colors.white),
              //                     ),
              //                     SizedBox(
              //                       height: 10,
              //                     ),
              //                     Text(
              //                       "Developer",
              //                       style: TextStyle(color: Color(0xffffffff)),
              //                     )
              //                   ],
              //                 ),
              //               ),
              //             )),
              //         back: Card(
              //             clipBehavior: Clip.antiAlias,
              //             elevation: 20,
              //             color: Colors.black,
              //             child: Padding(
              //               padding: const EdgeInsets.all(13.0),
              //               child: Container(
              //                 child: Column(
              //                   children: <Widget>[
              //                     CircleAvatar(
              //                       radius: 65,
              //                       backgroundColor: Colors.black,
              //                       backgroundImage:
              //                           AssetImage("assets/sidsir.png"),
              //                     ),
              //                     SizedBox(
              //                       height: 10,
              //                     ),
              //                     Text(
              //                       "CSE",
              //                       style: TextStyle(color: Colors.white),
              //                     ),
              //                     SizedBox(
              //                       height: 10,
              //                     ),
              //                     Text(
              //                       "4 Year",
              //                       style: TextStyle(color: Color(0xffffffff)),
              //                     )
              //                   ],
              //                 ),
              //               ),
              //             )),
              //       ),
              //     ),
              //     SizedBox(
              //       width: 20,
              //     ),
              //     Expanded(
              //       child: FlipCard(
              //         direction: FlipDirection.HORIZONTAL,
              //         front: Card(
              //             clipBehavior: Clip.antiAlias,
              //             elevation: 20,
              //             color: Colors.black,
              //             child: Padding(
              //               padding: const EdgeInsets.all(13.0),
              //               child: Container(
              //                 child: Column(
              //                   children: <Widget>[
              //                     CircleAvatar(
              //                       radius: 65,
              //                       backgroundColor: Colors.black,
              //                       backgroundImage:
              //                           AssetImage("assets/sidsir.png"),
              //                     ),
              //                     SizedBox(
              //                       height: 10,
              //                     ),
              //                     Text(
              //                       "Varun Singh",
              //                       style: TextStyle(color: Colors.white),
              //                     ),
              //                     SizedBox(
              //                       height: 10,
              //                     ),
              //                     Text(
              //                       "Developer",
              //                       style: TextStyle(color: Color(0xffffffff)),
              //                     )
              //                   ],
              //                 ),
              //               ),
              //             )),
              //         back: Card(
              //             clipBehavior: Clip.antiAlias,
              //             elevation: 20,
              //             color: Colors.black,
              //             child: Padding(
              //               padding: const EdgeInsets.all(13.0),
              //               child: Container(
              //                 child: Column(
              //                   children: <Widget>[
              //                     CircleAvatar(
              //                       radius: 65,
              //                       backgroundColor: Colors.black,
              //                       backgroundImage:
              //                           AssetImage("assets/sidsir.png"),
              //                     ),
              //                     SizedBox(
              //                       height: 10,
              //                     ),
              //                     Text(
              //                       "CSE",
              //                       style: TextStyle(color: Colors.white),
              //                     ),
              //                     SizedBox(
              //                       height: 10,
              //                     ),
              //                     Text(
              //                       "4 Year",
              //                       style: TextStyle(color: Color(0xffffffff)),
              //                     )
              //                   ],
              //                 ),
              //               ),
              //             )),
              //       ),
              //     )
              //   ],
              // ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
