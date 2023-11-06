// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  late final _$statusAtom =
      Atom(name: 'HomeControllerBase.status', context: context);

  @override
  APIResponse<List<String>> get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(APIResponse<List<String>> value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$listToDOAtom =
      Atom(name: 'HomeControllerBase.listToDO', context: context);

  @override
  ObservableList<String> get listToDO {
    _$listToDOAtom.reportRead();
    return super.listToDO;
  }

  @override
  set listToDO(ObservableList<String> value) {
    _$listToDOAtom.reportWrite(value, super.listToDO, () {
      super.listToDO = value;
    });
  }

  late final _$HomeControllerBaseActionController =
      ActionController(name: 'HomeControllerBase', context: context);

  @override
  void setStatus(APIResponse<List<String>> value) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.setStatus');
    try {
      return super.setStatus(value);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
listToDO: ${listToDO}
    ''';
  }
}
