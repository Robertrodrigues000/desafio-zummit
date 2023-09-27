import 'package:either_dart/either.dart';

import '../entitites/institution_entity.dart';
import '../entitites/insurance_entity.dart';
import '../entitites/loan_institution_entity.dart';

abstract class IRepository {

  Future<Either<Exception, List<InstitutionEntity>>> getInstitutions();

  Future<Either<Exception, List<InsuranceEntity>>> getInsurances();

  Future<Either<Exception, List<LoanInstitutionEntity>>> simulation({
    List<InstitutionEntity>? institutionList,
    List<InsuranceEntity>? insuranceList,
    int? installment,
    required double value,
  });
}
