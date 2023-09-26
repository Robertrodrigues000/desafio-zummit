import 'package:either_dart/either.dart';

import '../../infra/repositories/repository.dart';
import '../entitites/expenses_entity.dart';

class EditExpenseUsecase {
  final Repository _repository;

  EditExpenseUsecase({
    required Repository repository,
  }) : _repository = repository;

  Future<Either<dynamic, ExpenseEntity>> call({
    required ExpenseEntity expense,
  }) async {
    return await _repository.editExpense(
      expense: expense,
    );
  }
}
