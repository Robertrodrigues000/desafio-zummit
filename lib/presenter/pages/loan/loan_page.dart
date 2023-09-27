import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zummit/core/theme/app_text.dart';

import '../../../domain/entitites/loan_institution_entity.dart';
import '../../widgets/tab_title_widget.dart';

class LoanPage extends StatelessWidget {
  final List<LoanInstitutionEntity> loanList;
  final double value;
  const LoanPage({
    super.key,
    required this.loanList,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    String asBrlCurrency(double value) {
      var formatter = NumberFormat("#,##0.00", "pt_BR");
      String newText = "R\$ ${formatter.format(value)}";
      return newText;
    }

    return Scaffold(
      appBar: AppBar(
        title: const TabTitleWidget(),
        centerTitle: true,
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                AppText.sessionTitle("Opções de emprestimo"),
                ...loanList.map(
                  (item) => Column(
                    children: [
                      ...item.loanList.map(
                        (e) => Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: SizedBox(
                              width: 400,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText.bodyText(
                                      "Instituição: ${item.institution}"),
                                  AppText.bodyText(
                                      'Taxa de juros: ${e.tax.toString()}'),
                                  AppText.bodyText(
                                      "Valor do emprestimo: ${asBrlCurrency(value)}"),
                                  AppText.bodyText2(
                                      "${e.installments.toString()} parcelas de ${asBrlCurrency(e.installmentValue)}"),
                                  AppText.bodyText("Convênio: ${e.insurance}"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
