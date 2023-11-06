import 'package:shared_preferences/shared_preferences.dart';

abstract class HomeDataSource {
  Future<List<String>> getListToDo();

  Future<List<String>> editToDo(List<String> toDoList);
}

class HomeDataSourceImpl implements HomeDataSource {
  @override
  Future<List<String>> getListToDo() async {
    await Future.delayed(const Duration(seconds: 1));
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? items = prefs.getStringList('todo');
    return items ?? [];
  }

  @override
  Future<List<String>> editToDo(List<String> toDoList) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('todo', toDoList);
      return toDoList;
    } catch (e) {
      rethrow;
    }
  }
}
