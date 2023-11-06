import 'package:target_sistemas_prova/src/modules/login/data/datasourcers/login_datasource.dart';
import 'package:target_sistemas_prova/src/modules/login/domain/entities/login_entity.dart';
import 'package:target_sistemas_prova/src/modules/shared/services/api_response_status.dart';

import '../../domain/repositories/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  LoginRepositoryImpl(this.dataSource);
  final LoginDataSource dataSource;

  @override
  Future<APIResponse<String>> login(LoginEntity login) async {
    try {
      final loginResponse = await dataSource.login(login);
      return APIResponse.success(loginResponse);
    } catch (e) {
      return APIResponse.error(e.toString());
    }
  }
}
