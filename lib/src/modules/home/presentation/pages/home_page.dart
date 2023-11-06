import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:target_sistemas_prova/src/modules/home/presentation/controller/home_controller.dart';
import 'package:target_sistemas_prova/src/modules/home/presentation/widgets/todo_tile_widget.dart';
import 'package:target_sistemas_prova/src/modules/login/presentation/widgets/text_field_widget.dart';
import 'package:target_sistemas_prova/src/modules/shared/constants/app_gradient.dart';
import 'package:target_sistemas_prova/src/modules/shared/widgets/delete_dialog_widget.dart';
import 'package:target_sistemas_prova/src/modules/shared/widgets/loading_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FocusNode focus;
  late HomeController controller;

  @override
  void initState() {
    controller = GetIt.I.get<HomeController>();

    focus = FocusNode(canRequestFocus: true);
    focus.requestFocus();
    controller.getTodoList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return LoadingWidget(
          isLoading: controller.status.isLoading,
          child: Scaffold(
            body: Container(
              decoration:
                  const BoxDecoration(gradient: AppGradient.blueGreenLinear),
              child: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white),
                            child: ListView.builder(
                              itemCount: controller.listToDO.length,
                              itemBuilder: (context, index) => TodoTileWidget(
                                title: controller.listToDO[index],
                                onTapEdit: () => controller
                                    .editTodo(controller.listToDO[index]),
                                onTapDelete: () => showDialog(
                                  context: context,
                                  builder: (context) {
                                    return DeleteDialogWidget(
                                        onTapDelete: () {
                                          Navigator.pop(context);
                                          controller.removeTodo(
                                              controller.listToDO[index]);
                                        },
                                        text: controller.listToDO[index]);
                                  },
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 42),
                          TextFieldWidget(
                            onEditingComplete: () => controller.addTodo(),
                            textInputAction: TextInputAction.done,
                            controller: controller.todoController,
                            hintText: 'Digite seu texto',
                            focusNode: focus,
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () async => controller.privacyLaunch(),
                        child: const Text(
                          'Politica de Privacidade',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
