import 'package:either_dart/either.dart';

import '../entitites/institution_entity.dart';
import '../entitites/insurance_entity.dart';

abstract class IRepository {

  Future<Either<Exception, List<InstitutionEntity>>> getInstitutions();

  Future<Either<Exception, List<InsuranceEntity>>> getInsurances();
}
