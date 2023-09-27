import '../../domain/entitites/loan_institution_entity.dart';
import 'loan_mapper.dart';

class LoanInstitutionMapper {
  static LoanInstitutionEntity fromMap(String key, List<dynamic> list) {
    return LoanInstitutionEntity(
      institution: key,
      loanList: list.map((e) => LoanMapper.fromMap(e)).toList(),
    );
  }
}
