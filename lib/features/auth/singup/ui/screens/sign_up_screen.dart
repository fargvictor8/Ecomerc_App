import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/Components/custom_loading.dart';
import 'package:untitled/core/Routing/routes.dart';
import 'package:untitled/core/constants/app_assets.dart';
import 'package:untitled/core/extensions/navigation_extensions.dart';
import 'package:untitled/core/themes/app_color.dart';
import 'package:untitled/core/widgets/custom_bottun.dart';
import 'package:untitled/core/widgets/custom_login_icon.dart';
import 'package:untitled/core/widgets/custom_text_auth.dart';
import 'package:untitled/core/widgets/custom_text_form_fild.dart';
import 'package:untitled/features/auth/Login/ui/cubit/login_cubit.dart';
import 'package:untitled/core/utils/appuits.dart';

import '../cubit/sign_up.dart'; // تأكد من أن هذه الدالة تتحقق من صحة الإيميل

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _LoginState();
}

class _LoginState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: SafeArea(
          child: BlocConsumer<SignUpCubit, SignUpState>(
            listener: (context,state){
              if (state is SignUpLoading){
                showLoading(context);

              }
              if(state is SignUpSuccess){
                context.back();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.white),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "Sign Up Success!",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    backgroundColor: Colors.green[600],
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: EdgeInsets.all(16),
                    duration: Duration(seconds: 3),
                  ),
                );

                context.pushReplacementNamed(Routes.Login);
              }
               if (state is SignUpError){

                 ScaffoldMessenger.of(context).showSnackBar(
                   SnackBar(
                     content: Row(
                       children: [
                         Icon(Icons.check_circle, color: Colors.white),
                         SizedBox(width: 10),
                         Expanded(
                           child: Text(
                             "Sign Up Failed: ${state.message}",
                             style: TextStyle(fontSize: 16),
                           ),
                         ),
                       ],
                     ),
                     backgroundColor: Colors.red[600],
                     behavior: SnackBarBehavior.floating,
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(12),
                     ),
                     margin: EdgeInsets.all(16),
                     duration: Duration(seconds: 3),
                   ),
                 );
                 context.back();
               }
            },
            builder: (context, state) {
              final signUpCubit = context.read<SignUpCubit>();

              return SingleChildScrollView(
                // عشان لما الكيبورد يفتح ما يغطيش على الفورم
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Form(
                    key: signUpCubit.formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Text Tittel
                        CustomTextAuth(text: "Create An\nAccount"),
                        const SizedBox(height: 45),

                        // Email Field
                        CustomTextFormFild(
                          hintText: "Username or Email",
                          prefixIcon: Icons.person,
                          keyboardType: TextInputType.emailAddress,
                          controller: signUpCubit.emilController,
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
                          obscureText: signUpCubit.obscureText,
                          controller: signUpCubit.passwordController,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your password";
                            }
                            if (value.length < 6) {
                              return "Password must be at least 6 characters";
                            }
                            return null;
                          },
                          suffixIcon: signUpCubit.obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          onSuffixTap: () {
                            setState(() {
                              signUpCubit.toggleobscureText();
                            });
                          },
                        ),

                        const SizedBox(height: 15),

                        // Confirm Password Field
                        CustomTextFormFild(
                          hintText: "Confirm Password",
                          prefixIcon: Icons.lock,
                          obscureText: signUpCubit.obscureText2,
                          controller: signUpCubit.confirmpasswordController,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your password";
                            }
                            if (value.length < 6) {
                              return "Password must be at least 6 characters";
                            }
                            return null;
                          },
                          suffixIcon: signUpCubit.obscureText2
                              ? Icons.visibility
                              : Icons.visibility_off,
                          onSuffixTap: () {
                            setState(() {
                              signUpCubit.toggleobscureText2();
                            });
                          },
                        ),

                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Forget Password ?",
                              style: TextStyle(
                                color: Colors.pink,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Login Button
                        CustomLoginButton(
                          onPressed: () {
                            signUpCubit.signup();
                          },
                          text: "Create An Acount",
                        ),

                        const SizedBox(height: 70),

                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              const Text(
                                "- By clicking the Register button, you agree to \n  the public offer -",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 15),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomLoginIcon(
                                      imagePth: "assets/Images/google 1.png"),
                                  const SizedBox(width: 12),
                                  CustomLoginIcon(
                                      imagePth: "assets/Images/apple 1.png"),
                                  const SizedBox(width: 12),
                                  CustomLoginIcon(
                                      imagePth: "assets/Images/f 1.png"),
                                ],
                              ),

                              const SizedBox(height: 25),

                              RichText(
                                text: TextSpan(
                                  text: "I Already have an Account! ",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Login",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.pink,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          context
                                              .pushReplacementNamed(Routes.Login);
                                          print("Login");
                                        },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
