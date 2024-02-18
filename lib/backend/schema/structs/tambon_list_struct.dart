// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TambonListStruct extends FFFirebaseStruct {
  TambonListStruct({
    String? tambonid,
    String? tambonname,
    String? ampherid,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _tambonid = tambonid,
        _tambonname = tambonname,
        _ampherid = ampherid,
        super(firestoreUtilData);

  // "tambonid" field.
  String? _tambonid;
  String get tambonid => _tambonid ?? '';
  set tambonid(String? val) => _tambonid = val;
  bool hasTambonid() => _tambonid != null;

  // "tambonname" field.
  String? _tambonname;
  String get tambonname => _tambonname ?? '';
  set tambonname(String? val) => _tambonname = val;
  bool hasTambonname() => _tambonname != null;

  // "ampherid" field.
  String? _ampherid;
  String get ampherid => _ampherid ?? '';
  set ampherid(String? val) => _ampherid = val;
  bool hasAmpherid() => _ampherid != null;

  static TambonListStruct fromMap(Map<String, dynamic> data) =>
      TambonListStruct(
        tambonid: data['tambonid'] as String?,
        tambonname: data['tambonname'] as String?,
        ampherid: data['ampherid'] as String?,
      );

  static TambonListStruct? maybeFromMap(dynamic data) => data is Map
      ? TambonListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'tambonid': _tambonid,
        'tambonname': _tambonname,
        'ampherid': _ampherid,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'tambonid': serializeParam(
          _tambonid,
          ParamType.String,
        ),
        'tambonname': serializeParam(
          _tambonname,
          ParamType.String,
        ),
        'ampherid': serializeParam(
          _ampherid,
          ParamType.String,
        ),
      }.withoutNulls;

  static TambonListStruct fromSerializableMap(Map<String, dynamic> data) =>
      TambonListStruct(
        tambonid: deserializeParam(
          data['tambonid'],
          ParamType.String,
          false,
        ),
        tambonname: deserializeParam(
          data['tambonname'],
          ParamType.String,
          false,
        ),
        ampherid: deserializeParam(
          data['ampherid'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TambonListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TambonListStruct &&
        tambonid == other.tambonid &&
        tambonname == other.tambonname &&
        ampherid == other.ampherid;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([tambonid, tambonname, ampherid]);
}

TambonListStruct createTambonListStruct({
  String? tambonid,
  String? tambonname,
  String? ampherid,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TambonListStruct(
      tambonid: tambonid,
      tambonname: tambonname,
      ampherid: ampherid,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TambonListStruct? updateTambonListStruct(
  TambonListStruct? tambonList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    tambonList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTambonListStructData(
  Map<String, dynamic> firestoreData,
  TambonListStruct? tambonList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (tambonList == null) {
    return;
  }
  if (tambonList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && tambonList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final tambonListData = getTambonListFirestoreData(tambonList, forFieldValue);
  final nestedData = tambonListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = tambonList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTambonListFirestoreData(
  TambonListStruct? tambonList, [
  bool forFieldValue = false,
]) {
  if (tambonList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(tambonList.toMap());

  // Add any Firestore field values
  tambonList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTambonListListFirestoreData(
  List<TambonListStruct>? tambonLists,
) =>
    tambonLists?.map((e) => getTambonListFirestoreData(e, true)).toList() ?? [];
