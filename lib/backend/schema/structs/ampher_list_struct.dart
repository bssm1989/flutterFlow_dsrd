// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AmpherListStruct extends FFFirebaseStruct {
  AmpherListStruct({
    String? ampid,
    String? amphername,
    String? prvid,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _ampid = ampid,
        _amphername = amphername,
        _prvid = prvid,
        super(firestoreUtilData);

  // "ampid" field.
  String? _ampid;
  String get ampid => _ampid ?? '';
  set ampid(String? val) => _ampid = val;
  bool hasAmpid() => _ampid != null;

  // "amphername" field.
  String? _amphername;
  String get amphername => _amphername ?? '';
  set amphername(String? val) => _amphername = val;
  bool hasAmphername() => _amphername != null;

  // "prvid" field.
  String? _prvid;
  String get prvid => _prvid ?? '';
  set prvid(String? val) => _prvid = val;
  bool hasPrvid() => _prvid != null;

  static AmpherListStruct fromMap(Map<String, dynamic> data) =>
      AmpherListStruct(
        ampid: data['ampid'] as String?,
        amphername: data['amphername'] as String?,
        prvid: data['prvid'] as String?,
      );

  static AmpherListStruct? maybeFromMap(dynamic data) => data is Map
      ? AmpherListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ampid': _ampid,
        'amphername': _amphername,
        'prvid': _prvid,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ampid': serializeParam(
          _ampid,
          ParamType.String,
        ),
        'amphername': serializeParam(
          _amphername,
          ParamType.String,
        ),
        'prvid': serializeParam(
          _prvid,
          ParamType.String,
        ),
      }.withoutNulls;

  static AmpherListStruct fromSerializableMap(Map<String, dynamic> data) =>
      AmpherListStruct(
        ampid: deserializeParam(
          data['ampid'],
          ParamType.String,
          false,
        ),
        amphername: deserializeParam(
          data['amphername'],
          ParamType.String,
          false,
        ),
        prvid: deserializeParam(
          data['prvid'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AmpherListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AmpherListStruct &&
        ampid == other.ampid &&
        amphername == other.amphername &&
        prvid == other.prvid;
  }

  @override
  int get hashCode => const ListEquality().hash([ampid, amphername, prvid]);
}

AmpherListStruct createAmpherListStruct({
  String? ampid,
  String? amphername,
  String? prvid,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AmpherListStruct(
      ampid: ampid,
      amphername: amphername,
      prvid: prvid,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AmpherListStruct? updateAmpherListStruct(
  AmpherListStruct? ampherList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    ampherList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAmpherListStructData(
  Map<String, dynamic> firestoreData,
  AmpherListStruct? ampherList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (ampherList == null) {
    return;
  }
  if (ampherList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && ampherList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final ampherListData = getAmpherListFirestoreData(ampherList, forFieldValue);
  final nestedData = ampherListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = ampherList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAmpherListFirestoreData(
  AmpherListStruct? ampherList, [
  bool forFieldValue = false,
]) {
  if (ampherList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(ampherList.toMap());

  // Add any Firestore field values
  ampherList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAmpherListListFirestoreData(
  List<AmpherListStruct>? ampherLists,
) =>
    ampherLists?.map((e) => getAmpherListFirestoreData(e, true)).toList() ?? [];
