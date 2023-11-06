import 'package:target_sistemas_prova/src/modules/login/domain/entities/login_entity.dart';
import 'package:target_sistemas_prova/src/modules/shared/services/api_response_status.dart';

abstract class LoginRepository {
  Future<APIResponse<String>> login(LoginEntity login);
}
