import 'package:equatable/equatable.dart';

class LoanEntity extends Equatable {
  final double tax;
  final int installments;
  final double installmentValue;
  final String insurance;

  const LoanEntity({
    required this.tax,
    required this.installments,
    required this.installmentValue,
    required this.insurance,
  });

  LoanEntity copyWith({
    double? tax,
    int? installments,
    double? installmentValue,
    String? insurance,
    String? institution,
  }) {
    return LoanEntity(
      tax: tax ?? this.tax,
      installments: installments ?? this.installments,
      installmentValue: installmentValue ?? this.installmentValue,
      insurance: insurance ?? this.insurance,
    );
  }

  @override
  List<Object?> get props => [
        tax,
        installments,
        installmentValue,
        insurance,
      ];
}
