import 'package:either_dart/either.dart';
import 'package:zummit/domain/entitites/insurance_entity.dart';

import '../../infra/repositories/repository.dart';

class GetInsurancesUsecase {
  final Repository _repository;

  GetInsurancesUsecase({
    required Repository repository,
  }) : _repository = repository;

  Future<Either<dynamic, List<InsuranceEntity>>> call() async {
    return await _repository.getInsurances();
  }
}
