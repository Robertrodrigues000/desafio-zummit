import 'package:equatable/equatable.dart';

class InsuranceEntity extends Equatable {
  final String key;
  final String value;

  const InsuranceEntity({
    required this.key,
    required this.value,
  });

  InsuranceEntity copyWith({
    String? key,
    String? value,
  }) {
    return InsuranceEntity(
      key: key ?? this.key,
      value: value ?? this.value,
    );
  }

  @override
  List<Object?> get props => [key, value];
}
