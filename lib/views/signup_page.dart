import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app_con/resources/consts/app_styles.dart';
import 'package:news_app_con/resources/consts/colors.dart';
import 'package:news_app_con/views/login.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var showPassword = false;
  TextEditingController name = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController pass = TextEditingController();
  makePasswordVisible() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  show(String textA) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(duration: const Duration(seconds: 3), content: Text(textA)));
  }

  showSuccess() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        duration: Duration(seconds: 3),
        content: Text("SignUp Succes!! Redirecting... Wait,")));
  }

  goTo() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Login()));
  }

  createUSer(String mail, String pass) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: mail, password: pass);
      showSuccess();
      goTo();
    } on FirebaseAuthException catch (e) {
      show(e.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Text(
                "SignUp",
                style: AppStyles.semiBold(size: 16),
              ),
              const SizedBox(
                height: 12,
              ),
              // for name field
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                    hintText: "Albus Dumbledore",
                    labelText: "User-Name",
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(),
                        borderRadius: BorderRadius.circular(12))),
              ),
              const SizedBox(
                height: 12,
              ),
              // const CustomTextField(
              //   hint: "ElderWand@gmail.com",
              //   label: "E-mail",
              // ),
              TextFormField(
                controller: mail,
                decoration: InputDecoration(
                    hintText: "Elderwand@gmail.com",
                    labelText: "E-mail",
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(),
                        borderRadius: BorderRadius.circular(12))),
              ),
              const SizedBox(
                height: 12,
              ),
              // const CustomTextField(
              //   hint: "********",
              //   label: "Password",
              //   isPassword: true,
              // ),
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
                    hintText: "********",
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
                        backgroundColor:
                            WidgetStateProperty.all(AppColors.primaryButton)),
                    onPressed: () {
                      createUSer(mail.text, pass.text);
                    },
                    child: Text(
                      "SignUp",
                      style: AppStyles.semiBold(size: 12, color: Colors.white),
                    )),
              ),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an Account?",
                    style: AppStyles.regular(
                        size: 14, color: AppColors.secondaryColor),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      },
                      child: Text(
                        "Login",
                        style:
                            AppStyles.regular(color: AppColors.secondaryButton),
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
                    style: AppStyles.semiBold(size: 12),
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
                  style: AppStyles.regular(size: 12, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
