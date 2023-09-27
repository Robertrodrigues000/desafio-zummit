import 'package:either_dart/either.dart';
import 'package:dio/dio.dart';

import '../../domain/entitites/institution_entity.dart';
import '../../domain/entitites/insurance_entity.dart';
import '../../domain/entitites/loan_institution_entity.dart';
import '../../domain/repositories/repository.dart';
import '../../external/datasource/datasource.dart';

class Repository extends IRepository {
  final Datasource _datasource;
  Repository({required Datasource datasource}) : _datasource = datasource;

  @override
  Future<Either<Exception, List<InstitutionEntity>>> getInstitutions() async {
    try {
      List<InstitutionEntity> response = await _datasource.getInstitutions();
      return Right(response);
    } on DioException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, List<InsuranceEntity>>> getInsurances() async {
    try {
      List<InsuranceEntity> response = await _datasource.getInsurances();
      return Right(response);
    } on DioException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, List<LoanInstitutionEntity>>> simulation({
    List<InstitutionEntity>? institutionList,
    List<InsuranceEntity>? insuranceList,
    int? installment,
    required double value,
  }) async {
    try {
      List<LoanInstitutionEntity> response = await _datasource.simulation(
        institutionList: institutionList,
        insuranceList: insuranceList,
        installment: installment,
        value: value,
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(e);
    }
  }
}
