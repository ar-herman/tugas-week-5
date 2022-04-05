import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas/controller/maincontroller.dart';

class RegisterScreen extends StatelessWidget {
  late Maincontroller controller;

  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller = Get.find<Maincontroller>();
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text("Register"),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 80),
        child: GetBuilder<Maincontroller>(
          init: Maincontroller(),
          builder: (Maincontroller controller) {
            return Form(
              key: controller.formKeyRegis,
              child: ListView(
                children: [
                  // nama
                  TextFormField(
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Nama Harus di isi";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      controller.nama = value!;
                    },
                    decoration: const InputDecoration(
                      hintText: "Nama",
                    ),
                  ),
                  const SizedBox(height: 20),
                  // email
                  TextFormField(
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Email Harus di isi";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      controller.email = value!;
                    },
                    decoration: const InputDecoration(
                      hintText: "Email",
                    ),
                  ),
                  const SizedBox(height: 20),
                  //password
                  TextFormField(
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password Harus di isi";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      controller.password = value!;
                    },
                    decoration: const InputDecoration(
                      hintText: "Password",
                    ),
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.saveDataRegis();
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "simpan",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
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
