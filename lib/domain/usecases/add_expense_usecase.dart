import 'package:either_dart/either.dart';

import '../../infra/repositories/repository.dart';
import '../entitites/expenses_entity.dart';

class AddExpenseUsecase {
  final Repository _repository;

  AddExpenseUsecase({
    required Repository repository,
  }) : _repository = repository;

  Future<Either<dynamic, ExpenseEntity>> call({
    required ExpenseEntity expense,
  }) async {
    return await _repository.addExpense(
      expense: expense,
    );
  }
}
