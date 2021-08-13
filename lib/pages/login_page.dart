import 'package:flutter/material.dart';
import 'package:flutter_task/exceptions/auth_exception.dart';
import 'package:flutter_task/repositories/auth_repository.dart';
import 'package:flutter_task/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_task/widgets/custom_text_field.dart';
import 'package:flutter_task/widgets/submit_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final FocusNode focus1 = FocusNode();
  final FocusNode focus2 = FocusNode();
  String? email;
  String? password;
  void updateState(int c, String value) {
    switch (c) {
      case 1:
        setState(() {
          email = value;
        });
        return;
      case 2:
        setState(() {
          password = value;
        });
        return;
      default:
        return;
    }
  }

  String? emailValidator(String? email) {
    final emailRegEx =
        r"""^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$""";
    if (!RegExp(emailRegEx).hasMatch(email!)) {
      return 'enter a valid email address';
    }
  }

  onSubmit() async {
    focus1.unfocus();
    focus2.unfocus();
    if (formKey.currentState!.validate()) {
      try {
        await context
            .read(authRepositoryProvider)
            .login(email: email!, password: password!);
        context.router.replace(VerifyRoute());
      } catch (e) {
        if (e is AuthException) {
          ScaffoldMessenger.of(context)
              .showSnackBar(new SnackBar(content: Text(e.message.toString())));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: GoogleFonts.dancingScript(
              textStyle: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
        ),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                context.router.replace(SignInPageRoute());
              },
              child: Text(
                'Signin',
                style: GoogleFonts.dancingScript(
                    textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ))
        ],
      ),
      body: Container(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              custumTextField(context, Icons.email, "email", false,
                  emailValidator, updateState, 1, focus1),
              custumTextField(context, Icons.password, "password", true, null,
                  updateState, 2, focus2),
              submitButton(context, onSubmit, 'login')
            ],
          ),
        ),
      ),
    );
  }
}
