import 'dart:convert';

import 'package:http/http.dart';
import 'package:zummit/domain/entitites/loan_entity.dart';
import 'package:zummit/external/mappers/insurance_mapper.dart';
import 'package:zummit/external/mappers/loan_mapper.dart';

import '../../domain/entitites/institution_entity.dart';
import '../../domain/entitites/insurance_entity.dart';
import '../../infra/datasource/datasource.dart';
import '../mappers/institution_mapper.dart';

class Datasource extends IDatasource {
  String get urlPrefix => 'http://10.0.2.2:8000/api';

  @override
  Future<List<InstitutionEntity>> getInstitutions() async {
    final uri = Uri.parse('$urlPrefix/instituicao');

    Response response = await get(
      uri,
    );

    var data = jsonDecode(response.body);

    List<InstitutionEntity> data2 =
        (data as List).map((item) => InstitutionMapper.fromMap(item)).toList();

    return data2;
  }

  @override
  Future<List<InsuranceEntity>> getInsurances() async {
    final uri = Uri.parse('$urlPrefix/convenio');

    Response response = await get(
      uri,
    );

    var data = jsonDecode(response.body);

    List<InsuranceEntity> data2 =
        (data as List).map((item) => InsuranceMapper.fromMap(item)).toList();

    return data2;
  }

  @override
  Future<List<LoanEntity>> simulation({
    required double value,
    List<InstitutionEntity>? institutionList,
    List<InsuranceEntity>? insuranceList,
    int? installment,
  }) async {
    final uri = Uri.parse('$urlPrefix/simular');

    Response response = await post(
      uri,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json"
      },
      body: jsonEncode({
        "valor_emprestimo": 50,
        "instituicoes":[],
        "convenios":[],
        "parcela": 0,
      }),
    );

    var data = jsonDecode(response.body);

    List<LoanEntity> data2 =
        (data as List).map((item) => LoanMapper.fromMap(item)).toList();

    return data2;
  }
}
