library lib.buybank.dart;

import 'dart:math';
import 'package:dson/dson.dart';
import 'upgrade.dart';
import 'egggetterbase.dart';

part 'buybank.g.dart';

@serializable
class Bank extends _$BankSerializable {
  num eggs = 0.0;
}

@serializable
class Buyable extends _$BuyableSerializable {
  num basePrice = 1.0;
  num priceCurve = 1.1;
  int stage = 0;
  int maxStage;
  num price([List<Upgrade> upgrades]) {
    num normalPrice = basePrice * pow(priceCurve, stage);
    num newPrice = normalPrice;
    if (upgrades != null) {
      for (Upgrade x in upgrades) {
        newPrice = x.modifyValue.call(newPrice);
      }
    }
    return newPrice;
  }
  void buy(Bank bank,[List<Upgrade> upgrades]) {
    if (maxStage != null) {
      if (stage > maxStage) return;
    }
    if (bank.eggs >= price(upgrades)) {
      doStateUpdate((){bank.eggs -= price(upgrades);stage++;});
    }
  }

  Buyable(this.basePrice,[this.priceCurve = 1.08,this.maxStage]);
}