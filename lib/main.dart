library lib.main;

//note to self: when using dson, import dson and everything you want to serialize, otherwhise,
//it won't work

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dson/dson.dart';
import 'package:path_provider/path_provider.dart';
import 'egggetterbase.dart';
import 'numformat.dart';
import 'savedata.dart';
import 'upgrade.dart';

part 'main.g.dart';

void main() {
  _initMirrors();
  FunctionProxy.modifyerFunctions = [
    (num x) => x * 0.90
  ];
  runApp(new MyApp());
}

//basically set state means update the gui after i run this function plz ty

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Egg Game',
      theme: new ThemeData(
          primarySwatch: Colors.blueGrey, accentColor: Colors.blueAccent),
      home: new MyHomePage(title: 'this a cool egg'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final List<Tab> tabs = <Tab>[
    new Tab(text: "Main"),
    new Tab(text: "Upgrades")
  ];
  void _incrementCounter() {
    setState(() {
      saveD.eggs++;
    });
  }

  void _incrementBy(num x) {
    setState(() {
      saveD.eggs += x;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
    doStateUpdate = setState;
    load();
    scaffoldKey = new GlobalKey();
    new Timer.periodic(const Duration(seconds: 1), (_) {
      for (EggGetterFactory x in saveD.eggGetterFactories) {
        _incrementBy(x.eggsGet);
      }
    });
    new Timer.periodic(const Duration(minutes: 5), (_) {
      save();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance
    // as done by the _incrementCounter method above.
    // The Flutter framework has been optimized to make rerunning
    // build methods fast, so that you can just rebuild anything that
    // needs updating rather than having to individually change
    // instances of widgets.
    return new Scaffold(
      key: scaffoldKey,
      drawer: new Drawer(
          child: new ListView(children: [
        new DrawerHeader(child: const Text("Cool egg game")),
        new ListTile(title: const Text("Save Game"), onTap: save),
        new ListTile(title: const Text("Delete save file"), onTap: deleteSave),
        new ListTile(title: const Text("Force Load"), onTap: (){setState(() {
          load();
        });}),
        new ListTile(title: const Text("Developer (Alex Clarke) menu"), onTap: (){
          showModalBottomSheet(context: context, builder: (BuildContext ctx) {
            return new BottomSheet(
              builder: (BuildContext ctx2) {
                return new ListView(children: [
                  new ListTile(title: const Text("Alex Clarke's DEV MODE")),
                  new ListTile(title: const Text("Dump save data to Downloads"), onTap: () {
                    getApplicationDocumentsDirectory().then((Directory aDD) {
                      getExternalStorageDirectory().then((Directory eSD) {
                        //aDD/saveData.json -> eSD/wherever/saveData.json
                        File saveDataFile = new File(aDD.path + "/saveData.json");
                        print("ravioli");
                        print(saveDataFile.path + "=>" + eSD.path + "/Download/saveData.json");
                        File downloadsSDF = new File(eSD.path + "/Download/saveData.json");
                        print(new File(eSD.path + "/Download").statSync().modeString());
                        downloadsSDF.openWrite()..write(saveDataFile.readAsStringSync())..close();
                      });
                    });
                  })
                ]);
              },
              onClosing: (){}
            );
          });
        }),
        new AboutListTile(applicationName: "Egg idle game")
      ])),
      appBar: new AppBar(
          // Here we take the value from the MyHomePage object that
          // was created by the App.build method, and use it to set
          // our appbar title.
          title: new Text(widget.title),
          bottom: new TabBar(
              controller: _tabController,
              tabs: [new Tab(text: "Main"), new Tab(text: "Upgrades")])),
      body: new TabBarView(controller: _tabController, children: [
        new ListView(
          children: [
            new Card(
              child: new Row(children: [
                new Column(children: [
                  new Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12.0),
                    child: new Text(
                        "${formatn(saveD.eggs)} egg${(saveD.eggs > 1) ? "s" : ""}"),
                  ),
                  new Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 8.0),
                    child: new Text("x${formatn(saveD.globalMultiplyer)}",
                        style: new TextStyle(fontSize: 9.0)),
                  )
                ]),
                new Column(children: [
                  new Tooltip(
                      message: "upgrade Global Multiplyer",
                      child: new MaterialButton(
                          child: new Text("${formatn(saveD.gmPrice)} eggs"),
                          onPressed: saveD.buyGm))
                ])
              ], mainAxisAlignment: MainAxisAlignment.spaceBetween),
            )
          ]..addAll(new List.generate(saveD.eggGetterFactories.length,
              (x) => saveD.eggGetterFactories[x].asWidget())),
        ),
        //the upgrades screen
        new ListView(
            children: [
          new Card(
            child: new Row(children: [
              new Column(children: [
                new Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12.0),
                  child: new Text(
                      "${formatn(saveD.eggs)} egg${(saveD.eggs > 1) ? "s" : ""}"),
                ),
                new Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8.0),
                  child: new Text("x${formatn(saveD.globalMultiplyer)}",
                      style: new TextStyle(fontSize: 9.0)),
                )
              ]),
              new Column(children: [
                new Tooltip(
                    message: "upgrade Global Multiplyer",
                    child: new MaterialButton(
                        child: new Text("${formatn(saveD.gmPrice)} eggs"),
                        onPressed: saveD.buyGm))
              ])
            ], mainAxisAlignment: MainAxisAlignment.spaceBetween),
          )
        ]..addAll(() {
                List<Widget> toReturn = <Widget>[];
                for (Upgrade x in saveD.buyableUpgrades) {
                  toReturn.add(x.asCard());
                }
                return toReturn;
              }()))
      ]),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.arrow_upward),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
