import 'package:either_dart/either.dart';
import 'package:zummit/domain/entitites/loan_entity.dart';

import '../../infra/repositories/repository.dart';
import '../entitites/institution_entity.dart';
import '../entitites/insurance_entity.dart';

class GetSimulationUsecase {
  final Repository _repository;

  GetSimulationUsecase({
    required Repository repository,
  }) : _repository = repository;

  Future<Either<dynamic, List<LoanEntity>>> call({
    List<InstitutionEntity>? institutionList,
    List<InsuranceEntity>? insuranceList,
    int? installment,
    required double value,
  }) async {
    return await _repository.simulation(
    institutionList : institutionList,
     insuranceList: insuranceList,
     installment : installment,
    value : value,
  );
  }
}
