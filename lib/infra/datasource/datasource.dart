import 'package:zummit/domain/entitites/loan_entity.dart';

import '../../domain/entitites/institution_entity.dart';
import '../../domain/entitites/insurance_entity.dart';

abstract class IDatasource {
  Future<List<InstitutionEntity>> getInstitutions();
  Future<List<InsuranceEntity>> getInsurances();
  Future<List<LoanEntity>> simulation({
    List<InstitutionEntity>? institutionList,
    List<InsuranceEntity>? insuranceList,
    int? installment,
    required double value,
  });
}
