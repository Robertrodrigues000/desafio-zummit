import 'package:flutter/material.dart';

import '../../../core/app_controller.dart';
import '../../../domain/entitites/loan_entity.dart';
import '../../widgets/tab_title_widget.dart';
import 'loan_controller.dart';

class LoanPage extends StatefulWidget {
  final List<LoanEntity> loanList;
  const LoanPage({super.key, required this.loanList});

  @override
  State<LoanPage> createState() => _LoanPageState();
}

class _LoanPageState extends AppController<LoanPage, LoanController> {
  @override
  LoanController createController() => LoanController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TabTitleWidget(),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...widget.loanList.map(
              (item) => Text(item.insurance),
            ),
          ],
        ),
      ),
    );
  }
}
