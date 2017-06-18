library lib.savedata.dart;

import 'dart:math';
import 'package:dson/dson.dart';
import 'egggetterbase.dart';
import 'upgrade.dart';

part 'savedata.g.dart';

List<EggGetterFactory> eggGetterFactoriesOriginal = <EggGetterFactory>[
    new EggGetterFactory(1, typeName: "Egg Farm"),
    new EggGetterFactory(3,
        typeName: "Egg Mine", thisPrice: 50.0, thisCurve: 1.3,thisMultiPrice: 100.0),
    new EggGetterFactory(5,
        typeName: "Egg Factory",
        thisPrice: 1000.0,
        thisCurve: 1.3,
        thisMultiPrice: 10000.0,
        thisMultiCurve: 1.31)
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
class SaveData extends _$SaveDataSerializable with UpgradableMixin {
  List<EggGetterFactory> eggGetterFactories = eggGetterFactoriesOriginal;
  List<Upgrade> buyableUpgrades = buyableUpgradesOriginal;
  double eggs = 0.0;
  @ignore
  double get globalMultiplyer => pow(gmCurve, gmStage - 1);
  num gmPriceBase = 1000.00;
  num gmPriceCurve = 1.3;
  int gmStage = 1;
  num gmCurve = 1.07;
  @ignore
  num get gmPrice => gmPriceBase * pow(gmPriceCurve, gmStage - 1);
  @ignore
  num get clickIncrease => globalMultiplyer;
  EggGetterFactory building(String name) => eggGetterFactories.firstWhere((x) => x.typeName == name);
  buyGm() {
    if (eggs >= gmPrice) {
      //shh
      doStateUpdate(() {
        eggs -= gmPrice;
        gmStage++;
      });
    }
  }
  SaveData() {
    assert(buyableUpgrades.isNotEmpty);
  }
}
