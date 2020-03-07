import 'dart:ui';
import 'package:flutter/material.dart';
import 'code.dart';

class Encrypt extends StatefulWidget {
  @override
  EncryptState createState() => EncryptState();
}

class EncryptState extends State<Encrypt> {
  String _result = "";
  final TextEditingController _plainText = TextEditingController();
  final TextEditingController _keyValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Encryption"),
          backgroundColor: Colors.greenAccent,
        ),
        body: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                Container(
                  width: 200,
                  height: 150,
                  child: Image.asset("images/enc.png"),
                ),
                Container(
                    width: double.infinity,
                    height: 100,
                    child: TextField(
                      controller: _plainText,
                      decoration: InputDecoration(
                        labelText: "Enter Plain Text",
                      ),
                    )),
                Container(
                    width: double.infinity,
                    height: 100,
                    child: TextField(
                      controller: _keyValue,
                      decoration: InputDecoration(labelText: "Enter Key Value"),
                    )),
                Flexible(
                    child: FlatButton(
                        onPressed: _Cipher,
                        child: Text("ENCRYPT"),
                        color: Colors.greenAccent,
                        textColor: Colors.white,
                        padding: EdgeInsets.only(
                            top: 10.0, bottom: 10.0, left: 20.0, right: 20.0))),
                ResultsWidget(_result),
              ],
            ),
          ),
        ));
  }

  void _Cipher() {
    //_result = _keyValue.text;
    var shift = _keyValue.text;
    // print(shift);
    var text = _plainText.text;
    //  print(text);
    VigenereCipher enc = new VigenereCipher(shift);
    _result = enc.encrypt(text);
    setState(() {});
  }

  Widget ResultsWidget(_result) {
    bool canShow = true;

    return Container(
        margin: EdgeInsets.only(top: 20.0),
        child: canShow
            ? Column(children: [
                Text("Your Message is ",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54)),
                Container(
                    child: Text(_result,
                        style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange)))
              ])
            : Container());
  }
}
