
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:zummit/presenter/pages/form/widget/app_form_field.dart';

import '../../../core/app_controller.dart';
import '../../../core/theme/app_text.dart';
import '../../../domain/entitites/expenses_entity.dart';
import '../../widgets/app_button.dart';
import '../../widgets/tab_title_widget.dart';
import 'form_controller.dart';

class FormPage extends StatefulWidget {
  final Function? addExpense;
  final ExpenseEntity? expense;
  const FormPage({super.key, this.addExpense, this.expense});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends AppController<FormPage, FormController> {
  @override
  FormController createController() => FormController(expense: widget.expense);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TabTitleWidget(),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                AppText.sessionTitle('Realizar simulação'),
                const SizedBox(height: 20),
                Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      AppFormField(
                        controller: controller.valueCtl,
                        labelText: "Valor do emprestimo",
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Favor adicionar o valor';
                          }
                          return null;
                        },
                      ),
                      MultiSelectDialogField(
                        buttonText: const Text('Instituição'),
                        items: controller.mockedList
                            .map((e) => MultiSelectItem(e, e))
                            .toList(),
                        listType: MultiSelectListType.CHIP,
                        onConfirm: (values) {
                          // _selectedAnimals = values;
                        },
                      ),
                      const SizedBox(height: 5),
                      MultiSelectDialogField(
                        buttonText: const Text('Convênio'),
                        items: controller.mockedList
                            .map((e) => MultiSelectItem(e, e))
                            .toList(),
                        listType: MultiSelectListType.CHIP,
                        onConfirm: (values) {
                          // _selectedAnimals = values;
                        },
                      ),
                      const SizedBox(height: 5),
                      DropdownButtonFormField<String>(
                        isExpanded: true,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(right: 10, left: 10),
                        ),
                        hint: const Text("Parcelas"),
                        onChanged: (String? value) {},
                        items: controller.installmentsList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 200,
                      ),
                      AppButton(
                        onPressed: () async => controller.addDataExpese(),
                        width: 1000,
                        height: 50,
                        title: "Simular",
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
