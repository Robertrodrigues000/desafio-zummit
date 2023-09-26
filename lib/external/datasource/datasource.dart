import 'dart:convert';

import 'package:http/http.dart';

import '../../domain/entitites/institution_entity.dart';
import '../../infra/datasource/datasource.dart';
import '../mappers/expense_mapper.dart';

class Datasource extends IDatasource {
  String get urlPrefix => 'http://127.0.0.1:8000/api';

  @override
  Future<List<InstitutionEntity>> getInstitutions() async {
    final uri = Uri.parse('http://10.0.2.2:8000/api/instituicao');

    Response response = await get(
      uri,
    );

    var data = jsonDecode(response.body);

    List<InstitutionEntity> data2 = (data as List)
        .map((item) => InstitutionMapper.fromMap(item))
        .toList();

    return data2;
  }
}
