import 'package:flutter/material.dart';
import 'package:target_sistemas_prova/src/modules/login/domain/entities/login_entity.dart';
import 'package:target_sistemas_prova/src/modules/login/domain/repositories/login_repository.dart';
import 'package:target_sistemas_prova/src/modules/shared/services/api_response_status.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginController {
  LoginController(this.repository);
  final LoginRepository repository;

  final ValueNotifier<APIResponse<String>> status =
      ValueNotifier(APIResponse.none());

  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final Uri _url = Uri.parse('https://google.com.br');

  Future<void> privacyLaunch() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  Future<void> signIn() async {
    status.value = APIResponse.loading();
    status.value = await repository.login(
      LoginEntity(
        user: userController.text,
        password: passwordController.text,
      ),
    );
  }
}
