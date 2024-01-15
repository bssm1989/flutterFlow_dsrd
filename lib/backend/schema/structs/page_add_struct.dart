// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PageAddStruct extends FFFirebaseStruct {
  PageAddStruct({
    String? pid,
    String? perid,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _pid = pid,
        _perid = perid,
        super(firestoreUtilData);

  // "pid" field.
  String? _pid;
  String get pid => _pid ?? '';
  set pid(String? val) => _pid = val;
  bool hasPid() => _pid != null;

  // "perid" field.
  String? _perid;
  String get perid => _perid ?? '';
  set perid(String? val) => _perid = val;
  bool hasPerid() => _perid != null;

  static PageAddStruct fromMap(Map<String, dynamic> data) => PageAddStruct(
        pid: data['pid'] as String?,
        perid: data['perid'] as String?,
      );

  static PageAddStruct? maybeFromMap(dynamic data) =>
      data is Map ? PageAddStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'pid': _pid,
        'perid': _perid,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'pid': serializeParam(
          _pid,
          ParamType.String,
        ),
        'perid': serializeParam(
          _perid,
          ParamType.String,
        ),
      }.withoutNulls;

  static PageAddStruct fromSerializableMap(Map<String, dynamic> data) =>
      PageAddStruct(
        pid: deserializeParam(
          data['pid'],
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
  String toString() => 'PageAddStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PageAddStruct && pid == other.pid && perid == other.perid;
  }

  @override
  int get hashCode => const ListEquality().hash([pid, perid]);
}

PageAddStruct createPageAddStruct({
  String? pid,
  String? perid,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PageAddStruct(
      pid: pid,
      perid: perid,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PageAddStruct? updatePageAddStruct(
  PageAddStruct? pageAdd, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    pageAdd
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPageAddStructData(
  Map<String, dynamic> firestoreData,
  PageAddStruct? pageAdd,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (pageAdd == null) {
    return;
  }
  if (pageAdd.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && pageAdd.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pageAddData = getPageAddFirestoreData(pageAdd, forFieldValue);
  final nestedData = pageAddData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = pageAdd.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPageAddFirestoreData(
  PageAddStruct? pageAdd, [
  bool forFieldValue = false,
]) {
  if (pageAdd == null) {
    return {};
  }
  final firestoreData = mapToFirestore(pageAdd.toMap());

  // Add any Firestore field values
  pageAdd.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPageAddListFirestoreData(
  List<PageAddStruct>? pageAdds,
) =>
    pageAdds?.map((e) => getPageAddFirestoreData(e, true)).toList() ?? [];
