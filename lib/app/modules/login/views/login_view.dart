import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({super.key});
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.assessment_rounded,
              size: 120,
              color: Color(0xFF1bae9f),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Assessment",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.circular(30)),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF1bae9f)),
                            borderRadius: BorderRadius.circular(30)),
                        hintText: "Username",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username harus diisi!";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Obx(() => TextFormField(
                        controller: passController,
                        obscureText: controller.obscure.value,
                        decoration: InputDecoration(
                          suffixIcon: TextButton(
                              onPressed: controller.obscureToggle,
                              child: Text(controller.obscure.value
                                  ? "show"
                                  : 'hide')),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(),
                              borderRadius: BorderRadius.circular(30)),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF1bae9f)),
                              borderRadius: BorderRadius.circular(30)),
                          hintText: "Password",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password harus diisi!";
                          }
                          return null;
                        })),
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          var username = usernameController.text;
                          var pass = passController.text;
                          print(username);
                          print(pass);
                          Get.toNamed('/home');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                          elevation: 0,
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                          backgroundColor: Color(0xFF1bae9f),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25))),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
