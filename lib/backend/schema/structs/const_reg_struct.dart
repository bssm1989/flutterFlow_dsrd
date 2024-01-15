// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConstRegStruct extends FFFirebaseStruct {
  ConstRegStruct({
    int? regid,
    String? regnme,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _regid = regid,
        _regnme = regnme,
        super(firestoreUtilData);

  // "regid" field.
  int? _regid;
  int get regid => _regid ?? 0;
  set regid(int? val) => _regid = val;
  void incrementRegid(int amount) => _regid = regid + amount;
  bool hasRegid() => _regid != null;

  // "regnme" field.
  String? _regnme;
  String get regnme => _regnme ?? '';
  set regnme(String? val) => _regnme = val;
  bool hasRegnme() => _regnme != null;

  static ConstRegStruct fromMap(Map<String, dynamic> data) => ConstRegStruct(
        regid: castToType<int>(data['regid']),
        regnme: data['regnme'] as String?,
      );

  static ConstRegStruct? maybeFromMap(dynamic data) =>
      data is Map ? ConstRegStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'regid': _regid,
        'regnme': _regnme,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'regid': serializeParam(
          _regid,
          ParamType.int,
        ),
        'regnme': serializeParam(
          _regnme,
          ParamType.String,
        ),
      }.withoutNulls;

  static ConstRegStruct fromSerializableMap(Map<String, dynamic> data) =>
      ConstRegStruct(
        regid: deserializeParam(
          data['regid'],
          ParamType.int,
          false,
        ),
        regnme: deserializeParam(
          data['regnme'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ConstRegStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ConstRegStruct &&
        regid == other.regid &&
        regnme == other.regnme;
  }

  @override
  int get hashCode => const ListEquality().hash([regid, regnme]);
}

ConstRegStruct createConstRegStruct({
  int? regid,
  String? regnme,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ConstRegStruct(
      regid: regid,
      regnme: regnme,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ConstRegStruct? updateConstRegStruct(
  ConstRegStruct? constReg, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    constReg
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addConstRegStructData(
  Map<String, dynamic> firestoreData,
  ConstRegStruct? constReg,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (constReg == null) {
    return;
  }
  if (constReg.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && constReg.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final constRegData = getConstRegFirestoreData(constReg, forFieldValue);
  final nestedData = constRegData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = constReg.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getConstRegFirestoreData(
  ConstRegStruct? constReg, [
  bool forFieldValue = false,
]) {
  if (constReg == null) {
    return {};
  }
  final firestoreData = mapToFirestore(constReg.toMap());

  // Add any Firestore field values
  constReg.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getConstRegListFirestoreData(
  List<ConstRegStruct>? constRegs,
) =>
    constRegs?.map((e) => getConstRegFirestoreData(e, true)).toList() ?? [];
