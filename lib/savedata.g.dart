// GENERATED CODE - DO NOT MODIFY BY HAND

part of lib.savedata.dart;

// **************************************************************************
// Generator: DsonGenerator
// Target: class SaveData
// **************************************************************************

abstract class _$SaveDataSerializable extends SerializableMap {
  List<EggGetterFactory> get eggGetterFactories;
  List<Upgrade> get buyableUpgrades;
  double get eggs;
  num get gmPriceBase;
  num get gmPriceCurve;
  int get gmStage;
  num get gmCurve;
  double get globalMultiplyer;
  num get gmPrice;
  num get clickIncrease;
  List<Upgrade> get upgrades;
  void set eggGetterFactories(List<EggGetterFactory> v);
  void set buyableUpgrades(List<Upgrade> v);
  void set eggs(double v);
  void set gmPriceBase(num v);
  void set gmPriceCurve(num v);
  void set gmStage(int v);
  void set gmCurve(num v);
  void set upgrades(List<Upgrade> v);
  EggGetterFactory building(String name);
  dynamic buyGm();

  operator [](Object key) {
    switch (key) {
      case 'eggGetterFactories':
        return eggGetterFactories;
      case 'buyableUpgrades':
        return buyableUpgrades;
      case 'eggs':
        return eggs;
      case 'gmPriceBase':
        return gmPriceBase;
      case 'gmPriceCurve':
        return gmPriceCurve;
      case 'gmStage':
        return gmStage;
      case 'gmCurve':
        return gmCurve;
      case 'globalMultiplyer':
        return globalMultiplyer;
      case 'gmPrice':
        return gmPrice;
      case 'clickIncrease':
        return clickIncrease;
      case 'upgrades':
        return upgrades;
      case 'building':
        return building;
      case 'buyGm':
        return buyGm;
    }
    throwFieldNotFoundException(key, 'SaveData');
  }

  operator []=(Object key, value) {
    switch (key) {
      case 'eggGetterFactories':
        eggGetterFactories = value;
        return;
      case 'buyableUpgrades':
        buyableUpgrades = value;
        return;
      case 'eggs':
        eggs = value;
        return;
      case 'gmPriceBase':
        gmPriceBase = value;
        return;
      case 'gmPriceCurve':
        gmPriceCurve = value;
        return;
      case 'gmStage':
        gmStage = value;
        return;
      case 'gmCurve':
        gmCurve = value;
        return;
      case 'upgrades':
        upgrades = value;
        return;
    }
    throwFieldNotFoundException(key, 'SaveData');
  }

  get keys => SaveDataClassMirror.fields.keys;
}

_SaveData__Constructor(params) => new SaveData();

const $$SaveData_fields_eggGetterFactories =
    const DeclarationMirror(type: const [List, EggGetterFactory]);
const $$SaveData_fields_buyableUpgrades =
    const DeclarationMirror(type: const [List, Upgrade]);
const $$SaveData_fields_eggs = const DeclarationMirror(type: double);
const $$SaveData_fields_gmPriceBase = const DeclarationMirror(type: num);
const $$SaveData_fields_gmPriceCurve = const DeclarationMirror(type: num);
const $$SaveData_fields_gmStage = const DeclarationMirror(type: int);
const $$SaveData_fields_gmCurve = const DeclarationMirror(type: num);
const $$SaveData_fields_globalMultiplyer =
    const DeclarationMirror(type: double, isFinal: true);
const $$SaveData_fields_gmPrice =
    const DeclarationMirror(type: num, isFinal: true);
const $$SaveData_fields_clickIncrease =
    const DeclarationMirror(type: num, isFinal: true);

const SaveDataClassMirror =
    const ClassMirror(name: 'SaveData', constructors: const {
  '': const FunctionMirror(parameters: const {}, call: _SaveData__Constructor)
}, fields: const {
  'eggGetterFactories': $$SaveData_fields_eggGetterFactories,
  'buyableUpgrades': $$SaveData_fields_buyableUpgrades,
  'eggs': $$SaveData_fields_eggs,
  'gmPriceBase': $$SaveData_fields_gmPriceBase,
  'gmPriceCurve': $$SaveData_fields_gmPriceCurve,
  'gmStage': $$SaveData_fields_gmStage,
  'gmCurve': $$SaveData_fields_gmCurve,
  'globalMultiplyer': $$SaveData_fields_globalMultiplyer,
  'gmPrice': $$SaveData_fields_gmPrice,
  'clickIncrease': $$SaveData_fields_clickIncrease,
  'upgrades': $$UpgradableMixin_fields_upgrades
}, getters: const [
  'eggGetterFactories',
  'buyableUpgrades',
  'eggs',
  'gmPriceBase',
  'gmPriceCurve',
  'gmStage',
  'gmCurve',
  'globalMultiplyer',
  'gmPrice',
  'clickIncrease',
  'upgrades'
], setters: const [
  'eggGetterFactories',
  'buyableUpgrades',
  'eggs',
  'gmPriceBase',
  'gmPriceCurve',
  'gmStage',
  'gmCurve',
  'upgrades'
], methods: const {
  'building': const FunctionMirror(
    name: 'building',
    returnType: EggGetterFactory,
    parameters: const {'name': const DeclarationMirror(type: String)},
  ),
  'buyGm': const FunctionMirror(
    name: 'buyGm',
    returnType: dynamic,
  )
});
