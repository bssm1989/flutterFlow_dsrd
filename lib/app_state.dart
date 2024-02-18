import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
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
    _safeInit(() {
      _tambonOfUser = prefs.getString('ff_tambonOfUser') ?? _tambonOfUser;
    });
    _safeInit(() {
      _personPageList = prefs
              .getStringList('ff_personPageList')
              ?.map((x) {
                try {
                  return PersonStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _personPageList;
    });
    _safeInit(() {
      _tambonDropDown = prefs
              .getStringList('ff_tambonDropDown')
              ?.map((x) {
                try {
                  return TambonListStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _tambonDropDown;
    });
    _safeInit(() {
      _ampherDropDown = prefs
              .getStringList('ff_ampherDropDown')
              ?.map((x) {
                try {
                  return AmpherListStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _ampherDropDown;
    });
    _safeInit(() {
      _provinceDropDown = prefs
              .getStringList('ff_provinceDropDown')
              ?.map((x) {
                try {
                  return ProvinceListStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _provinceDropDown;
    });
    _safeInit(() {
      _xBarLabel = prefs.getStringList('ff_xBarLabel') ?? _xBarLabel;
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

  String _tambonOfUser = '';
  String get tambonOfUser => _tambonOfUser;
  set tambonOfUser(String value) {
    _tambonOfUser = value;
    prefs.setString('ff_tambonOfUser', value);
  }

  List<PersonStruct> _personPageList = [];
  List<PersonStruct> get personPageList => _personPageList;
  set personPageList(List<PersonStruct> value) {
    _personPageList = value;
    prefs.setStringList(
        'ff_personPageList', value.map((x) => x.serialize()).toList());
  }

  void addToPersonPageList(PersonStruct value) {
    _personPageList.add(value);
    prefs.setStringList('ff_personPageList',
        _personPageList.map((x) => x.serialize()).toList());
  }

  void removeFromPersonPageList(PersonStruct value) {
    _personPageList.remove(value);
    prefs.setStringList('ff_personPageList',
        _personPageList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromPersonPageList(int index) {
    _personPageList.removeAt(index);
    prefs.setStringList('ff_personPageList',
        _personPageList.map((x) => x.serialize()).toList());
  }

  void updatePersonPageListAtIndex(
    int index,
    PersonStruct Function(PersonStruct) updateFn,
  ) {
    _personPageList[index] = updateFn(_personPageList[index]);
    prefs.setStringList('ff_personPageList',
        _personPageList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInPersonPageList(int index, PersonStruct value) {
    _personPageList.insert(index, value);
    prefs.setStringList('ff_personPageList',
        _personPageList.map((x) => x.serialize()).toList());
  }

  List<TambonListStruct> _tambonDropDown = [
    TambonListStruct.fromSerializableMap(jsonDecode(
        '{"tambonid":"Hello World","tambonname":"Hello World","ampherid":"Hello World"}'))
  ];
  List<TambonListStruct> get tambonDropDown => _tambonDropDown;
  set tambonDropDown(List<TambonListStruct> value) {
    _tambonDropDown = value;
    prefs.setStringList(
        'ff_tambonDropDown', value.map((x) => x.serialize()).toList());
  }

  void addToTambonDropDown(TambonListStruct value) {
    _tambonDropDown.add(value);
    prefs.setStringList('ff_tambonDropDown',
        _tambonDropDown.map((x) => x.serialize()).toList());
  }

  void removeFromTambonDropDown(TambonListStruct value) {
    _tambonDropDown.remove(value);
    prefs.setStringList('ff_tambonDropDown',
        _tambonDropDown.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromTambonDropDown(int index) {
    _tambonDropDown.removeAt(index);
    prefs.setStringList('ff_tambonDropDown',
        _tambonDropDown.map((x) => x.serialize()).toList());
  }

  void updateTambonDropDownAtIndex(
    int index,
    TambonListStruct Function(TambonListStruct) updateFn,
  ) {
    _tambonDropDown[index] = updateFn(_tambonDropDown[index]);
    prefs.setStringList('ff_tambonDropDown',
        _tambonDropDown.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInTambonDropDown(int index, TambonListStruct value) {
    _tambonDropDown.insert(index, value);
    prefs.setStringList('ff_tambonDropDown',
        _tambonDropDown.map((x) => x.serialize()).toList());
  }

  List<AmpherListStruct> _ampherDropDown = [];
  List<AmpherListStruct> get ampherDropDown => _ampherDropDown;
  set ampherDropDown(List<AmpherListStruct> value) {
    _ampherDropDown = value;
    prefs.setStringList(
        'ff_ampherDropDown', value.map((x) => x.serialize()).toList());
  }

  void addToAmpherDropDown(AmpherListStruct value) {
    _ampherDropDown.add(value);
    prefs.setStringList('ff_ampherDropDown',
        _ampherDropDown.map((x) => x.serialize()).toList());
  }

  void removeFromAmpherDropDown(AmpherListStruct value) {
    _ampherDropDown.remove(value);
    prefs.setStringList('ff_ampherDropDown',
        _ampherDropDown.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromAmpherDropDown(int index) {
    _ampherDropDown.removeAt(index);
    prefs.setStringList('ff_ampherDropDown',
        _ampherDropDown.map((x) => x.serialize()).toList());
  }

  void updateAmpherDropDownAtIndex(
    int index,
    AmpherListStruct Function(AmpherListStruct) updateFn,
  ) {
    _ampherDropDown[index] = updateFn(_ampherDropDown[index]);
    prefs.setStringList('ff_ampherDropDown',
        _ampherDropDown.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInAmpherDropDown(int index, AmpherListStruct value) {
    _ampherDropDown.insert(index, value);
    prefs.setStringList('ff_ampherDropDown',
        _ampherDropDown.map((x) => x.serialize()).toList());
  }

  List<ProvinceListStruct> _provinceDropDown = [
    ProvinceListStruct.fromSerializableMap(jsonDecode(
        '{"provinceid":"Hello Worldj","provincename":"Hello Worldj"}')),
    ProvinceListStruct.fromSerializableMap(jsonDecode(
        '{"provinceid":"Hello World","provincename":"Hello World"}'))
  ];
  List<ProvinceListStruct> get provinceDropDown => _provinceDropDown;
  set provinceDropDown(List<ProvinceListStruct> value) {
    _provinceDropDown = value;
    prefs.setStringList(
        'ff_provinceDropDown', value.map((x) => x.serialize()).toList());
  }

  void addToProvinceDropDown(ProvinceListStruct value) {
    _provinceDropDown.add(value);
    prefs.setStringList('ff_provinceDropDown',
        _provinceDropDown.map((x) => x.serialize()).toList());
  }

  void removeFromProvinceDropDown(ProvinceListStruct value) {
    _provinceDropDown.remove(value);
    prefs.setStringList('ff_provinceDropDown',
        _provinceDropDown.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromProvinceDropDown(int index) {
    _provinceDropDown.removeAt(index);
    prefs.setStringList('ff_provinceDropDown',
        _provinceDropDown.map((x) => x.serialize()).toList());
  }

  void updateProvinceDropDownAtIndex(
    int index,
    ProvinceListStruct Function(ProvinceListStruct) updateFn,
  ) {
    _provinceDropDown[index] = updateFn(_provinceDropDown[index]);
    prefs.setStringList('ff_provinceDropDown',
        _provinceDropDown.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInProvinceDropDown(int index, ProvinceListStruct value) {
    _provinceDropDown.insert(index, value);
    prefs.setStringList('ff_provinceDropDown',
        _provinceDropDown.map((x) => x.serialize()).toList());
  }

  List<String> _xBarLabel = ['2019', '2020', '2021', '2023'];
  List<String> get xBarLabel => _xBarLabel;
  set xBarLabel(List<String> value) {
    _xBarLabel = value;
    prefs.setStringList('ff_xBarLabel', value);
  }

  void addToXBarLabel(String value) {
    _xBarLabel.add(value);
    prefs.setStringList('ff_xBarLabel', _xBarLabel);
  }

  void removeFromXBarLabel(String value) {
    _xBarLabel.remove(value);
    prefs.setStringList('ff_xBarLabel', _xBarLabel);
  }

  void removeAtIndexFromXBarLabel(int index) {
    _xBarLabel.removeAt(index);
    prefs.setStringList('ff_xBarLabel', _xBarLabel);
  }

  void updateXBarLabelAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _xBarLabel[index] = updateFn(_xBarLabel[index]);
    prefs.setStringList('ff_xBarLabel', _xBarLabel);
  }

  void insertAtIndexInXBarLabel(int index, String value) {
    _xBarLabel.insert(index, value);
    prefs.setStringList('ff_xBarLabel', _xBarLabel);
  }

  List<int> _yBarValue = [24, 32, 14, 15];
  List<int> get yBarValue => _yBarValue;
  set yBarValue(List<int> value) {
    _yBarValue = value;
  }

  void addToYBarValue(int value) {
    _yBarValue.add(value);
  }

  void removeFromYBarValue(int value) {
    _yBarValue.remove(value);
  }

  void removeAtIndexFromYBarValue(int index) {
    _yBarValue.removeAt(index);
  }

  void updateYBarValueAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    _yBarValue[index] = updateFn(_yBarValue[index]);
  }

  void insertAtIndexInYBarValue(int index, int value) {
    _yBarValue.insert(index, value);
  }
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
