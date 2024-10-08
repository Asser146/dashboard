import 'package:dashboard/core/routing/routes.dart';
import 'package:dashboard/core/theming/styles.dart';
import 'package:dashboard/features/auth/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.usernameController,
    required this.passwordController,
  });

  final TextEditingController usernameController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          final username = usernameController.text;
          final password = passwordController.text;
          final token = username + password;

          if (token.isEmpty || !await context.read<LoginCubit>().login(token)) {
            showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Invalid Credintial'),
                    content: const SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text('Check Username and Password'),
                          Text("If you don't have an account Register one"),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('ok'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                });
          } else {
            Navigator.of(context).pushNamed(Routes.main);
          }
        },
        child: Text('Login',
            style: TextStyles.titleLargeLightMode.copyWith(fontSize: 5.sp)));
  }
}
