// GENERATED CODE - DO NOT MODIFY BY HAND

part of lib.egggetterbase.dart;

// **************************************************************************
// Generator: DsonGenerator
// Target: class EggGetterFactory
// **************************************************************************

abstract class _$EggGetterFactorySerializable extends SerializableMap {
  String get typeName;
  num get thisEggs;
  Buyable get eggStager;
  Buyable get multiPricer;
  List<Upgrade> get priceUpgrades;
  num get multiplyer;
  num get eggsGet;
  List<Upgrade> get upgrades;
  void set typeName(String v);
  void set thisEggs(num v);
  void set eggStager(Buyable v);
  void set multiPricer(Buyable v);
  void set upgrades(List<Upgrade> v);
  Card asWidget();
  dynamic showBottomSheetBuilding();

  operator [](Object key) {
    switch (key) {
      case 'typeName':
        return typeName;
      case 'thisEggs':
        return thisEggs;
      case 'eggStager':
        return eggStager;
      case 'multiPricer':
        return multiPricer;
      case 'priceUpgrades':
        return priceUpgrades;
      case 'multiplyer':
        return multiplyer;
      case 'eggsGet':
        return eggsGet;
      case 'upgrades':
        return upgrades;
      case 'asWidget':
        return asWidget;
      case 'showBottomSheetBuilding':
        return showBottomSheetBuilding;
    }
    throwFieldNotFoundException(key, 'EggGetterFactory');
  }

  operator []=(Object key, value) {
    switch (key) {
      case 'typeName':
        typeName = value;
        return;
      case 'thisEggs':
        thisEggs = value;
        return;
      case 'eggStager':
        eggStager = value;
        return;
      case 'multiPricer':
        multiPricer = value;
        return;
      case 'upgrades':
        upgrades = value;
        return;
    }
    throwFieldNotFoundException(key, 'EggGetterFactory');
  }

  Iterable<String> get keys => EggGetterFactoryClassMirror.fields.keys;
}

_EggGetterFactory__Constructor(params) =>
    new EggGetterFactory(params['thisEggs'],
        typeName: params['typeName'],
        eggStager: params['eggStager'],
        multiPricer: params['multiPricer']);

const $$EggGetterFactory_fields_typeName =
    const DeclarationMirror(type: String);
const $$EggGetterFactory_fields_thisEggs = const DeclarationMirror(type: num);
const $$EggGetterFactory_fields_eggStager =
    const DeclarationMirror(type: Buyable);
const $$EggGetterFactory_fields_multiPricer =
    const DeclarationMirror(type: Buyable);
const $$EggGetterFactory_fields_priceUpgrades =
    const DeclarationMirror(type: const [List, Upgrade], isFinal: true);
const $$EggGetterFactory_fields_multiplyer =
    const DeclarationMirror(type: num, isFinal: true);
const $$EggGetterFactory_fields_eggsGet =
    const DeclarationMirror(type: num, isFinal: true);

const EggGetterFactoryClassMirror =
    const ClassMirror(name: 'EggGetterFactory', constructors: const {
  '': const FunctionMirror(parameters: const {
    'thisEggs': const DeclarationMirror(type: num),
    'typeName': const DeclarationMirror(type: String, isOptional: true),
    'eggStager': const DeclarationMirror(type: Buyable, isOptional: true),
    'multiPricer': const DeclarationMirror(type: Buyable, isOptional: true)
  }, call: _EggGetterFactory__Constructor)
}, annotations: const [
  cyclical
], fields: const {
  'typeName': $$EggGetterFactory_fields_typeName,
  'thisEggs': $$EggGetterFactory_fields_thisEggs,
  'eggStager': $$EggGetterFactory_fields_eggStager,
  'multiPricer': $$EggGetterFactory_fields_multiPricer,
  'priceUpgrades': $$EggGetterFactory_fields_priceUpgrades,
  'multiplyer': $$EggGetterFactory_fields_multiplyer,
  'eggsGet': $$EggGetterFactory_fields_eggsGet,
  'upgrades': $$UpgradableMixin_fields_upgrades
}, getters: const [
  'typeName',
  'thisEggs',
  'eggStager',
  'multiPricer',
  'priceUpgrades',
  'multiplyer',
  'eggsGet',
  'upgrades'
], setters: const [
  'typeName',
  'thisEggs',
  'eggStager',
  'multiPricer',
  'upgrades'
], methods: const {
  'asWidget': const FunctionMirror(
      name: 'asWidget', returnType: Card, annotations: const [ignore]),
  'showBottomSheetBuilding': const FunctionMirror(
    name: 'showBottomSheetBuilding',
    returnType: dynamic,
  )
});
