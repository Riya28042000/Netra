import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:netra/product/product.dart';
import 'package:netra/query/message.dart';

class Query extends StatefulWidget{
  @override
  _Query createState() => _Query();

}

class _Query extends State <Query>{
 TextEditingController _controller = TextEditingController();
 final List<Message> _messages = <Message>[];

 void MoveToLastScreen(){
  Navigator.pop(context);
}
  @override
  Widget build(BuildContext context) {
  
    return  WillPopScope(
       onWillPop:(){
                    MoveToLastScreen();
       },
          child: Scaffold(
        appBar: AppBar(
           backgroundColor: Colors.blue[900],
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context)
            ),
            title: Text(
              "Query",
              style: TextStyle(
                fontFamily: 'Crimson Text',
                fontSize: 26,
                //           fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
        ),
            body: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white,
                child: new Container(
                  child: new Column(
                    children: <Widget>[
                      //Chat list
                      new Flexible(
                        child: new ListView.builder(
                          padding: new EdgeInsets.all(8.0),
                          reverse: true,
                          itemBuilder: (_, int index) => _messages[index],
                          itemCount: _messages.length,
                        ),
                      ),
                      new Divider(height: 1.0),
                      chat(),
                    ]
                  ),
                ),
        ),
      ),
    );
  }
Widget chat(){
 DateTime time = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd hh:mm').format(time);
  return  Container(
                width: 500,

      decoration: BoxDecoration(
          color: Colors.blue[900],
          borderRadius: BorderRadius.only(
           topLeft: Radius.circular(20),
           topRight: Radius.circular(20),
          )),
      height: 80.0,
      //r  margin: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      child: Row(
        children: <Widget>[
          Flexible(
           child: new ConstrainedBox(
           constraints: new BoxConstraints(
             //   minWidth: size.width,
             // maxWidth: size.width,
             //  minHeight: 25.0,
             maxHeight: 150.0,
           ),
           child: new TextFormField(
               style: new TextStyle(color: Colors.white),
               controller: _controller,
               keyboardType: TextInputType.multiline,
               autofocus: false,
               cursorColor: Colors.white,
                onSaved: (String value) {},

               // onSubmitted: ,

               decoration: InputDecoration(
                 hintText: "Ask Query",
                 enabledBorder: UnderlineInputBorder(
                   borderSide: BorderSide(color: Colors.white),
                 ),
                 focusedBorder: UnderlineInputBorder(
                   borderSide: BorderSide(color: Colors.white),
                 ),
                 focusColor: Colors.white,

                 hintStyle: TextStyle(
                     color: Colors.white,
                     fontFamily: 'Crimson Text',
                     fontSize: 16),

                 filled: true,

                 fillColor: Colors.blue[900],

                 //   enabledBorder: Constants.border,

                 // disabledBorder: Constants.
               )),
           ),
          ),
          new Container(
           margin: new EdgeInsets.only(left: 5.0, right: 5.0),
           child: RawMaterialButton(
           onPressed: () {
              setState(() {
                         chatInput(
                                       _controller.text,
                                       'right',
                                       formattedDate);
                         });
           },
           child: new Icon(
             Icons.send,
             color: Colors.white,
           ),
           fillColor: Colors.blue[900],
           shape: CircleBorder(),
           elevation: 0.0,
           ),
           constraints: BoxConstraints(minWidth: 40, minHeight: 40),
          ),
        ],
      ),
    );
}
  
 void chatInput(String msg, String messageDirection, String date) {
    if (msg.length == 0) {
      Fluttertoast.showToast(
          msg: "Please Enter Message",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue);
    } else {
      _controller.clear();
      Message message = new Message(
        msg: msg,
        direction: messageDirection,
        dateTime: date,
      );
      setState(() {
        _messages.insert(0, message);
      });
    }
  }

}