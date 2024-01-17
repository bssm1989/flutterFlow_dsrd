import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _username = prefs.getString('ff_username') ?? _username;
    });
    _safeInit(() {
      _userid = prefs.getString('ff_userid') ?? _userid;
    });
    _safeInit(() {
      _constreg = prefs
              .getStringList('ff_constreg')
              ?.map((x) {
                try {
                  return ConstRegStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _constreg;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_personAdd')) {
        try {
          final serializedData = prefs.getString('ff_personAdd') ?? '{}';
          _personAdd =
              PageAddStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _statuAddPageOfPerson =
          prefs.getString('ff_statuAddPageOfPerson') ?? _statuAddPageOfPerson;
    });
    _safeInit(() {
      _personAdd2 = prefs
              .getStringList('ff_personAdd2')
              ?.map((x) {
                try {
                  return PageAddStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _personAdd2;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _username = '';
  String get username => _username;
  set username(String value) {
    _username = value;
    prefs.setString('ff_username', value);
  }

  String _userid = '';
  String get userid => _userid;
  set userid(String value) {
    _userid = value;
    prefs.setString('ff_userid', value);
  }

  List<EmployeeStruct> _employeelist = [
    EmployeeStruct.fromSerializableMap(jsonDecode(
        '{"fullname":"Hello Worldhhh","phone":"0","address":"Hello Worldhhh"}')),
    EmployeeStruct.fromSerializableMap(jsonDecode(
        '{"fullname":"Hello World","phone":"0","address":"Hello Worldhhhh"}')),
    EmployeeStruct.fromSerializableMap(jsonDecode(
        '{"fullname":"Hello World","phone":"0","address":"Hello World"}')),
    EmployeeStruct.fromSerializableMap(jsonDecode(
        '{"fullname":"Hello World","phone":"0","address":"Hello World"}'))
  ];
  List<EmployeeStruct> get employeelist => _employeelist;
  set employeelist(List<EmployeeStruct> value) {
    _employeelist = value;
  }

  void addToEmployeelist(EmployeeStruct value) {
    _employeelist.add(value);
  }

  void removeFromEmployeelist(EmployeeStruct value) {
    _employeelist.remove(value);
  }

  void removeAtIndexFromEmployeelist(int index) {
    _employeelist.removeAt(index);
  }

  void updateEmployeelistAtIndex(
    int index,
    EmployeeStruct Function(EmployeeStruct) updateFn,
  ) {
    _employeelist[index] = updateFn(_employeelist[index]);
  }

  void insertAtIndexInEmployeelist(int index, EmployeeStruct value) {
    _employeelist.insert(index, value);
  }

  List<ConstRegStruct> _constreg = [];
  List<ConstRegStruct> get constreg => _constreg;
  set constreg(List<ConstRegStruct> value) {
    _constreg = value;
    prefs.setStringList(
        'ff_constreg', value.map((x) => x.serialize()).toList());
  }

  void addToConstreg(ConstRegStruct value) {
    _constreg.add(value);
    prefs.setStringList(
        'ff_constreg', _constreg.map((x) => x.serialize()).toList());
  }

  void removeFromConstreg(ConstRegStruct value) {
    _constreg.remove(value);
    prefs.setStringList(
        'ff_constreg', _constreg.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromConstreg(int index) {
    _constreg.removeAt(index);
    prefs.setStringList(
        'ff_constreg', _constreg.map((x) => x.serialize()).toList());
  }

  void updateConstregAtIndex(
    int index,
    ConstRegStruct Function(ConstRegStruct) updateFn,
  ) {
    _constreg[index] = updateFn(_constreg[index]);
    prefs.setStringList(
        'ff_constreg', _constreg.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInConstreg(int index, ConstRegStruct value) {
    _constreg.insert(index, value);
    prefs.setStringList(
        'ff_constreg', _constreg.map((x) => x.serialize()).toList());
  }

  String _idPersonToAddPager = '';
  String get idPersonToAddPager => _idPersonToAddPager;
  set idPersonToAddPager(String value) {
    _idPersonToAddPager = value;
  }

  PageAddStruct _personAdd =
      PageAddStruct.fromSerializableMap(jsonDecode('{}'));
  PageAddStruct get personAdd => _personAdd;
  set personAdd(PageAddStruct value) {
    _personAdd = value;
    prefs.setString('ff_personAdd', value.serialize());
  }

  void updatePersonAddStruct(Function(PageAddStruct) updateFn) {
    updateFn(_personAdd);
    prefs.setString('ff_personAdd', _personAdd.serialize());
  }

  String _statuAddPageOfPerson = '';
  String get statuAddPageOfPerson => _statuAddPageOfPerson;
  set statuAddPageOfPerson(String value) {
    _statuAddPageOfPerson = value;
    prefs.setString('ff_statuAddPageOfPerson', value);
  }

  List<PageAddStruct> _personAdd2 = [];
  List<PageAddStruct> get personAdd2 => _personAdd2;
  set personAdd2(List<PageAddStruct> value) {
    _personAdd2 = value;
    prefs.setStringList(
        'ff_personAdd2', value.map((x) => x.serialize()).toList());
  }

  void addToPersonAdd2(PageAddStruct value) {
    _personAdd2.add(value);
    prefs.setStringList(
        'ff_personAdd2', _personAdd2.map((x) => x.serialize()).toList());
  }

  void removeFromPersonAdd2(PageAddStruct value) {
    _personAdd2.remove(value);
    prefs.setStringList(
        'ff_personAdd2', _personAdd2.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromPersonAdd2(int index) {
    _personAdd2.removeAt(index);
    prefs.setStringList(
        'ff_personAdd2', _personAdd2.map((x) => x.serialize()).toList());
  }

  void updatePersonAdd2AtIndex(
    int index,
    PageAddStruct Function(PageAddStruct) updateFn,
  ) {
    _personAdd2[index] = updateFn(_personAdd2[index]);
    prefs.setStringList(
        'ff_personAdd2', _personAdd2.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInPersonAdd2(int index, PageAddStruct value) {
    _personAdd2.insert(index, value);
    prefs.setStringList(
        'ff_personAdd2', _personAdd2.map((x) => x.serialize()).toList());
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
