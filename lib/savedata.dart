library lib.savedata.dart;

import 'dart:math';
import 'package:dson/dson.dart';
import 'egggetterbase.dart';
import 'upgrade.dart';
import 'buybank.dart';

part 'savedata.g.dart';

List<EggGetterFactory> eggGetterFactoriesOriginal = <EggGetterFactory>[
    new EggGetterFactory(1, typeName: "Egg Farm"),
    new EggGetterFactory(3,
        typeName: "Egg Mine", eggStager: new Buyable(50.0,1.3), multiPricer: new Buyable(100.0,1.3)),
    new EggGetterFactory(5,
        typeName: "Egg Factory",
        eggStager: new Buyable(1000.0,1.3),
        multiPricer: new Buyable(10000.0,1.31))
  ];
List<Upgrade> buyableUpgradesOriginal = <Upgrade>[
    new Upgrade(1000.00,
      name: "Lower price: Egg farm",
      description: "Egg farm price * 0.90 = new Price",
      upgradable: eggGetterFactoriesOriginal[0],
      type: UpgradeType.BUILDING,
      secondaryType: UpgradeType.PRICE,
      modifyValue: new FunctionProxy(0)
    )
  ];
@serializable
class SaveData extends _$SaveDataSerializable with UpgradableMixin implements Bank {
  List<EggGetterFactory> eggGetterFactories = eggGetterFactoriesOriginal;
  List<Upgrade> buyableUpgrades = buyableUpgradesOriginal;
  num eggs = 0.0;
  @ignore
  double get globalMultiplyer => pow(gmCurve, gmStager.stage);
  Buyable gmStager = new Buyable(1000.0, 1.3);//1k 1.3
  num gmCurve = 1.07;
  @ignore
  num get gmStage => gmStager.stage + 1;
  @ignore
  num get clickIncrease => globalMultiplyer;
  EggGetterFactory building(String name) => eggGetterFactories.firstWhere((x) => x.typeName == name);
  SaveData() {
    assert(buyableUpgrades.isNotEmpty);
  }
}
