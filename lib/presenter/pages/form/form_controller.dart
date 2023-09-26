import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:zummit/domain/entitites/institution_entity.dart';
import 'package:zummit/domain/entitites/insurance_entity.dart';
import 'package:zummit/domain/usecases/get_institutions_usecase.dart';

import '../../../domain/usecases/get_insurances_usecase.dart';
import '../../widgets/snackbar_widget.dart';


class FormController extends ChangeNotifier {
   final _getInstitutionsUsecase = Modular.get<GetInstitutionsUsecase>();
  final _getInsurancesUsecase = Modular.get<GetInsurancesUsecase>();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final institutionListListenable =
      ValueNotifier<List<InstitutionEntity>>([]);
  final insuranceListListenable = ValueNotifier<List<InsuranceEntity>>([]);
  final fileListenable = ValueNotifier<File?>(null);
  final formKey = GlobalKey<FormState>();
  final List<String> installmentsList = <String>["36", "48", "60", "72", "84"];

  TextEditingController dateCtl = TextEditingController();
  TextEditingController descriptionCtl = TextEditingController();
  TextEditingController valueCtl = TextEditingController();

  FormController() {
    _init();
  }

  void _init() {
   _getInstitutionList();
   _getInsuranceList();
  }

 Future<void> _getInstitutionList() async {
    var response = await _getInstitutionsUsecase();

    if (response.isRight) {
      institutionListListenable.value = response.right;
      institutionListListenable.notifyListeners();
    } else {
      SnackbarHelper.error(
        message:
            'Erro ao carregar as informações, favor tentar novamente mais tarde.',
        context: scaffoldKey.currentContext!,
      );
    }
  }

 Future<void> _getInsuranceList() async {
    var response = await _getInsurancesUsecase();

    if (response.isRight) {
      insuranceListListenable.value = response.right;
      insuranceListListenable.notifyListeners();
    } else {
      SnackbarHelper.error(
        message:
            'Erro ao carregar as informações, favor tentar novamente mais tarde.',
        context: scaffoldKey.currentContext!,
      );
    }
  }
}
