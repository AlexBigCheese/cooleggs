library lib.egggetterbase.dart;

import 'dart:math';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dson/dson.dart';
import 'numformat.dart';
import 'savedata.dart';
import 'upgrade.dart';

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
      stringToSave = toJson(saveD, depth: [{"buyableUpgrades":"upgradable"},{"upgrades": "upgradable"}], exclude: ["modifierFunctions"]);
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
  num thisPrice = 1.0;
  num thisCurve = 1.07;
  num thisMultiPrice = 50;
  num thisMultiCurve = 1.3;
  num thisMultiStage = 0;
  int thisAmmount = 0;
  @ignore
  num get price => ((num inputPrice) {
        for (Upgrade x in upgrades
            .where((Upgrade x) => x.secondaryType == UpgradeType.PRICE)) {
          inputPrice = x.modifyValue.call(inputPrice);
        }
        return inputPrice;
      }(thisPrice * pow(((thisCurve != null) ? thisCurve : 0), ((thisAmmount != null) ? thisAmmount : 0))));
  @ignore
  num get multiplyer => pow(1.1, thisMultiStage);
  @ignore
  num get multiprice => ((num inputPrice) {
        for (Upgrade x in upgrades
            .where((Upgrade x) => x.secondaryType == UpgradeType.PRICE)) {
          inputPrice = x.modifyValue.call(inputPrice);
        }
        return inputPrice;
      }(thisMultiPrice * pow(((thisMultiCurve != null) ? thisMultiCurve : 0), ((thisMultiStage != null) ? thisMultiStage : 0))));
  @ignore
  num get eggsGet =>
      ((thisEggs != null) ? thisEggs : 0) * ((thisAmmount != null) ? thisAmmount : 0) * multiplyer * saveD.globalMultiplyer;
  EggGetterFactory(this.thisEggs,
      {this.typeName: "Egg Farm",
      this.thisCurve: 1.12,
      this.thisPrice: 1.0,
      this.thisMultiPrice: 50,
      this.thisMultiCurve: 1.3}) : assert(thisEggs != null);
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
                    "$thisAmmount ${(thisAmmount != 1) ? "${typeName}s" : typeName}",
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
                        onPressed: () {
                          if (saveD.eggs >= price) {
                            doStateUpdate(() {
                              saveD.eggs -= price;
                            });
                            thisAmmount += 1;
                          }
                        },
                        child: new Text("${formatn(price)} eggs")))),
            new Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: new MaterialButton(
                    onPressed: () {
                      if (saveD.eggs >= multiprice) {
                        doStateUpdate(() {
                          saveD.eggs -= multiprice;
                        });
                        thisMultiStage += 1;
                      }
                    },
                    child: new Text("${formatn(multiprice)} eggs")))
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
                            'Multiplyer Stage: ' + formatn(thisMultiStage)))
                  ]))
                ]);
              },
              onClosing: () {});
        });
  }
}
