import 'package:either_dart/either.dart';

import '../../infra/repositories/repository.dart';
import '../entitites/expenses_entity.dart';

class DeleteExpenseUsecase {
  final Repository _repository;

  DeleteExpenseUsecase({
    required Repository repository,
  }) : _repository = repository;

  Future<Either<dynamic, void>> call({
    required ExpenseEntity expense,
  }) async {
    return await _repository.deleteExpense(
      expense: expense,
    );
  }
}
