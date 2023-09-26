import 'package:either_dart/either.dart';

import '../../infra/repositories/repository.dart';
import '../entitites/expenses_entity.dart';

class GetExpenseListUsecase {
  final Repository _repository;

  GetExpenseListUsecase({
    required Repository repository,
  }) : _repository = repository;

   Future<Either<dynamic, List<ExpenseEntity>>> call() async {
    return await _repository.getExpensesList();
  }
}
