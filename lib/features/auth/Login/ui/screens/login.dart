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
import 'package:untitled/features/auth/singup/ui/cubit/sign_up.dart'; // تأكد من أن هذه الدالة تتحقق من صحة الإيميل

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
        body: SingleChildScrollView(
          child: BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginLoading){
                  showLoading(context);

                }
                if(state is LoginSuccess){
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

                  context.pushNamedAndRemoveUntil(Routes.HomePage);
                }
                if (state is LoginError){

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
                     CustomLoginButton(
                         onPressed: (){
                       loginCubit.login();
          
                     }, text: "Login"),
          
                      SizedBox(height: 70),
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("- Or Continue with -",style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black
                            ),),
                            const SizedBox(height: 15),
          
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                               CustomLoginIcon(imagePth: "assets/Images/google 1.png",
                                   onTap: (){
                                 print("google");
                               }),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                  child: CustomLoginIcon(imagePth: "assets/Images/apple 1.png",onTap: (){
                                    print("Apple");
                                  }),
                                ),
                                CustomLoginIcon(imagePth: "assets/Images/f 1.png",onTap: (){
                                  print("Facebook");
                                }),
          
                              ],
                            ),
          
                            const SizedBox(height: 25),
          
                          RichText(text: TextSpan(
                            text: "Create An Account? ",
                              style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black54
                          ),
                            children: [
                                TextSpan(
                                  text: "Sign Up",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = (){
                                    context.pushReplacementNamed(Routes.singupScreen);
                                      print("Sign UP");
                                    },
                                )
                            ]
                          ))
          
                          ],
                        ),
                      )
                    ],
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
