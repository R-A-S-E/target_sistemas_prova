import 'package:target_sistemas_prova/src/modules/home/data/datasourcers/home_datasource.dart';
import 'package:target_sistemas_prova/src/modules/home/domain/repositories/home_repository.dart';

import 'package:target_sistemas_prova/src/modules/shared/services/api_response_status.dart';

class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl(this.dataSource);
  final HomeDataSource dataSource;

  @override
  Future<APIResponse<List<String>>> getListToDo() async {
    try {
      final loginResponse = await dataSource.getListToDo();
      return APIResponse.success(loginResponse);
    } catch (e) {
      return APIResponse.error(e.toString());
    }
  }

  @override
  Future<APIResponse<List<String>>> editToDo(List<String> toDoList) async {
    try {
      final loginResponse = await dataSource.editToDo(toDoList);
      return APIResponse.success(loginResponse);
    } catch (e) {
      return APIResponse.error(e.toString());
    }
  }
}
