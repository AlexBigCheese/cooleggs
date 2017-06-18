// GENERATED CODE - DO NOT MODIFY BY HAND

part of lib.buybank.dart;


// **************************************************************************
// Generator: DsonGenerator
// Target: class Bank
// **************************************************************************

abstract class _$BankSerializable extends SerializableMap {
  
  num get eggs;
  void set eggs(num v);
  

  operator [](Object key) {
    switch(key) {
      case 'eggs': return eggs;
      
    }
    throwFieldNotFoundException(key, 'Bank');
  }

  operator []=(Object key, value) {
    switch(key) {
      case 'eggs': eggs = value; return;
    }
    throwFieldNotFoundException(key, 'Bank');
  }

  Iterable<String> get keys => BankClassMirror.fields.keys;
}_Bank__Constructor(params) =>new Bank();


const $$Bank_fields_eggs = const DeclarationMirror(type: num );

const BankClassMirror = const ClassMirror(
  name: 'Bank',
  constructors: const {
          '': const FunctionMirror(parameters: const {},call: _Bank__Constructor)
          },fields: const {'eggs': $$Bank_fields_eggs},getters: const ['eggs'],setters: const ['eggs']
);

// **************************************************************************
// Generator: DsonGenerator
// Target: class Buyable
// **************************************************************************

abstract class _$BuyableSerializable extends SerializableMap {
  
  num get basePrice;
num get priceCurve;
int get stage;
int get maxStage;
  void set basePrice(num v);
void set priceCurve(num v);
void set stage(int v);
void set maxStage(int v);
  num price(List<Upgrade> upgrades);
void buy(Bank bank,List<Upgrade> upgrades);

  operator [](Object key) {
    switch(key) {
      case 'basePrice': return basePrice;
case 'priceCurve': return priceCurve;
case 'stage': return stage;
case 'maxStage': return maxStage;
      case 'price': return price;
case 'buy': return buy;
    }
    throwFieldNotFoundException(key, 'Buyable');
  }

  operator []=(Object key, value) {
    switch(key) {
      case 'basePrice': basePrice = value; return;
case 'priceCurve': priceCurve = value; return;
case 'stage': stage = value; return;
case 'maxStage': maxStage = value; return;
    }
    throwFieldNotFoundException(key, 'Buyable');
  }

  Iterable<String> get keys => BuyableClassMirror.fields.keys;
}_Buyable__Constructor(params) =>new Buyable(params['basePrice'],params['priceCurve'],params['maxStage']);


const $$Buyable_fields_basePrice = const DeclarationMirror(type: num );
const $$Buyable_fields_priceCurve = const DeclarationMirror(type: num );
const $$Buyable_fields_stage = const DeclarationMirror(type: int );
const $$Buyable_fields_maxStage = const DeclarationMirror(type: int );

const BuyableClassMirror = const ClassMirror(
  name: 'Buyable',
  constructors: const {
          '': const FunctionMirror(parameters: const {'basePrice': const DeclarationMirror(type: num ),'priceCurve': const DeclarationMirror(type: num, isOptional: true ),'maxStage': const DeclarationMirror(type: int, isOptional: true )},call: _Buyable__Constructor)
          },fields: const {'basePrice': $$Buyable_fields_basePrice,'priceCurve': $$Buyable_fields_priceCurve,'stage': $$Buyable_fields_stage,'maxStage': $$Buyable_fields_maxStage},getters: const ['basePrice','priceCurve','stage','maxStage'],setters: const ['basePrice','priceCurve','stage','maxStage'],methods: const {'price': const FunctionMirror(name: 'price',returnType: num, parameters: const {'upgrades': const DeclarationMirror(type: const [List, Upgrade], isOptional: true )},),'buy': const FunctionMirror(name: 'buy',returnType: void, parameters: const {'bank': const DeclarationMirror(type: Bank ),'upgrades': const DeclarationMirror(type: const [List, Upgrade], isOptional: true )},)}
);
