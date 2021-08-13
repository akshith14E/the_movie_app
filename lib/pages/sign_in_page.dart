import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/exceptions/auth_exception.dart';
import 'package:flutter_task/models/user_model.dart';
import 'package:flutter_task/repositories/auth_repository.dart';
import 'package:flutter_task/routes/router.gr.dart';
import 'package:flutter_task/widgets/custom_text_field.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task/widgets/submit_button.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formKey = GlobalKey<FormState>();
  String? name, email, password;
  FocusNode focus1 = FocusNode();

  FocusNode focus2 = FocusNode();

  FocusNode focus3 = FocusNode();

  String? emailValidator(String? email) {
    final emailRegEx =
        r"""^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$""";
    if (!RegExp(emailRegEx).hasMatch(email!)) {
      return 'enter a valid email address';
    }
  }

  String? passwordValidator(String? password) {
    if (password!.length < 2) {
      return 'password too short';
    }
  }

  String? nameValidator(String? name) {
    if (name!.length < 3) {
      return 'name too short';
    }
  }

  onSubmit() async {
    focus1.unfocus();

    focus2.unfocus();

    focus3.unfocus();
    if (formKey.currentState!.validate()) {
      try {
        final user = User(email: email!, password: password!, name: name!);
        await context.read(authRepositoryProvider).signIn(user);
        context.router.replace(VerifyRoute());
      } catch (e) {
        if (e is AuthException)
          ScaffoldMessenger.of(context)
              .showSnackBar(new SnackBar(content: Text(e.message.toString())));
      }
    }
  }

  void updateState(int c, String value) {
    switch (c) {
      case 1:
        setState(() {
          name = value;
        });
        return;
      case 2:
        setState(() {
          email = value;
        });
        return;
      case 3:
        setState(() {
          password = value;
        });
        return;
      default:
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In",
            style: GoogleFonts.dancingScript(
                textStyle:
                    TextStyle(fontSize: 32, fontWeight: FontWeight.bold))),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                context.router.replace(LoginPageRoute());
              },
              child: Text(
                'Login',
                style: GoogleFonts.dancingScript(
                    textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                custumTextField(context, Icons.person, 'Name', false,
                    nameValidator, updateState, 1, focus1),
                custumTextField(context, Icons.email, 'Email', false,
                    emailValidator, updateState, 2, focus2),
                custumTextField(context, Icons.password, 'Password', true,
                    passwordValidator, updateState, 3, focus3),
                submitButton(context, onSubmit, 'Signin')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
