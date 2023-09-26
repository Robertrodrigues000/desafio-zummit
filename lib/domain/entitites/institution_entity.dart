import 'package:equatable/equatable.dart';

class InstitutionEntity extends Equatable {
  final String key;
  final String value;

  const InstitutionEntity({
    required this.key,
    required this.value,
  });

  InstitutionEntity copyWith({
    String? key,
    String? value,
  }) {
    return InstitutionEntity(
      key: key ?? this.key,
      value: value ?? this.value,
    );
  }

  @override
  List<Object?> get props => [key, value];
}
