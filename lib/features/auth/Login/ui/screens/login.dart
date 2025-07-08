import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/themes/app_color.dart';
import 'package:untitled/core/widgets/custom_text_auth.dart';
import 'package:untitled/core/widgets/custom_text_form_fild.dart';
import 'package:untitled/features/auth/Login/ui/cubit/login_cubit.dart';
import 'package:untitled/core/utils/appuits.dart'; // تأكد من أن هذه الدالة تتحقق من صحة الإيميل

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            final loginCubit = context.read<LoginCubit>();

            return Padding(
              padding: const EdgeInsets.all(32.0),
              child: Form(
                key: loginCubit.formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextAuth(text: "Welcome\nBack!"),
                    const SizedBox(height: 40),

                    // Email Field
                    CustomTextFormFild(
                      hintText: "Username or Email",
                      prefixIcon: Icons.person,
                      keyboardType: TextInputType.emailAddress,
                      controller: loginCubit.emilController,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your email";
                        }
                        if (!AppUits.isEmailValid(value.trim())) {
                          return "Please enter a valid email address";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    // Password Field
                    CustomTextFormFild(
                      hintText: "Password",
                      prefixIcon: Icons.lock,
                      obscureText: loginCubit.obscureText,
                      controller: loginCubit.passwordController,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your password";
                        }
                        if (value.length < 6) {
                          return "Password must be at least 6 characters";
                        }
                        return null;
                      },
                      suffixIcon: loginCubit.obscureText
                          ? Icons.visibility
                          : Icons.visibility_off,
                      onSuffixTap: () {
                        setState(() {
                          loginCubit.toggleobscureText();
                        });
                      },
                    ),

                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child:   TextButton(onPressed: (){},
                        child: Text("Forget Password ?",style: TextStyle(
                            color: Colors.pink,
                            fontWeight: FontWeight.bold,
                            fontSize: 12
                        ),)),
                  ),

                    const SizedBox(height: 30),
                    //Login Button
                    ElevatedButton(
                      onPressed: () {
                        if (loginCubit.formkey.currentState!.validate()) {
                          loginCubit.login();
                        }
                      },
                      child: const Text("Login"),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
