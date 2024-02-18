// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PersonStruct extends FFFirebaseStruct {
  PersonStruct({
    String? plcid,
    String? savofc,
    String? nameAndSurname,
    String? pertypnme,
    String? perid,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _plcid = plcid,
        _savofc = savofc,
        _nameAndSurname = nameAndSurname,
        _pertypnme = pertypnme,
        _perid = perid,
        super(firestoreUtilData);

  // "plcid" field.
  String? _plcid;
  String get plcid => _plcid ?? '';
  set plcid(String? val) => _plcid = val;
  bool hasPlcid() => _plcid != null;

  // "savofc" field.
  String? _savofc;
  String get savofc => _savofc ?? '';
  set savofc(String? val) => _savofc = val;
  bool hasSavofc() => _savofc != null;

  // "nameAndSurname" field.
  String? _nameAndSurname;
  String get nameAndSurname => _nameAndSurname ?? '';
  set nameAndSurname(String? val) => _nameAndSurname = val;
  bool hasNameAndSurname() => _nameAndSurname != null;

  // "pertypnme" field.
  String? _pertypnme;
  String get pertypnme => _pertypnme ?? '';
  set pertypnme(String? val) => _pertypnme = val;
  bool hasPertypnme() => _pertypnme != null;

  // "perid" field.
  String? _perid;
  String get perid => _perid ?? '';
  set perid(String? val) => _perid = val;
  bool hasPerid() => _perid != null;

  static PersonStruct fromMap(Map<String, dynamic> data) => PersonStruct(
        plcid: data['plcid'] as String?,
        savofc: data['savofc'] as String?,
        nameAndSurname: data['nameAndSurname'] as String?,
        pertypnme: data['pertypnme'] as String?,
        perid: data['perid'] as String?,
      );

  static PersonStruct? maybeFromMap(dynamic data) =>
      data is Map ? PersonStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'plcid': _plcid,
        'savofc': _savofc,
        'nameAndSurname': _nameAndSurname,
        'pertypnme': _pertypnme,
        'perid': _perid,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'plcid': serializeParam(
          _plcid,
          ParamType.String,
        ),
        'savofc': serializeParam(
          _savofc,
          ParamType.String,
        ),
        'nameAndSurname': serializeParam(
          _nameAndSurname,
          ParamType.String,
        ),
        'pertypnme': serializeParam(
          _pertypnme,
          ParamType.String,
        ),
        'perid': serializeParam(
          _perid,
          ParamType.String,
        ),
      }.withoutNulls;

  static PersonStruct fromSerializableMap(Map<String, dynamic> data) =>
      PersonStruct(
        plcid: deserializeParam(
          data['plcid'],
          ParamType.String,
          false,
        ),
        savofc: deserializeParam(
          data['savofc'],
          ParamType.String,
          false,
        ),
        nameAndSurname: deserializeParam(
          data['nameAndSurname'],
          ParamType.String,
          false,
        ),
        pertypnme: deserializeParam(
          data['pertypnme'],
          ParamType.String,
          false,
        ),
        perid: deserializeParam(
          data['perid'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PersonStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PersonStruct &&
        plcid == other.plcid &&
        savofc == other.savofc &&
        nameAndSurname == other.nameAndSurname &&
        pertypnme == other.pertypnme &&
        perid == other.perid;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([plcid, savofc, nameAndSurname, pertypnme, perid]);
}

PersonStruct createPersonStruct({
  String? plcid,
  String? savofc,
  String? nameAndSurname,
  String? pertypnme,
  String? perid,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PersonStruct(
      plcid: plcid,
      savofc: savofc,
      nameAndSurname: nameAndSurname,
      pertypnme: pertypnme,
      perid: perid,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PersonStruct? updatePersonStruct(
  PersonStruct? person, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    person
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPersonStructData(
  Map<String, dynamic> firestoreData,
  PersonStruct? person,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (person == null) {
    return;
  }
  if (person.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && person.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final personData = getPersonFirestoreData(person, forFieldValue);
  final nestedData = personData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = person.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPersonFirestoreData(
  PersonStruct? person, [
  bool forFieldValue = false,
]) {
  if (person == null) {
    return {};
  }
  final firestoreData = mapToFirestore(person.toMap());

  // Add any Firestore field values
  person.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPersonListFirestoreData(
  List<PersonStruct>? persons,
) =>
    persons?.map((e) => getPersonFirestoreData(e, true)).toList() ?? [];
