import 'package:target_sistemas_prova/src/modules/shared/services/api_response_status.dart';

abstract class HomeRepository {
  Future<APIResponse<List<String>>> getListToDo();

  Future<APIResponse<List<String>>> editToDo(List<String> toDoList);
}
