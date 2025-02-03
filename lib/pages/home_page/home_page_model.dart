import '/components/edt_default_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for edtCPF widget.
  FocusNode? edtCPFFocusNode;
  TextEditingController? edtCPFTextController;
  String? Function(BuildContext, String?)? edtCPFTextControllerValidator;
  String? _edtCPFTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'CPF inválido. Formato correto 123.456.789-12';
    }

    if (!RegExp('').hasMatch(val)) {
      return 'erro de cpf';
    }
    return null;
  }

  // State field(s) for edtTelefone widget.
  FocusNode? edtTelefoneFocusNode;
  TextEditingController? edtTelefoneTextController;
  String? Function(BuildContext, String?)? edtTelefoneTextControllerValidator;
  // Model for EdtDefault component.
  late EdtDefaultModel edtDefaultModel;

  @override
  void initState(BuildContext context) {
    edtCPFTextControllerValidator = _edtCPFTextControllerValidator;
    edtDefaultModel = createModel(context, () => EdtDefaultModel());
  }

  @override
  void dispose() {
    edtCPFFocusNode?.dispose();
    edtCPFTextController?.dispose();

    edtTelefoneFocusNode?.dispose();
    edtTelefoneTextController?.dispose();

    edtDefaultModel.dispose();
  }
}
