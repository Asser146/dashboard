import 'package:dashboard/core/routing/routes.dart';
import 'package:dashboard/core/theming/styles.dart';
import 'package:dashboard/features/auth/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({
    super.key,
    required this.usernameController,
    required this.passwordController,
  });

  final TextEditingController usernameController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 70.w, vertical: 30.h),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              children: [
                SizedBox(height: 35.h),
                const Text(
                  "A-Store",
                ),
                SizedBox(height: 50.h),
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(labelText: 'Username'),
                ),
                SizedBox(height: 20.h),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                SizedBox(height: 50.h),
                ElevatedButton(
                    onPressed: () {
                      final username = usernameController.text;
                      final password = passwordController.text;
                      final token = username + password;

                      if (token.isNotEmpty) {
                        context.read<LoginCubit>().register(token);
                        Navigator.of(context).pushNamed(Routes.main);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Invalid credentials')),
                        );
                      }
                    },
                    child: Text('Register',
                        style: TextStyles.titleLargeLightMode
                            .copyWith(fontSize: 5.sp))),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Already Have an Account?",
                        style: TextStyles.hintTextLightMode
                            .copyWith(fontSize: 5.sp)),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.login,
                            arguments: 1);
                      },
                      child: Text("Login",
                          style: TextStyles.hintTextLightMode
                              .copyWith(fontSize: 6.sp, color: Colors.blue)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
