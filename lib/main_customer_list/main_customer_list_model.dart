import '/backend/api_requests/api_calls.dart';
import '/components/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'main_customer_list_widget.dart' show MainCustomerListWidget;
import 'package:flutter/material.dart';

class MainCustomerListModel extends FlutterFlowModel<MainCustomerListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for webNav component.
  late WebNavModel webNavModel;
  // Stores action output result for [Backend Call - API (getPersonByOfc)] action in Icon widget.
  ApiCallResponse? apiResultbwb;
  // Stores action output result for [Backend Call - API (getProvincephp)] action in Icon widget.
  ApiCallResponse? apiProvince;
  // Stores action output result for [Backend Call - API (getDistrictphp)] action in Icon widget.
  ApiCallResponse? apiDistrict;
  // Stores action output result for [Backend Call - API (getTambonphp)] action in Icon widget.
  ApiCallResponse? apiTamvon;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    webNavModel.dispose();
    tabBarController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
