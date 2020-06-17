import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  Message({this.msg, this.direction, this.dateTime});

  final String msg;
  final String direction;
  final String dateTime;

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    new Stack(
                      alignment: Alignment.topRight,
                      children: <Widget>[
                        //for right corner
                        new Icon(
                          Icons.send,
                          size: 30,                        
                        ),

                        new Container(
                          margin: EdgeInsets.only(right: 6.0),
                          decoration: new BoxDecoration(
                            color: Colors.black,
                            border: new Border.all(
                                color: Colors.black,
                                width: .25,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5.0),
                              topLeft: Radius.circular(5.0),
                              bottomRight: Radius.circular(0.0),
                              bottomLeft: Radius.circular(0.0),
                            ),
                          ),
                          alignment: Alignment.bottomRight,
                          padding: const EdgeInsets.all(8.0),
                          child: new Text(
                            msg,
                            style: new TextStyle(
                              fontFamily: 'Crimson Text',
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                          width: 180.0,
                        ),
                      ],
                    ),

                    //date time
                    new Container(
                      margin: EdgeInsets.only(right: 6.0),
                      decoration: new BoxDecoration(
                        color: Colors.black,
                        border: new Border.all(
                            color: Colors.black,
                            width: .25,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(0.0),
                          topLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(5.0),
                          bottomLeft: Radius.circular(5.0),
                        ),
                      ),
                      alignment: Alignment.bottomRight,
                      padding: const EdgeInsets.only(
                          top: 0.0, bottom: 8.0, left: 8.0, right: 8.0),
                      child: new Text(
                        dateTime,
                        style: new TextStyle(
                          fontSize: 8.0,
                          color: Colors.white,
                        ),
                      ),
                      width: 180.0,
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}