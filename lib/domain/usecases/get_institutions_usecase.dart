import 'package:either_dart/either.dart';
import 'package:zummit/domain/entitites/institution_entity.dart';

import '../../infra/repositories/repository.dart';

class GetInstitutionsUsecase {
  final Repository _repository;

  GetInstitutionsUsecase({
    required Repository repository,
  }) : _repository = repository;

  Future<Either<dynamic, List<InstitutionEntity>>> call() async {
    return await _repository.getInstitutions();
  }
}
