import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app_con/resources/consts/app_styles.dart';
import 'package:news_app_con/resources/consts/colors.dart';
import 'package:news_app_con/views/dashboard.dart';
import 'package:news_app_con/views/signup_page.dart';
import 'package:velocity_x/velocity_x.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var showPassword = false;

  makePasswordVisible() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  show() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        duration: Duration(seconds: 3),
        content: Text("Invalid Credentials!! Check and resubmit")));
  }

  goTo() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Dashboard()));
  }

  signin(String mailA, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: mailA, password: password);

      goTo();
    } catch (e) {
      show();
    }
  }

  TextEditingController mail = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Dashboard()));
                  },
                  child: Text(
                    "Continue as Guest",
                    style: AppStyles.semiBold(size: 10, color: Colors.blue),
                  ))
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "One More Step ",
                    style: AppStyles.semiBold(size: 16),
                  ),
                  Stack(
                    textDirection: TextDirection.rtl,
                    children: [
                      VxBox(
                          child: Image.asset(
                        "assets/images/two.png",
                        width: 250,
                      )).rounded.color(Colors.yellowAccent).make(),
                      VxBox(
                          child: Center(
                        child: Text(
                          "Advertisement x",
                          style: AppStyles.regular(),
                        ),
                      )).rounded.width(130).color(Colors.white).make()
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Login",
                    style: AppStyles.semiBold(size: 16),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  // const CustomTextField(
                  //   hint: "username@gmail.com",
                  //   label: "E-mail",
                  // ),

                  TextFormField(
                    controller: mail,
                    obscureText: showPassword,
                    decoration: InputDecoration(
                        hintText: "User@gmail.com",
                        labelText: "E-mail",
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(),
                            borderRadius: BorderRadius.circular(12))),
                  ),

                  const SizedBox(
                    height: 12,
                  ),

                  TextFormField(
                    controller: pass,
                    obscureText: showPassword,
                    decoration: InputDecoration(
                        suffix: showPassword == false
                            ? null
                            : Icon(showPassword == true
                                    ? Icons.visibility_off
                                    : Icons.visibility)
                                .onTap(() {
                                makePasswordVisible();
                              }),
                        hintText: "***********",
                        labelText: "Password",
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(),
                            borderRadius: BorderRadius.circular(12))),
                  ),
                  30.heightBox,
                  SizedBox(
                    width: context.screenWidth,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                                AppColors.primaryButton)),
                        onPressed: () {
                          signin(mail.text, pass.text);
                        },
                        child: Text(
                          "Login",
                          style:
                              AppStyles.semiBold(size: 12, color: Colors.white),
                        )),
                  ),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an Account?",
                        style: AppStyles.regular(
                            size: 14, color: AppColors.secondaryColor),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignupPage()));
                          },
                          child: Text(
                            "SignUp",
                            style: AppStyles.regular(
                                color: AppColors.secondaryButton),
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "By Signing in Your agree to our Terms & Conditions",
                      style: AppStyles.regular(color: Colors.black38),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Privacy Policy",
                            style: AppStyles.semiBold(
                                size: 12, color: AppColors.primaryButton),
                          )),
                      Text(
                        "and",
                        style: AppStyles.semiBold(size: 10),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Terms of Services",
                            style: AppStyles.semiBold(size: 12),
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, left: 60),
                    child: Text(
                      "Powered by Aman Kumawat",
                      style: AppStyles.regular(size: 10, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
