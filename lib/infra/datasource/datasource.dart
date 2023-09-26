import '../../domain/entitites/institution_entity.dart';

abstract class IDatasource {
  Future<List<InstitutionEntity>> getInstitutions();
}
