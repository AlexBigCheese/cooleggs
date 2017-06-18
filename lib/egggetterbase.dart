library lib.egggetterbase.dart;

import 'dart:math';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dson/dson.dart';
import 'numformat.dart';
import 'savedata.dart';
import 'upgrade.dart';
import 'buybank.dart';

part 'egggetterbase.g.dart';

SaveData saveD = new SaveData();

//note to self: keys are fun,
//they let you have 1 key for a rebuilding widget, so UNIVERSE[KEY] => widget usually

GlobalKey scaffoldKey;

void save() {
  getApplicationDocumentsDirectory().then((Directory value) {
    String pathToSaved = value.path + "/saveData.json";
    File saveDFile = new File(pathToSaved);
    String stringToSave;
    try {
      print(saveD.buyableUpgrades.toString());
      stringToSave = toJson(saveD, depth: [
        {"eggGetterFactories": "upgrades"},
        {"buyableUpgrades": "upgradable"},
        {"upgrades": "upgradable"}
      ], exclude: [
        "modifierFunctions"
      ]);
    } on NoSuchMethodError catch (e) {
      print(e.toString());
      print("Stack: ");
      print(e.stackTrace);
    } catch (e) {
      print(e.toString());
    } finally {
      if (stringToSave != null) saveDFile.writeAsStringSync(stringToSave);
    }

    (scaffoldKey.currentState as ScaffoldState)
        .showSnackBar(new SnackBar(content: new Text("Game Saved!")));
  });
}

void load() {
  getApplicationDocumentsDirectory().then((Directory value) {
    String pathToSaved = value.path + "/saveData.json";
    File saveDFile = new File(pathToSaved);
    if (saveDFile.existsSync()) {
      print("WOW the file exists in load");
      try {
        saveD = fromJson(saveDFile.readAsStringSync(), SaveData);
      } catch (e) {
        print(e);
      }
    } else
      saveD = new SaveData();
    assert(saveD != null);
  });
}

void deleteSave() {
  getApplicationDocumentsDirectory().then((Directory value) {
    saveD = new SaveData();
    String pathToSaved = value.path + "/saveData.json";
    File saveDFile = new File(pathToSaved);
    if (saveDFile.existsSync()) {
      saveDFile.deleteSync();
    }
  });
}

dynamic doStateUpdate = (x) {
  x();
};

@serializable
@cyclical
class EggGetterFactory extends _$EggGetterFactorySerializable
    with UpgradableMixin {
  String typeName = "Egg Farm";
  num thisEggs = 1;
  Buyable eggStager = new Buyable(1.0);
  Buyable multiPricer = new Buyable(50.0,1.3);
  @ignore
  List<Upgrade> get priceUpgrades => upgrades.where((x) => x.secondaryType == UpgradeType.PRICE);
  @ignore
  num get multiplyer => pow(1.1, multiPricer.stage);
  @ignore
  num get eggsGet =>
      ((thisEggs != null) ? thisEggs : 0) *
      ((eggStager.stage != null) ? eggStager.stage : 0) *
      multiplyer *
      saveD.globalMultiplyer;
  EggGetterFactory(this.thisEggs,
      {this.typeName: "Egg Farm", this.eggStager, this.multiPricer});
  @ignore
  Card asWidget() {
    Card toReturn = new Card(
        child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          new Column(children: [
            new Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: new Text(
                    "${eggStager.stage} ${(eggStager.stage != 1) ? "${typeName}s" : typeName}",
                    style: new TextStyle(fontSize: 12.0))),
            new Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                child: new Text("${formatn(eggsGet)}/s",
                    style: new TextStyle(fontSize: 8.0))),
            new Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                child: new Text("x${formatn(multiplyer)}",
                    style: new TextStyle(fontSize: 8.0)))
          ]),
          new FlatButton(
              child: const Text('INFO'), onPressed: showBottomSheetBuilding),
          new Column(children: [
            new Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: new Tooltip(
                    message: "buy a $typeName",
                    child: new MaterialButton(
                        onPressed: (){eggStager.buy(saveD,priceUpgrades);},
                        child: new Text("${formatn(eggStager.price(priceUpgrades))} eggs")))),
            new Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: new MaterialButton(
                    onPressed: () {
                      multiPricer.buy(saveD,priceUpgrades);
                    },
                    child: new Text("${formatn(multiPricer.price(priceUpgrades))} eggs")))
          ])
        ]));
    return toReturn;
  }

  showBottomSheetBuilding() {
    showModalBottomSheet(
        context: (scaffoldKey.currentState as ScaffoldState).context,
        builder: (BuildContext suxt) {
          return new BottomSheet(
              builder: (BuildContext sixt) {
                return new ListView(children: [
                  new ListTile(
                      leading: const Icon(Icons.build),
                      title: new Text(typeName)),
                  new Card(
                      child: new Column(children: [
                    const Icon(Icons.public),
                    new ListTile(
                        title: new Text('Overall: ' + formatn(eggsGet) + '/s')),
                    new ListTile(
                        title: new Text('Without GM: ' +
                            formatn(eggsGet / saveD.globalMultiplyer) +
                            '/s')),
                    new ListTile(
                        title: new Text('Individually: ' + formatn(thisEggs)))
                  ])),
                  new Card(
                      child: new Column(children: [
                    new ListTile(
                        title: new Text('Multiplyer Overall: ' +
                            formatn(multiplyer * saveD.globalMultiplyer))),
                    new ListTile(
                        title: new Text(
                            'Multiplyer Self: ' + formatn(multiplyer))),
                    new ListTile(
                        title: new Text(
                            'Multiplyer Stage: ' + formatn(multiPricer.stage)))
                  ]))
                ]);
              },
              onClosing: () {});
        });
  }
}
