import 'package:either_dart/either.dart';

import '../entitites/institution_entity.dart';

abstract class IRepository {

  Future<Either<Exception, List<InstitutionEntity>>> getInstitutions();
}
