import 'package:flutter_modular/flutter_modular.dart';
import '../domain/usecases/get_institutions_usecase.dart';
import '../external/datasource/datasource.dart';
import '../domain/repositories/repository.dart';
import '../infra/datasource/datasource.dart';
import '../infra/repositories/repository.dart';
import '../presenter/pages/form/form_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<IDatasource>(
          (i) => Datasource(),
        ),
        Bind.lazySingleton<IRepository>(
          (i) => Repository(datasource: i.get()),
        ),
        Bind.lazySingleton(
          (i) => GetInstitutionsUsecase(repository: i.get()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const FormPage(),
        ),
      ];
}
