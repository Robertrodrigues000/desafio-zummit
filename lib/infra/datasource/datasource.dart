import '../../domain/entitites/institution_entity.dart';
import '../../domain/entitites/insurance_entity.dart';

abstract class IDatasource {
  Future<List<InstitutionEntity>> getInstitutions();
  Future<List<InsuranceEntity>> getInsurances();
}
