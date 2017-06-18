library lib.upgrade.dart;

import 'package:flutter/material.dart';
import 'package:dson/dson.dart';
import 'egggetterbase.dart';
import 'numformat.dart';

part 'upgrade.g.dart';

@serializable
enum UpgradeType { CLICK, BUILDING, PRICE }

@serializable
@cyclical
class Upgrade extends _$UpgradeSerializable {
  num price = 100.0;
  String name;
  String description;
  UpgradeType type;
  UpgradeType secondaryType;
  UpgradableMixin upgradable;
  final FunctionProxy modifyValue;
  dynamic bought = false;
  //for click, (input) => toadd
  //for building, if price, input price,
  Upgrade(this.price,
      {this.name,
      this.description,
      this.type,
      this.secondaryType,
      this.upgradable,
      this.modifyValue});
  buyUpgrade() {
    if (saveD.eggs >= price) {
      doStateUpdate(() {
        saveD.eggs -= price;
        upgradable.upgrades.add(this);
        bought = true;
      });
    }
  }

  Card asCard() {
    return new Card(
        child: new Column(children: [
      (name != null) ? new Center(child: new Text(name, style: new TextStyle(fontSize: 20.0))) : null,
      (description != null) ? new Center(
          child: new Text(description, style: new TextStyle(fontSize: 10.0))) : null,
      new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        new Row(children: [new Text(formatn(price))]),
        new Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          new FlatButton(
              onPressed: bought ? null : buyUpgrade, child: new Text("Buy"))
        ])
      ])
    ]..removeWhere((x) => x == null)));
  }

  String toString() {
    return name + ":\n" + description + "\n" + formatn(price);
  }
}

@serializable
@cyclical
class UpgradableMixin extends _$UpgradableMixinSerializable {
  List<Upgrade> upgrades = [];
}

class FunctionProxyBoi {
  static List<Function> modifyerFunctions = <Function>[];
}

@serializable
@proxy
class FunctionProxy extends _$FunctionProxySerializable {
  int numId;
  noSuchMethod(Invocation x) {
    if (x.isMethod) {
      return Function.apply(FunctionProxyBoi.modifyerFunctions[numId],x.positionalArguments);
    }
  }
  FunctionProxy(this.numId);
}
