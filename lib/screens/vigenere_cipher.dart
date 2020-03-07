import 'package:flutter/material.dart';
import 'enc.dart';
import 'dec.dart';

class Vigenere extends StatelessWidget {
  final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('VIGENERE CIPHER'),
            backgroundColor: Colors.greenAccent,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Expanded(
                    child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  itemCount: slideList.length,
                  itemBuilder: (ctx, i) => SlideItems(i),
                )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    FlatButton(
                      child: Text(
                        "ENCRYPT",
                        style: TextStyle(fontSize: 20),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.all(15),
                      color: Colors.greenAccent,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Encrypt()));
                      },
                      textColor: Colors.white,
                    ),
                    FlatButton(
                      child: Text(
                        "DECRYPT",
                        style: TextStyle(fontSize: 18),
                      ),
                      color: Colors.greenAccent,
                      padding: const EdgeInsets.all(15),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Decrypt()));
                      },
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

class SlideItems extends StatelessWidget {
  final int index;
  SlideItems(this.index);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(slideList[index].imageUrl),
                  fit: BoxFit.cover)),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          slideList[index].title,
          style: TextStyle(fontSize: 24, color: Theme.of(context).primaryColor),
        ),
        SizedBox(
          height: 10,
        ),
        Text(slideList[index].decs,
            textAlign: TextAlign.justify,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class Slide {
  final String imageUrl;
  final String title;
  final String decs;
  Slide({@required this.imageUrl, @required this.title, @required this.decs});
}

final slideList = [
  Slide(
      imageUrl: "images/vc1.jpg",
      title: "BLAISE DE VIGENERE",
      decs: "The Vigenère cipher "
          " is a method of encrypting alphabetic text by using a series of "
          "interwoven Caesar ciphers, based on the letters of a keyword. It "
          "employs a form of polyalphabetic substitution"),
  Slide(
      imageUrl: "images/vc2.jpg",
      title: "DESCRIPTION",
      decs:
          "Vigenere Cipher is a method of encrypting alphabetic text. It uses a simple"
          " form of polyalphabetic substitution. A polyalphabetic cipher is any cipher based on substitution, "
          "using multiple substitution alphabets .The encryption of the original text is done using the Vigenère square "
          "or Vigenère table. The table consists of the alphabets written out 26 times in different rows, each alphabet shifted"
          " cyclically to the left compared to the previous alphabet, corresponding to the 26 possible Caesar Ciphers. "
          "At different points in the encryption process, the cipher uses a different alphabet from one of the rows."
          "The alphabet used at each point depends on a repeating keyword")
];
