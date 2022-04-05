import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas/controller/maincontroller.dart';
import 'package:tugas/page/register.dart';

class LoginScreen extends StatelessWidget {
  late Maincontroller controller;

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller = Get.find<Maincontroller>();

    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 100),
        child: GetBuilder<Maincontroller>(
          init: Maincontroller(),
          builder: (Maincontroller controller) {
            return Form(
              key: controller.formKeyLogin,
              child: ListView(
                children: [
                  TextFormField(
                    controller: controller.namaController,
                    decoration: const InputDecoration(
                      hintText: "Nama",
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    controller: controller.passController,
                    decoration: const InputDecoration(
                      hintText: "Password",
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        controller.loginData();
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Get.off(RegisterScreen());
                    },
                    child: const Text(
                      "Daftar",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: 5,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
