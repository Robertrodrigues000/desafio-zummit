import 'package:equatable/equatable.dart';
import 'package:zummit/domain/entitites/loan_entity.dart';

class LoanInstitutionEntity extends Equatable {
  final String institution;
  final List<LoanEntity> loanList;

  const LoanInstitutionEntity({
    required this.institution,
    required this.loanList,
  });

  LoanInstitutionEntity copyWith({
    String? institution,
    List<LoanEntity>? loanList,
  }) {
    return LoanInstitutionEntity(
      institution: institution ?? this.institution,
      loanList: loanList ?? this.loanList,
    );
  }

  @override
  List<Object?> get props => [institution, loanList];
}
