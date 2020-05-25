import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:netra/navigation/navigation.dart';
import 'package:netra/product/product.dart';

class Home extends StatefulWidget with NavigationStates {
  final Function onMenuTap;
  const Home({Key key, this.onMenuTap}) : super(key: key);
  
  // Home(this.image);
  @override
  _HomeState createState() => _HomeState();
  

}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  // File image;
  File _imageFile;
  bool _isUploading = false;
  

  void _getImage(BuildContext context, ImageSource source) async {
    File image = await ImagePicker.pickImage(source: source);
    setState(() {
      _imageFile = image;
    });
    Navigator.pop(context);
  }

  //    upload(File imageFile,BuildContext context) async {

  // var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
  //  var length = await imageFile.length();
  //var uri = Uri.parse("http://max-image-caption-generator.max.us-south.containers.appdomain.cloud/model/predict");
  // var request = new http.MultipartRequest("POST", uri);
  // var multipartFile = new http.MultipartFile('file', stream, length,
  // filename: basename(imageFile.path));
  // request.files.add(multipartFile);
  // var response = await request.send();
  // print(response.statusCode);
  //print("riyagarg");
  // response.stream.transform(utf8.decoder).listen((value) {
  // print(value);
  //}
  // );
  // _resetState();

  //   }

  void upload(File _imageFile, BuildContext context) async {
    print('Upload started');
    setState(() {
     // SpinKitWave(color: Colors.white, type: SpinKitWaveType.start);
      _isUploading = true;
    });
    String fileName = _imageFile.path.split('/').last;

    FormData data = FormData.fromMap({
      "image": await MultipartFile.fromFile(
        _imageFile.path,
        filename: fileName,
        contentType: new MediaType("image", "jpeg"),
      ),
    });

    Dio dio = new Dio();

    dio
        .post(
            "http://max-image-caption-generator.codait-prod-41208c73af8fca213512856c7a09db52-0000.us-east.containers.appdomain.cloud/model/predict",
            data: data)
        .then((response) {
      print(response);
      Map responseBody = response.data;
      print('rg2');
      //print(responseBody);
      print(responseBody['predictions']);
      //print(response['status']);
      // print(responsebody);
      print(response.runtimeType);

      setState(() {
       _isUploading = false;
      });

      
      Navigator.push<bool>(
        context,
        MaterialPageRoute(
          builder: (context) =>
              Product(_imageFile, responseBody['predictions']),
        ),
      ).then((bool value){
            print(value);
      });

      print('upload ended');
    }).catchError((error) {
      print(error);

      setState(() {
        _isUploading = false;
      });
      showAlertDialog(context);
    });
  }

  //if (response ==200) {
  //   print("SUCCESSFUL");

  //  Navigator.push(
  //   context,
  //  MaterialPageRoute(builder: (context) => Product()));
  // } else {

  //          showAlertDialog(context);
  //_resetState();
  //  }

  showAlertDialog(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("ERROR"),
      content: Text("Check your Internet Connection"),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _startUploading(BuildContext context) async {
    // upload(_imageFile,context);
    upload(_imageFile, context);
    // Check if any error occured
  }

  void _openImagePickerModal(BuildContext context) {
    final flatButtonColor = Theme.of(context).primaryColor;
    print('riyagarg');
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 150.0,
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Text(
                  'Pick an image',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                FlatButton(
                  textColor: flatButtonColor,
                  child: Text('Use Camera'),
                  onPressed: () {
                    _getImage(context, ImageSource.camera);
                  },
                ),
                FlatButton(
                  textColor: flatButtonColor,
                  child: Text('Use Gallery'),
                  onPressed: () {
                    _getImage(context, ImageSource.gallery);
                  },
                ),
              ],
            ),
          );
        });
  }

  Widget _buildUploadBtn(BuildContext context) {
    Widget btnWidget = Container();
    if (_isUploading) {
      btnWidget = Container(
          margin: EdgeInsets.only(top: 10.0),
          child: SpinKitChasingDots(color:Colors.blue[900]));
    } else if (!_isUploading && _imageFile != null) {
      btnWidget = Container(
        margin: EdgeInsets.only(top: 10.0),
        child: RaisedButton(
          child: Text('Upload'),
          onPressed: () {
            _startUploading(context);
          },
          color: Colors.blue[900],
          textColor: Colors.white,
        ),
      );
    }
    return btnWidget;
  }
        
   Future <bool> _SaveAndBack(){
           return showDialog(context: context,
           builder: (context)=> AlertDialog(title: Text('Do you want to exit netra?'),
           actions: <Widget>[
             FlatButton(onPressed:()=>Navigator.pop(context,false), child: Text('No')
             ),
              FlatButton(onPressed:()=>Navigator.pop(context,true), child: Text('Yes'))
           ],
           ));
          
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _SaveAndBack,
          child: Container(
        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          color: Colors.white,
        ),
        padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
        
    child:  SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Material(
                                        child: InkWell(
                        child: Icon(Icons.menu, color: Colors.black),
                        onTap: widget.onMenuTap,
                      ),
                    ),
                    Text("Home",
                        style: TextStyle(fontSize: 24, color: Colors.black)),
                    Icon(Icons.home, color: Colors.black),
                  ],
                ),
                SizedBox(height: 50),
                Card(
                    child: Column(
                  children: <Widget>[
                    Image.asset('assets/netra.png'),
                    Text('NETRA: TRANSFORMING LIVES',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15))
                  ],
                )),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Designed for the blind and low vision community, this research project harnesses the power of NETRA to describe people, text, currency, color, and objects.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Crimson Text',
                              fontSize: 15),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Seeing NETRA is a research project that brings together the power of the cloud and NETRA to deliver an intelligent app designed to help you navigate your day. Point your phone’s camera, select a channel, and hear a description of what the NETRA has recognized around you.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Crimson Text',
                              fontSize: 15),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "With this intelligent camera app, just hold up your phone and hear information about the world around you. Seeing NETRA can speak short text as soon as it appears in front of the camera, provide audio guidance to capture a printed page, and recognizes and narrates the text along with its original formatting. The app can also scan barcodes with guided audio cues to identify products, recognize and describe people around you and their facial expressions, as well as describing scenes around you using the power of NETRA.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Crimson Text',
                              fontSize: 15),
                        ),
                        SizedBox(height: 30),
                        FloatingActionButton.extended(
                          onPressed: () => _openImagePickerModal(context),
                          icon: Icon(
                            Icons.camera,
                            color: Colors.white,
                          ),
                          label: Text(
                            "Camera",
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.blue[900],
                        ),
                        SizedBox(height: 30),
                        _imageFile == null
                            ? Text('')
                            : Image.file(
                                _imageFile,
                                fit: BoxFit.fill,
                                height: 450.0,
                                alignment: Alignment.topCenter,
                                width: MediaQuery.of(context).size.width,
                      
                              ),
                        _buildUploadBtn(context),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        
      ),
    );
  }
}
