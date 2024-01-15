import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'signup_widget.dart' show SignupWidget;
import 'package:flutter/material.dart';

class SignupModel extends FlutterFlowModel<SignupWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode1;
  TextEditingController? emailAddressController1;
  String? Function(BuildContext, String?)? emailAddressController1Validator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode2;
  TextEditingController? emailAddressController2;
  String? Function(BuildContext, String?)? emailAddressController2Validator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode3;
  TextEditingController? emailAddressController3;
  String? Function(BuildContext, String?)? emailAddressController3Validator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode4;
  TextEditingController? emailAddressController4;
  String? Function(BuildContext, String?)? emailAddressController4Validator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode5;
  TextEditingController? emailAddressController5;
  String? Function(BuildContext, String?)? emailAddressController5Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - API (SignUp)] action in Button-Login widget.
  ApiCallResponse? apiResulttna;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    emailAddressFocusNode1?.dispose();
    emailAddressController1?.dispose();

    emailAddressFocusNode2?.dispose();
    emailAddressController2?.dispose();

    emailAddressFocusNode3?.dispose();
    emailAddressController3?.dispose();

    emailAddressFocusNode4?.dispose();
    emailAddressController4?.dispose();

    emailAddressFocusNode5?.dispose();
    emailAddressController5?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
