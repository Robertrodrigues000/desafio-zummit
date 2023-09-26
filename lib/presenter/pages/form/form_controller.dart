import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../domain/entitites/expenses_entity.dart';

class FormController extends ChangeNotifier {
  final ExpenseEntity? _expense;

  final expensesListListenable = ValueNotifier<ExpenseEntity?>(null);
  final fileListenable = ValueNotifier<File?>(null);
  final formKey = GlobalKey<FormState>();
  final List mockedList = ["1", "2", "3", "4"];
  List<String> list = <String>['One', 'Two', 'Three', 'Four'];
  List<String> installmentsList = <String>["36", "48", "60", "72", "84"];

  TextEditingController dateCtl = TextEditingController();
  TextEditingController descriptionCtl = TextEditingController();
  TextEditingController valueCtl = TextEditingController();
  DateTime? date = DateTime(1900);

  FormController({
    ExpenseEntity? expense,
  }) : _expense = expense {
    _init();
  }

  void _init() {
    if (_expense != null) {
      dateCtl.text = DateFormat("dd/MM/yyyy").format(_expense!.day);
      descriptionCtl.text = _expense!.description;
      valueCtl.text = _expense!.amount.toString();
    }
  }

  Future datePicker({required context}) async {
    FocusScope.of(context).requestFocus(new FocusNode());

    date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));

    dateCtl.text = DateFormat("dd/MM/yyyy").format(date!);
  }

  void addDataExpese() async {}
}
