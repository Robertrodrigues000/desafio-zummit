import '../../domain/entitites/institution_entity.dart';
import '../../domain/entitites/insurance_entity.dart';
import '../../domain/entitites/loan_institution_entity.dart';

abstract class IDatasource {
  Future<List<InstitutionEntity>> getInstitutions();
  Future<List<InsuranceEntity>> getInsurances();
  Future<List<LoanInstitutionEntity>> simulation({
    List<InstitutionEntity>? institutionList,
    List<InsuranceEntity>? insuranceList,
    int? installment,
    required double value,
  });
}
