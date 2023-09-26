import 'package:faker/faker.dart';

import '../../domain/entitites/institution_entity.dart';

class InstitutionMapper {
  static InstitutionEntity fromMap(Map<String, dynamic> map) {
    return InstitutionEntity(
      key: map['chave'],
      value: map['valor'],
    );
  }

  static InstitutionEntity fake() {
    return InstitutionEntity(
      key: faker.randomGenerator.string(5),
      value: faker.randomGenerator.string(5),
    );
  }
}
