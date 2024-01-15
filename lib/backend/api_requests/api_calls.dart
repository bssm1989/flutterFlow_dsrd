import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class LogInCall {
  static Future<ApiCallResponse> call({
    String? usrnme = '',
    String? pwd = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'log in',
      apiUrl: 'https://api2.oas.psu.ac.th/api/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'usrnme': usrnme,
        'pwd': pwd,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? username(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.username''',
      ));
  static String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
  static int? userid(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.user.userId''',
      ));
}

class LogInPhpCall {
  static Future<ApiCallResponse> call({
    String? usrnme = '',
    String? pwd = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'log in Php',
      apiUrl: 'https://dekequaltani.com/appDsrdSystem/api/getLogin.php',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'usrnme': usrnme,
        'pwd': pwd,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? username(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.username''',
      ));
  static String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
  static int? userid(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.user.userId''',
      ));
}

class SignUpCall {
  static Future<ApiCallResponse> call({
    String? usrnme = '',
    String? pwd = '',
    String? name = '',
    String? lastname = '',
    String? telephone = '',
    String? tambon = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'SignUp',
      apiUrl: 'https://dekequaltani.com/appDsrdSystem/api/signupuser.php',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'usrnme': usrnme,
        'pwd': pwd,
        'name': name,
        'lastname': lastname,
        'telephone': telephone,
        'tambon': tambon,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? response(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class AddpersonqtnadditionalphpCall {
  static Future<ApiCallResponse> call({
    String? perid = '',
    String? bloodType = '',
    String? addOccid = '',
    String? roladr = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'addpersonqtnadditionalphp',
      apiUrl:
          'https://dekequaltani.com/appDsrdSystem/api/add_person_qtn_additional.php',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'perid': perid,
        'blood_type': bloodType,
        'add_occid': addOccid,
        'roladr': roladr,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? response(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class GetallUserCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getallUser',
      apiUrl: 'https://dsrd.pn.psu.ac.th/appDsrdSystem/api/getallUser.php',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class HttpsapioaspsuacthapicountalumniCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'httpsapioaspsuacthapicountalumni',
      apiUrl: 'https://api2.oas.psu.ac.th/api/count-alumni',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ConstRegCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'constReg',
      apiUrl: 'https://api2.oas.psu.ac.th/api/get-const-reg',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? regid(dynamic response) => (getJsonField(
        response,
        r'''$[:].regid''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? regnme(dynamic response) => (getJsonField(
        response,
        r'''$[:].regnme''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetPersonByPidCall {
  static Future<ApiCallResponse> call({
    String? pid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getPersonByPid',
      apiUrl: 'https://dekequaltani.com/appDsrdSystem/api/getPersonByPid.php',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'pid': pid,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? nameByPid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.nme''',
      ));
  static String? addresByPid(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.rolplc''',
      ));
  static List? personData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static String? birthdate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.brtdte''',
      ));
  static String? perid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.perid''',
      ));
}

class GetDropDownTambonUserCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getDropDownTambonUser',
      apiUrl:
          'https://dekequaltani.com/appDsrdSystem/api/getDropDownTambonUser.php',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? tambonDropDownSignUP(dynamic response) => (getJsonField(
        response,
        r'''$[:].tambon''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
