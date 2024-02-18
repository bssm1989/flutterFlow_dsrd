import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class LogInCopyCall {
  static Future<ApiCallResponse> call({
    String? usrnme = '',
    String? pwd = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'log in Copy',
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
  static String? userid(dynamic response) => castToType<String>(getJsonField(
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
    String? ofcid = '',
    FFUploadedFile? image,
    String? latLng = '',
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
        'ofcid': ofcid,
        'image': image,
        'latLng': latLng,
      },
      bodyType: BodyType.MULTIPART,
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

class GetPersonByPeridCall {
  static Future<ApiCallResponse> call({
    String? perid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getPersonByPerid',
      apiUrl: 'https://dekequaltani.com/appDsrdSystem/api/getPersonByPerid.php',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'perid': perid,
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
  static String? brtdte(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.brtdte''',
      ));
  static String? perid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.perid''',
      ));
  static String? plcnmegen(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.plcnmegen''',
      ));
  static String? sexnme(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.sexnme''',
      ));
  static String? pid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.pid''',
      ));
}

class GetListQuestionnaireByPeridCall {
  static Future<ApiCallResponse> call({
    String? perid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getListQuestionnaireByPerid',
      apiUrl:
          'https://dekequaltani.com/appDsrdSystem/api/getListQuestionnaireByPerid.php',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'perid': perid,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? acceptdate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].accept_date''',
      ));
  static String? staffdate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].staff_date''',
      ));
  static String? staffnme(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].staff_nme''',
      ));
  static String? interviewtimeend(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].interview_timeend''',
      ));
  static String? interviewtimestart(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].interview_timestart''',
      ));
  static String? contributormobile(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].contributor_mobile''',
      ));
  static String? contributorrelation(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].contributor_relation''',
      ));
  static String? contributorsurnme(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].contributor_surnme''',
      ));
  static String? contributorprenme(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].contributor_prenme''',
      ));
  static String? qnumber(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].qnumber''',
      ));
  static String? interviewtimesum(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].interview_timesum''',
      ));
  static String? interviewdate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].interview_date''',
      ));
  static String? contributortel(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].contributor_tel''',
      ));
  static String? contributornme(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].contributor_nme''',
      ));
  static String? contributor(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].contributor''',
      ));
  static String? perid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].perid''',
      ));
  static String? pertypid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].pertypid''',
      ));
  static String? contributoridcard(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].contributor_idcard''',
      ));
  static String? staffcontrol(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].staff_control''',
      ));
  static String? acceptinterview(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].accept_interview''',
      ));
  static List? listData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetPersonByPidCopyCall {
  static Future<ApiCallResponse> call({
    String? pid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getPersonByPid Copy',
      apiUrl: 'https://dekequaltani.com/appDsrdSystem/api/getPersonByPid2.php',
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
  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? lastName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.surnme''',
      ));
  static String? fullname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.fullname''',
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

class GetPersonByOfcCall {
  static Future<ApiCallResponse> call({
    String? saveOfc = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getPersonByOfc',
      apiUrl: 'https://dekequaltani.com/appDsrdSystem/api/getPersonByOfc.php',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'saveOfc': saveOfc,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? plcid(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].plcid''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? saveofc(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].savofc''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? nameAndSureName(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].nameAndSurname''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? perid(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].perid''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? personData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetProvincephpCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getProvincephp',
      apiUrl: 'https://dekequaltani.com/appDsrdSystem/api/getProvince.php',
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

  static List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? provinceid(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].provinceid''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? provincename(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].provincename''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetDistrictphpCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getDistrictphp',
      apiUrl: 'https://dekequaltani.com/appDsrdSystem/api/getDistrict.php',
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

  static List<String>? ampid(dynamic response) => (getJsonField(
        response,
        r'''$[:].ampid''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? amphername(dynamic response) => (getJsonField(
        response,
        r'''$[:].ampher_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? prvid(dynamic response) => (getJsonField(
        response,
        r'''$[:].prvid''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetTambonphpCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getTambonphp',
      apiUrl: 'https://dekequaltani.com/appDsrdSystem/api/getTambon.php',
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

  static List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].plcidgen''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? tambon(dynamic response) => (getJsonField(
        response,
        r'''$[:].tmbnmegen''',
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
