import 'package:faker/faker.dart';

import '../../domain/entitites/insurance_entity.dart';

class InsuranceMapper {
  static InsuranceEntity fromMap(Map<String, dynamic> map) {
    return InsuranceEntity(
      key: map['chave'],
      value: map['valor'],
    );
  }

  static InsuranceEntity fake() {
    return InsuranceEntity(
      key: faker.randomGenerator.string(5),
      value: faker.randomGenerator.string(5),
    );
  }
}
