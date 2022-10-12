// stateless and statefull routes
// aka stooge picker

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: const HomePage(), routes: <String, WidgetBuilder>{
    "/HomePage": (BuildContext context) => const HomePage(),
    "/SecondPage": (BuildContext context) => const SecondPage(),
    "/ThirdPage":(BuildContext context) => const ThirdPage()
  }));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Home Page Stateful Widgets"),
            backgroundColor: Colors.deepOrange),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          children: [
            Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  const Text("\nHome Page", style: TextStyle(fontSize: 24.0)),
                  const Divider(height: 20, thickness: 5, color: Colors.blue),
                  IconButton(
                      icon: const Icon(Icons.face, color: Colors.blue),
                      iconSize: 70,
                      onPressed: () {
                        Navigator.of(context).pushNamed("/SecondPage");
                      }),
                  IconButton(
                      icon: const Icon(Icons.face, color: Colors.red),
                      iconSize: 70,
                      onPressed: () {
                        Navigator.of(context).pushNamed("/ThirdPage");
                      })
                ]))
          ],
        ));
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPage createState() => _SecondPage();
}

Widget stoogePhoto(String selectStooge) {
  return Padding(
      padding: EdgeInsets.all(10.0),
      child: Image.asset(selectStooge,
          height: 400, width: 300, fit: BoxFit.cover));
}

class _SecondPage extends State<SecondPage> {
  String myStooge = "Larry";
  var stoogeCounter = 0;
  Color stoogeColor = Colors.blue;

  String larryPhoto = "images/larry.jpg";
  String curlyPhoto = "images/curly.jpg";
  String moePhoto = "images/moe.jpg";
  String selectStooge = "images/larry.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Pick a stooge"),
            backgroundColor: Colors.deepOrange),
        body: ListView(children: [
          Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                const Text("\nPick Stooge", style: TextStyle(fontSize: 24.0)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: stoogeColor,
                      textStyle: TextStyle(color: Colors.white)),
                  onPressed: changeStooge,
                  child: Text(myStooge),
                ),
                stoogePhoto(selectStooge),
                const Divider(
                    height: 20.0,
                    indent: 20.0,
                    endIndent: 20.0,
                    thickness: 5.0,
                    color: Colors.blue),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: const Icon(Icons.house, color: Colors.red),
                        iconSize: 70,
                        onPressed: () {
                          Navigator.of(context).pushNamed("/HomePage");
                        }),
                    IconButton(
                        icon: const Icon(Icons.face, color: Colors.green),
                        iconSize: 70,
                        onPressed: () {
                          Navigator.of(context).pushNamed("/ThirdPage");
                        })
                  ],
                )
              ]))
        ]));
  } //widget build

  void changeStooge() {
    stoogeCounter++;

    setState(() {
      if ((stoogeCounter % 3) == 0) {
        myStooge = "Larry";
        stoogeColor = Colors.blue;
        selectStooge = larryPhoto;
      } else if ((stoogeCounter % 3) == 1) {
        myStooge = "Curly";
        stoogeColor = Colors.yellow;
        selectStooge = curlyPhoto;
      } else if ((stoogeCounter % 3) == 2) {
        myStooge = "Moe";
        stoogeColor = Colors.red;
        selectStooge = moePhoto;
      }
    });
  }
} //end of second page class

class ThirdPage extends StatelessWidget {

  const ThirdPage({Key? key}) : super(key: key);
  Widget goHome(BuildContext context){
    return(Column(
        children: [
        IconButton(
            icon: const Icon(Icons.house, color: Colors.red),
            iconSize: 70,
            onPressed: () {
              Navigator.of(context).pushNamed("/HomePage");
            }),
          const Text("Go To\nHome Page", textAlign: TextAlign.center),
  ]));}

  Widget goStooges(BuildContext context){
    return(Column(
        children: [
    IconButton(
    icon: const Icon(Icons.face, color: Colors.blue),
    iconSize: 70,
    onPressed: () {
    Navigator.of(context).pushNamed("/SecondPage");
    }),
    const Text("Go To\nSecond Page", textAlign: TextAlign.center)

    ]));


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Third Page Stateful Widgets"),
            backgroundColor: Colors.green),
        body: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("\nThirdPage\nPut your stuff here\n\n\n"),
                    const Divider(height: 5.0, thickness: 5.0, color: Colors.pink,),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        goHome(context),
                        goStooges(context)
                      ],


                    )
                  ],
              )
            )

    )
    );
  }
}//end of class 3rd page
