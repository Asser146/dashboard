import 'package:dashboard/core/routing/routes.dart';
import 'package:dashboard/core/theming/styles.dart';
import 'package:dashboard/features/auth/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
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
                LoginButton(
                    usernameController: usernameController,
                    passwordController: passwordController),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("New to A-Store?",
                        style: TextStyles.hintTextLightMode
                            .copyWith(fontSize: 5.sp)),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Routes.register,
                        );
                      },
                      child: Text("Register",
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
