// GENERATED CODE - DO NOT MODIFY BY HAND

part of lib.upgrade.dart;

// **************************************************************************
// Generator: DsonGenerator
// Target: class UpgradeType
// **************************************************************************

abstract class _$UpgradeTypeSerializable extends SerializableMap {
  int get index;

  operator [](Object key) {
    switch (key) {
      case 'index':
        return index;
    }
    throwFieldNotFoundException(key, 'UpgradeType');
  }

  operator []=(Object key, value) {
    switch (key) {
    }
    throwFieldNotFoundException(key, 'UpgradeType');
  }

  Iterable<String> get keys => UpgradeTypeClassMirror.fields.keys;
}

const UpgradeTypeClassMirror = const ClassMirror(
    name: 'UpgradeType', isEnum: true, values: UpgradeType.values);

// **************************************************************************
// Generator: DsonGenerator
// Target: class Upgrade
// **************************************************************************

abstract class _$UpgradeSerializable extends SerializableMap {
  num get price;
  String get name;
  String get description;
  UpgradeType get type;
  UpgradeType get secondaryType;
  UpgradableMixin get upgradable;
  FunctionProxy get modifyValue;
  dynamic get bought;
  void set price(num v);
  void set name(String v);
  void set description(String v);
  void set type(UpgradeType v);
  void set secondaryType(UpgradeType v);
  void set upgradable(UpgradableMixin v);
  void set bought(dynamic v);
  dynamic buyUpgrade();
  Card asCard();
  String toString();

  operator [](Object key) {
    switch (key) {
      case 'price':
        return price;
      case 'name':
        return name;
      case 'description':
        return description;
      case 'type':
        return type;
      case 'secondaryType':
        return secondaryType;
      case 'upgradable':
        return upgradable;
      case 'modifyValue':
        return modifyValue;
      case 'bought':
        return bought;
      case 'buyUpgrade':
        return buyUpgrade;
      case 'asCard':
        return asCard;
      case 'toString':
        return toString;
    }
    throwFieldNotFoundException(key, 'Upgrade');
  }

  operator []=(Object key, value) {
    switch (key) {
      case 'price':
        price = value;
        return;
      case 'name':
        name = value;
        return;
      case 'description':
        description = value;
        return;
      case 'type':
        type = value;
        return;
      case 'secondaryType':
        secondaryType = value;
        return;
      case 'upgradable':
        upgradable = value;
        return;
      case 'bought':
        bought = value;
        return;
    }
    throwFieldNotFoundException(key, 'Upgrade');
  }

  Iterable<String> get keys => UpgradeClassMirror.fields.keys;
}

_Upgrade__Constructor(params) => new Upgrade(params['price'],
    name: params['name'],
    description: params['description'],
    type: params['type'],
    secondaryType: params['secondaryType'],
    upgradable: params['upgradable'],
    modifyValue: params['modifyValue']);

const $$Upgrade_fields_price = const DeclarationMirror(type: num);
const $$Upgrade_fields_name = const DeclarationMirror(type: String);
const $$Upgrade_fields_description = const DeclarationMirror(type: String);
const $$Upgrade_fields_type = const DeclarationMirror(type: UpgradeType);
const $$Upgrade_fields_secondaryType =
    const DeclarationMirror(type: UpgradeType);
const $$Upgrade_fields_upgradable =
    const DeclarationMirror(type: UpgradableMixin);
const $$Upgrade_fields_modifyValue =
    const DeclarationMirror(type: FunctionProxy, isFinal: true);
const $$Upgrade_fields_bought = const DeclarationMirror(type: dynamic);

const UpgradeClassMirror =
    const ClassMirror(name: 'Upgrade', constructors: const {
  '': const FunctionMirror(parameters: const {
    'price': const DeclarationMirror(type: num),
    'name': const DeclarationMirror(type: String, isOptional: true),
    'description': const DeclarationMirror(type: String, isOptional: true),
    'type': const DeclarationMirror(type: UpgradeType, isOptional: true),
    'secondaryType':
        const DeclarationMirror(type: UpgradeType, isOptional: true),
    'upgradable':
        const DeclarationMirror(type: UpgradableMixin, isOptional: true),
    'modifyValue':
        const DeclarationMirror(type: FunctionProxy, isOptional: true)
  }, call: _Upgrade__Constructor)
}, annotations: const [
  cyclical
], fields: const {
  'price': $$Upgrade_fields_price,
  'name': $$Upgrade_fields_name,
  'description': $$Upgrade_fields_description,
  'type': $$Upgrade_fields_type,
  'secondaryType': $$Upgrade_fields_secondaryType,
  'upgradable': $$Upgrade_fields_upgradable,
  'modifyValue': $$Upgrade_fields_modifyValue,
  'bought': $$Upgrade_fields_bought
}, getters: const [
  'price',
  'name',
  'description',
  'type',
  'secondaryType',
  'upgradable',
  'modifyValue',
  'bought'
], setters: const [
  'price',
  'name',
  'description',
  'type',
  'secondaryType',
  'upgradable',
  'bought'
], methods: const {
  'buyUpgrade': const FunctionMirror(
    name: 'buyUpgrade',
    returnType: dynamic,
  ),
  'asCard': const FunctionMirror(
    name: 'asCard',
    returnType: Card,
  ),
  'toString': const FunctionMirror(
    name: 'toString',
    returnType: String,
  )
});

// **************************************************************************
// Generator: DsonGenerator
// Target: class UpgradableMixin
// **************************************************************************

abstract class _$UpgradableMixinSerializable extends SerializableMap {
  List<Upgrade> get upgrades;
  void set upgrades(List<Upgrade> v);

  operator [](Object key) {
    switch (key) {
      case 'upgrades':
        return upgrades;
    }
    throwFieldNotFoundException(key, 'UpgradableMixin');
  }

  operator []=(Object key, value) {
    switch (key) {
      case 'upgrades':
        upgrades = value;
        return;
    }
    throwFieldNotFoundException(key, 'UpgradableMixin');
  }

  Iterable<String> get keys => UpgradableMixinClassMirror.fields.keys;
}

_UpgradableMixin__Constructor(params) => new UpgradableMixin();

const $$UpgradableMixin_fields_upgrades =
    const DeclarationMirror(type: const [List, Upgrade]);

const UpgradableMixinClassMirror =
    const ClassMirror(name: 'UpgradableMixin', constructors: const {
  '': const FunctionMirror(
      parameters: const {}, call: _UpgradableMixin__Constructor)
}, annotations: const [
  cyclical
], fields: const {
  'upgrades': $$UpgradableMixin_fields_upgrades
}, getters: const [
  'upgrades'
], setters: const [
  'upgrades'
]);

// **************************************************************************
// Generator: DsonGenerator
// Target: class FunctionProxy
// **************************************************************************

abstract class _$FunctionProxySerializable extends SerializableMap {
  int get numId;
  void set numId(int v);
  dynamic noSuchMethod(Invocation x);

  operator [](Object key) {
    switch (key) {
      case 'numId':
        return numId;
      case 'noSuchMethod':
        return noSuchMethod;
    }
    throwFieldNotFoundException(key, 'FunctionProxy');
  }

  operator []=(Object key, value) {
    switch (key) {
      case 'numId':
        numId = value;
        return;
    }
    throwFieldNotFoundException(key, 'FunctionProxy');
  }

  Iterable<String> get keys => FunctionProxyClassMirror.fields.keys;
}

_FunctionProxy__Constructor(params) => new FunctionProxy(params['numId']);

const $$FunctionProxy_fields_numId = const DeclarationMirror(type: int);

const FunctionProxyClassMirror =
    const ClassMirror(name: 'FunctionProxy', constructors: const {
  '': const FunctionMirror(
      parameters: const {'numId': const DeclarationMirror(type: int)},
      call: _FunctionProxy__Constructor)
}, fields: const {
  'numId': $$FunctionProxy_fields_numId
}, getters: const [
  'numId'
], setters: const [
  'numId'
], methods: const {
  'noSuchMethod': const FunctionMirror(
    name: 'noSuchMethod',
    returnType: dynamic,
    parameters: const {'x': const DeclarationMirror(type: Invocation)},
  )
});
