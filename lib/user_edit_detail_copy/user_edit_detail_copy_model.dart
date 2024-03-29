import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'user_edit_detail_copy_widget.dart' show UserEditDetailCopyWidget;
import 'package:flutter/material.dart';

class UserEditDetailCopyModel
    extends FlutterFlowModel<UserEditDetailCopyWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for age widget.
  FocusNode? ageFocusNode;
  TextEditingController? ageController;
  String? Function(BuildContext, String?)? ageControllerValidator;
  // State field(s) for RadioButton_sex widget.
  FormFieldController<String>? radioButtonSexValueController;
  // State field(s) for DropDownreligion widget.
  String? dropDownreligionValue;
  FormFieldController<String>? dropDownreligionValueController;
  // State field(s) for DropDown_status widget.
  String? dropDownStatusValue;
  FormFieldController<String>? dropDownStatusValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode7;
  TextEditingController? textController8;
  String? Function(BuildContext, String?)? textController8Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode8;
  TextEditingController? textController9;
  String? Function(BuildContext, String?)? textController9Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode9;
  TextEditingController? textController10;
  String? Function(BuildContext, String?)? textController10Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode10;
  TextEditingController? textController11;
  String? Function(BuildContext, String?)? textController11Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode11;
  TextEditingController? textController12;
  String? Function(BuildContext, String?)? textController12Validator;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode12;
  TextEditingController? textController13;
  String? Function(BuildContext, String?)? textController13Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode13;
  TextEditingController? textController14;
  String? Function(BuildContext, String?)? textController14Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;
  // State field(s) for DropDown widget.
  String? dropDownValue4;
  FormFieldController<String>? dropDownValueController4;
  // State field(s) for DropDown widget.
  String? dropDownValue5;
  FormFieldController<String>? dropDownValueController5;
  // State field(s) for CheckboxGroup widget.
  List<String>? checkboxGroupValues1;
  FormFieldController<List<String>>? checkboxGroupValueController1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode14;
  TextEditingController? textController15;
  String? Function(BuildContext, String?)? textController15Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode15;
  TextEditingController? textController16;
  String? Function(BuildContext, String?)? textController16Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue6;
  FormFieldController<String>? dropDownValueController6;
  // State field(s) for provinceDropDown widget.
  String? provinceDropDownValue;
  FormFieldController<String>? provinceDropDownValueController;
  // State field(s) for ampherDropDown widget.
  String? ampherDropDownValue;
  FormFieldController<String>? ampherDropDownValueController;
  // State field(s) for tambonDropDown widget.
  String? tambonDropDownValue;
  FormFieldController<String>? tambonDropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode16;
  TextEditingController? textController17;
  String? Function(BuildContext, String?)? textController17Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode17;
  TextEditingController? textController18;
  String? Function(BuildContext, String?)? textController18Validator;
  // Stores action output result for [Bottom Sheet - mapSelect2] action in Icon widget.
  LatLng? latLngSelect;
  // State field(s) for DropDown widget.
  String? dropDownValue7;
  FormFieldController<String>? dropDownValueController7;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode18;
  TextEditingController? textController19;
  String? Function(BuildContext, String?)? textController19Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode19;
  TextEditingController? textController20;
  String? Function(BuildContext, String?)? textController20Validator;
  // State field(s) for CheckboxGroup widget.
  List<String>? checkboxGroupValues2;
  FormFieldController<List<String>>? checkboxGroupValueController2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode20;
  TextEditingController? textController21;
  String? Function(BuildContext, String?)? textController21Validator;
  // State field(s) for CheckboxGroup widget.
  List<String>? checkboxGroupValues3;
  FormFieldController<List<String>>? checkboxGroupValueController3;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode21;
  TextEditingController? textController22;
  String? Function(BuildContext, String?)? textController22Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode22;
  TextEditingController? textController23;
  String? Function(BuildContext, String?)? textController23Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode23;
  TextEditingController? textController24;
  String? Function(BuildContext, String?)? textController24Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue8;
  FormFieldController<String>? dropDownValueController8;
  // State field(s) for typeOfPerson widget.
  String? typeOfPersonValue;
  FormFieldController<String>? typeOfPersonValueController;
  // State field(s) for DropDown widget.
  String? dropDownValue9;
  FormFieldController<String>? dropDownValueController9;
  // State field(s) for DropDown widget.
  String? dropDownValue10;
  FormFieldController<String>? dropDownValueController10;
  // State field(s) for DropDown widget.
  String? dropDownValue11;
  FormFieldController<String>? dropDownValueController11;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode24;
  TextEditingController? textController25;
  String? Function(BuildContext, String?)? textController25Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode25;
  TextEditingController? textController26;
  String? Function(BuildContext, String?)? textController26Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode26;
  TextEditingController? textController27;
  String? Function(BuildContext, String?)? textController27Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue12;
  FormFieldController<String>? dropDownValueController12;
  // Stores action output result for [Backend Call - API (addpersonqtnadditionalphp)] action in Button widget.
  ApiCallResponse? apiResultfkp;
  // State field(s) for DropDown widget.
  String? dropDownValue13;
  FormFieldController<String>? dropDownValueController13;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldFocusNode5?.dispose();
    textController5?.dispose();

    ageFocusNode?.dispose();
    ageController?.dispose();

    textFieldFocusNode6?.dispose();
    textController7?.dispose();

    textFieldFocusNode7?.dispose();
    textController8?.dispose();

    textFieldFocusNode8?.dispose();
    textController9?.dispose();

    textFieldFocusNode9?.dispose();
    textController10?.dispose();

    textFieldFocusNode10?.dispose();
    textController11?.dispose();

    textFieldFocusNode11?.dispose();
    textController12?.dispose();

    textFieldFocusNode12?.dispose();
    textController13?.dispose();

    textFieldFocusNode13?.dispose();
    textController14?.dispose();

    textFieldFocusNode14?.dispose();
    textController15?.dispose();

    textFieldFocusNode15?.dispose();
    textController16?.dispose();

    textFieldFocusNode16?.dispose();
    textController17?.dispose();

    textFieldFocusNode17?.dispose();
    textController18?.dispose();

    textFieldFocusNode18?.dispose();
    textController19?.dispose();

    textFieldFocusNode19?.dispose();
    textController20?.dispose();

    textFieldFocusNode20?.dispose();
    textController21?.dispose();

    textFieldFocusNode21?.dispose();
    textController22?.dispose();

    textFieldFocusNode22?.dispose();
    textController23?.dispose();

    textFieldFocusNode23?.dispose();
    textController24?.dispose();

    textFieldFocusNode24?.dispose();
    textController25?.dispose();

    textFieldFocusNode25?.dispose();
    textController26?.dispose();

    textFieldFocusNode26?.dispose();
    textController27?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get radioButtonSexValue => radioButtonSexValueController?.value;
}
