import 'package:either_dart/either.dart';
import 'package:dio/dio.dart';

import '../../domain/entitites/institution_entity.dart';
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
}
