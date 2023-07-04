import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'register.dart';
import 'forget_password.dart';
import 'home.dart';

//Linhas de código abaixo para conseguir captar o FirebaseAuthException
String parseFirebaseAuthExceptionMessage(
    {String plugin = "auth", required String? input}) {
  if (input == null) {
    return "unknown";
  }

  String regexPattern = r'(?<=\(' + plugin + r'/)(.*?)(?=\)\.)';
  RegExp regExp = RegExp(regexPattern);
  Match? match = regExp.firstMatch(input);
  if (match != null) {
    return match.group(0)!;
  }

  return "unknown";
}

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _loginUser(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      final code = parseFirebaseAuthExceptionMessage(input: e.message);

      if (code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password Provided isnt valid')));
      } else if (code == 'invalid-email' || code == 'user-not-found') {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('User not found')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional(0.6, -1),
              child: Column(
                children: [
                  SizedBox(height: 25),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5),
                    ),
                    width: 350,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 35, right: 35, top: 10, bottom: 3),
                      child: Column(
                        children: [
                          Container(
                            height: 140,
                            width: 250,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "../imagens/logoGPROBranco.png"),
                                    fit: BoxFit.fill)),
                            child: const Text(''),
                          ),
                          SizedBox(height: 20),
                          TextField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'E-mail',
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            style: TextStyle(color: Colors.black),
                            controller: passwordController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 0.5),
                              ),
                              labelText: 'Senha',
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            obscureText: true,
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(350, 45),
                                backgroundColor:
                                    Color.fromARGB(255, 50, 39, 85),
                                textStyle: TextStyle(
                                  fontSize: 18,
                                )),
                            onPressed: () => _loginUser(context),
                            child: const Text('Entrar'),
                          ),
                          const SizedBox(height: 20),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgetPasswordPage()),
                              );
                            },
                            child: const Text(
                              'Esqueceu a senha?',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          SizedBox(height: 20)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 60,
                    width: 350,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Não tem uma conta?"),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()),
                            );
                          },
                          child: const Text("Cadastre-se"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
            // Fim formulario de login
            Container(
              child: Column(
                children: [
                  Container(
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 80),
                        Text("Sobre"),
                        SizedBox(width: 25),
                        Text("Privacidade"),
                        SizedBox(width: 25),
                        Text("Termo de uso"),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("© 2023 GPRO"),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
