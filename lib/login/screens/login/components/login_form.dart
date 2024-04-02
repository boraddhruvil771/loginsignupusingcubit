import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../signup/ui/formvalidationpage.dart';
import '../../../cubit/login/login_cubit.dart';
import '../../dashboard/dashboard.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
      if (state is OnSuccessValidation) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Dashboard()),
        );
      }
    }, builder: (context, state) {
      if (state is OnSuccessValidation) {
        return Container();
      }
      // else if (state is LoginFormValidationState) {

      // }
      return buildLoginForm(state as LoginFormValidationState, context);
    });
  }

  Widget buildLoginForm(LoginFormValidationState state, BuildContext context) {
    final loginForm = state.loginForm;

    if (kIsWeb) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: SizedBox(
              width: 400,
              child: Center(
                child: Column(
                  children: [
                    Image.network('https://picsum.photos/250?image=9'),
                    const SizedBox(height: 12.0),
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: Colors.black12,
            width: 600,
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Enter your login details'),
                  const SizedBox(height: 8.0),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Enter email",
                      border: const OutlineInputBorder(),
                      errorText: !loginForm.email.isInValid ? null : loginForm.email.errorMsg,
                    ),
                    onChanged: (email) => context.read<LoginCubit>().onChangeOfEmail(email),
                  ),
                  const SizedBox(height: 8.0),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Enter Password",
                      border: const OutlineInputBorder(),
                      errorMaxLines: 3,
                      errorText: !loginForm.password.isInValid ? null : loginForm.password.errorMsg,
                    ),
                    onChanged: (pass) => context.read<LoginCubit>().onChanngeOfPassword(pass),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: raisedButtonStyle,
                    onPressed: loginForm.isFormValid ? () => context.read<LoginCubit>().verifyUser() : null,
                    child: const Text("Login"),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: raisedButtonStyle,
                    child: const Text("Sign up"),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FormValidationPage()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network('https://picsum.photos/250?image=9'),
            const SizedBox(height: 12.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Enter email",
                border: const OutlineInputBorder(),
                errorText: !loginForm.email.isInValid ? null : loginForm.email.errorMsg,
              ),
              onChanged: (email) => context.read<LoginCubit>().onChangeOfEmail(email),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Enter Password",
                border: const OutlineInputBorder(),
                errorMaxLines: 3,
                errorText: !loginForm.password.isInValid ? null : loginForm.password.errorMsg,
              ),
              onChanged: (pass) => context.read<LoginCubit>().onChanngeOfPassword(pass),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: raisedButtonStyle,
              autofocus: false,
              onPressed: loginForm.isFormValid ? context.read<LoginCubit>().verifyUser : null,
              child: const Text("Login"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: raisedButtonStyle,
              autofocus: false,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FormValidationPage()));
              },
              child: const Text("Sign up"),
            ),
          ],
        ),
      );
    }
  }
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  // onPrimary: Colors.black87,
  // primary: Colors.grey[300],
  // minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 20),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);
