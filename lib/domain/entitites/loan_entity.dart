import 'package:equatable/equatable.dart';

class LoanEntity extends Equatable {
  final double tax;
  final int installments;
  final int installmentValue;
  final String insurance;
  final String institution;

  const LoanEntity({
    required this.tax,
    required this.installments,
    required this.installmentValue,
    required this.insurance,
    required this.institution,
  });

  LoanEntity copyWith({
    double? tax,
    int? installments,
    int? installmentValue,
    String? insurance,
    String? institution,
  }) {
    return LoanEntity(
      tax: tax ?? this.tax,
      installments: installments ?? this.installments,
      installmentValue: installmentValue ?? this.installmentValue,
      insurance: insurance ?? this.insurance,
      institution: institution ?? this.institution,
    );
  }

  @override
  List<Object?> get props => [
        tax,
        installments,
        installmentValue,
        insurance,
        institution
      ];
}
