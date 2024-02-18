// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ProvinceListStruct extends FFFirebaseStruct {
  ProvinceListStruct({
    String? provinceid,
    String? provincename,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _provinceid = provinceid,
        _provincename = provincename,
        super(firestoreUtilData);

  // "provinceid" field.
  String? _provinceid;
  String get provinceid => _provinceid ?? '';
  set provinceid(String? val) => _provinceid = val;
  bool hasProvinceid() => _provinceid != null;

  // "provincename" field.
  String? _provincename;
  String get provincename => _provincename ?? '';
  set provincename(String? val) => _provincename = val;
  bool hasProvincename() => _provincename != null;

  static ProvinceListStruct fromMap(Map<String, dynamic> data) =>
      ProvinceListStruct(
        provinceid: data['provinceid'] as String?,
        provincename: data['provincename'] as String?,
      );

  static ProvinceListStruct? maybeFromMap(dynamic data) => data is Map
      ? ProvinceListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'provinceid': _provinceid,
        'provincename': _provincename,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'provinceid': serializeParam(
          _provinceid,
          ParamType.String,
        ),
        'provincename': serializeParam(
          _provincename,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProvinceListStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProvinceListStruct(
        provinceid: deserializeParam(
          data['provinceid'],
          ParamType.String,
          false,
        ),
        provincename: deserializeParam(
          data['provincename'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProvinceListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProvinceListStruct &&
        provinceid == other.provinceid &&
        provincename == other.provincename;
  }

  @override
  int get hashCode => const ListEquality().hash([provinceid, provincename]);
}

ProvinceListStruct createProvinceListStruct({
  String? provinceid,
  String? provincename,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProvinceListStruct(
      provinceid: provinceid,
      provincename: provincename,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProvinceListStruct? updateProvinceListStruct(
  ProvinceListStruct? provinceList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    provinceList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProvinceListStructData(
  Map<String, dynamic> firestoreData,
  ProvinceListStruct? provinceList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (provinceList == null) {
    return;
  }
  if (provinceList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && provinceList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final provinceListData =
      getProvinceListFirestoreData(provinceList, forFieldValue);
  final nestedData =
      provinceListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = provinceList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProvinceListFirestoreData(
  ProvinceListStruct? provinceList, [
  bool forFieldValue = false,
]) {
  if (provinceList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(provinceList.toMap());

  // Add any Firestore field values
  provinceList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProvinceListListFirestoreData(
  List<ProvinceListStruct>? provinceLists,
) =>
    provinceLists?.map((e) => getProvinceListFirestoreData(e, true)).toList() ??
    [];
