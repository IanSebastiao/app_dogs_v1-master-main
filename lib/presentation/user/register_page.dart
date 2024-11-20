import 'package:app_dogs/data/repositories/user_repository.dart';
import 'package:app_dogs/presentation/viewmodels/user_viewmodel.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final UserViewmodel userViewmodel = UserViewmodel(UserRepository());

  registerUser() async {
    final email = emailController.text;
    final usuario = usuarioController.text;
    final senha = senhaController.text;

    final message = await userViewmodel.registerUser(email, usuario, senha);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor:
            message.contains("Sucesso") ? Colors.green : Colors.red,
      ));

      if (message.contains("Sucesso")) {
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => const loginPage()),
        // );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
