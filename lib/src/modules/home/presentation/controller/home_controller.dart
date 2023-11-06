import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:target_sistemas_prova/src/modules/home/domain/repositories/home_repository.dart';
import 'package:target_sistemas_prova/src/modules/shared/services/api_response_status.dart';
import 'package:url_launcher/url_launcher.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  HomeControllerBase(this.repository);
  final HomeRepository repository;

  final TextEditingController todoController = TextEditingController();

  final Uri _url = Uri.parse('https://google.com.br');

  Future<void> privacyLaunch() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @observable
  APIResponse<List<String>> status = APIResponse.none();

  @action
  void setStatus(APIResponse<List<String>> value) => status = value;

  @observable
  ObservableList<String> listToDO = ObservableList.of([]);

  Future<void> getTodoList() async {
    setStatus(APIResponse.loading());

    var data = await repository.getListToDo();

    setStatus(data);

    listToDO.addAll(status.data ?? []);
  }

  Future<void> addTodo() async {
    setStatus(APIResponse.loading());

    listToDO.add(todoController.text);

    todoController.text = '';

    var data = await repository.editToDo(listToDO);

    setStatus(data);

    listToDO = ObservableList.of(data.data ?? []);
  }

  Future<void> removeTodo(String todo) async {
    setStatus(APIResponse.loading());

    listToDO.remove(todo);

    var data = await repository.editToDo(listToDO);

    setStatus(data);

    listToDO = ObservableList.of(data.data ?? []);
  }

  Future<void> editTodo(String todo) async {
    listToDO.remove(todo);

    todoController.text = todo;
  }
}
