// GENERATED CODE - DO NOT MODIFY BY HAND

part of lib.savedata.dart;

// **************************************************************************
// Generator: DsonGenerator
// Target: class SaveData
// **************************************************************************

abstract class _$SaveDataSerializable extends SerializableMap {
  List<EggGetterFactory> get eggGetterFactories;
  List<Upgrade> get buyableUpgrades;
  num get eggs;
  Buyable get gmStager;
  num get gmCurve;
  double get globalMultiplyer;
  num get gmStage;
  num get clickIncrease;
  List<Upgrade> get upgrades;
  void set eggGetterFactories(List<EggGetterFactory> v);
  void set buyableUpgrades(List<Upgrade> v);
  void set eggs(num v);
  void set gmStager(Buyable v);
  void set gmCurve(num v);
  void set upgrades(List<Upgrade> v);
  EggGetterFactory building(String name);

  operator [](Object key) {
    switch (key) {
      case 'eggGetterFactories':
        return eggGetterFactories;
      case 'buyableUpgrades':
        return buyableUpgrades;
      case 'eggs':
        return eggs;
      case 'gmStager':
        return gmStager;
      case 'gmCurve':
        return gmCurve;
      case 'globalMultiplyer':
        return globalMultiplyer;
      case 'gmStage':
        return gmStage;
      case 'clickIncrease':
        return clickIncrease;
      case 'upgrades':
        return upgrades;
      case 'building':
        return building;
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
      case 'gmStager':
        gmStager = value;
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

  Iterable<String> get keys => SaveDataClassMirror.fields.keys;
}

_SaveData__Constructor(params) => new SaveData();

const $$SaveData_fields_eggGetterFactories =
    const DeclarationMirror(type: const [List, EggGetterFactory]);
const $$SaveData_fields_buyableUpgrades =
    const DeclarationMirror(type: const [List, Upgrade]);
const $$SaveData_fields_eggs = const DeclarationMirror(type: num);
const $$SaveData_fields_gmStager = const DeclarationMirror(type: Buyable);
const $$SaveData_fields_gmCurve = const DeclarationMirror(type: num);
const $$SaveData_fields_globalMultiplyer =
    const DeclarationMirror(type: double, isFinal: true);
const $$SaveData_fields_gmStage =
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
  'gmStager': $$SaveData_fields_gmStager,
  'gmCurve': $$SaveData_fields_gmCurve,
  'globalMultiplyer': $$SaveData_fields_globalMultiplyer,
  'gmStage': $$SaveData_fields_gmStage,
  'clickIncrease': $$SaveData_fields_clickIncrease,
  'upgrades': $$UpgradableMixin_fields_upgrades
}, getters: const [
  'eggGetterFactories',
  'buyableUpgrades',
  'eggs',
  'gmStager',
  'gmCurve',
  'globalMultiplyer',
  'gmStage',
  'clickIncrease',
  'upgrades'
], setters: const [
  'eggGetterFactories',
  'buyableUpgrades',
  'eggs',
  'gmStager',
  'gmCurve',
  'upgrades'
], methods: const {
  'building': const FunctionMirror(
    name: 'building',
    returnType: EggGetterFactory,
    parameters: const {'name': const DeclarationMirror(type: String)},
  )
}, superinterfaces: const [
  Bank
]);
