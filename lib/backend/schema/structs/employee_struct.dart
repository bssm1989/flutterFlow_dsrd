// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EmployeeStruct extends FFFirebaseStruct {
  EmployeeStruct({
    String? fullname,
    int? phone,
    String? address,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _fullname = fullname,
        _phone = phone,
        _address = address,
        super(firestoreUtilData);

  // "fullname" field.
  String? _fullname;
  String get fullname => _fullname ?? '';
  set fullname(String? val) => _fullname = val;
  bool hasFullname() => _fullname != null;

  // "phone" field.
  int? _phone;
  int get phone => _phone ?? 0;
  set phone(int? val) => _phone = val;
  void incrementPhone(int amount) => _phone = phone + amount;
  bool hasPhone() => _phone != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;
  bool hasAddress() => _address != null;

  static EmployeeStruct fromMap(Map<String, dynamic> data) => EmployeeStruct(
        fullname: data['fullname'] as String?,
        phone: castToType<int>(data['phone']),
        address: data['address'] as String?,
      );

  static EmployeeStruct? maybeFromMap(dynamic data) =>
      data is Map ? EmployeeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'fullname': _fullname,
        'phone': _phone,
        'address': _address,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'fullname': serializeParam(
          _fullname,
          ParamType.String,
        ),
        'phone': serializeParam(
          _phone,
          ParamType.int,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
      }.withoutNulls;

  static EmployeeStruct fromSerializableMap(Map<String, dynamic> data) =>
      EmployeeStruct(
        fullname: deserializeParam(
          data['fullname'],
          ParamType.String,
          false,
        ),
        phone: deserializeParam(
          data['phone'],
          ParamType.int,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'EmployeeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EmployeeStruct &&
        fullname == other.fullname &&
        phone == other.phone &&
        address == other.address;
  }

  @override
  int get hashCode => const ListEquality().hash([fullname, phone, address]);
}

EmployeeStruct createEmployeeStruct({
  String? fullname,
  int? phone,
  String? address,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EmployeeStruct(
      fullname: fullname,
      phone: phone,
      address: address,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EmployeeStruct? updateEmployeeStruct(
  EmployeeStruct? employee, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    employee
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEmployeeStructData(
  Map<String, dynamic> firestoreData,
  EmployeeStruct? employee,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (employee == null) {
    return;
  }
  if (employee.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && employee.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final employeeData = getEmployeeFirestoreData(employee, forFieldValue);
  final nestedData = employeeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = employee.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEmployeeFirestoreData(
  EmployeeStruct? employee, [
  bool forFieldValue = false,
]) {
  if (employee == null) {
    return {};
  }
  final firestoreData = mapToFirestore(employee.toMap());

  // Add any Firestore field values
  employee.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEmployeeListFirestoreData(
  List<EmployeeStruct>? employees,
) =>
    employees?.map((e) => getEmployeeFirestoreData(e, true)).toList() ?? [];
