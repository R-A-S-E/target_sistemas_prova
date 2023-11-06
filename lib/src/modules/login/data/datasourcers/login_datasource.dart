import 'package:target_sistemas_prova/src/modules/login/domain/entities/login_entity.dart';

abstract class LoginDataSource {
  Future<String> login(LoginEntity loginEntity);
}

class LoginDataSourceImpl implements LoginDataSource {
  @override
  Future<String> login(LoginEntity loginEntity) async {
    await Future.delayed(const Duration(seconds: 2));
    return 'success';
  }
}
