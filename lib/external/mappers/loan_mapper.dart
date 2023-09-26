import '../../domain/entitites/loan_entity.dart';

class LoanMapper {
  static LoanEntity fromMap(Map<String, dynamic> map) {
    return LoanEntity(
      tax: map['taxa'],
      installmentValue: map['valor_parcela'],
      installments: map['parcelas'],
      insurance: map['convenio'], 
      institution: map['convenio'],
    );
  }

}
