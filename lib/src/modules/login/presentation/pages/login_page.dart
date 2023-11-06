import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:target_sistemas_prova/src/modules/login/presentation/controller/login_controller.dart';
import 'package:target_sistemas_prova/src/modules/login/presentation/widgets/text_field_widget.dart';
import 'package:target_sistemas_prova/src/modules/shared/constants/app_gradient.dart';
import 'package:target_sistemas_prova/src/modules/shared/widgets/loading_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController controller;
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    controller = GetIt.I.get<LoginController>();
    formKey = GlobalKey();

    controller.status.addListener(() {
      if (controller.status.value.isSuccess) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: controller.status,
        builder: (_, status, ___) {
          return LoadingWidget(
            isLoading: status.isLoading,
            child: Scaffold(
              body: Container(
                decoration:
                    const BoxDecoration(gradient: AppGradient.blueGreenLinear),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFieldWidget(
                                prefixIcon: const Icon(Icons.person),
                                labelText: 'Usuário',
                                controller: controller.userController,
                                validator: (value) =>
                                    value != null && value.isEmpty
                                        ? 'Digite o seu usuário'
                                        : null,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    RegExp("^[a-zA-Z0-9,.^?~=+-_/*]{0,20}"),
                                  )
                                ],
                              ),
                              const SizedBox(height: 30),
                              TextFieldWidget(
                                prefixIcon: const Icon(Icons.lock),
                                controller: controller.passwordController,
                                validator: (value) =>
                                    value != null && value.length <= 2
                                        ? 'Sua senha está pequena'
                                        : null,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    RegExp("^[a-zA-Z0-9]{0,20}"),
                                  )
                                ],
                                obscureText: true,
                                labelText: 'Senha',
                              ),
                              const SizedBox(height: 30),
                              ElevatedButton(
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    controller.signIn();
                                  }
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 32, vertical: 12),
                                  child: Text(
                                    'Entrar',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
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
        });
  }
}
