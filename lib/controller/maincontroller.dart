import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:tugas/page/home.dart';
import 'package:tugas/page/login.dart';

class Maincontroller extends GetxController {
  late String nama = "";
  late String email = "";
  late String password = "";

  GlobalKey<FormState> formKeyRegis = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();

  saveDataRegis() async {
    if (formKeyRegis.currentState?.validate() == true) {
      formKeyRegis.currentState!.save();

      SharedPreferences pref = await SharedPreferences.getInstance();

      pref.setString("nama", nama);
      pref.setString("email", email);
      pref.setString("password", password);

      if (formKeyRegis.currentState!.validate()) {
        Get.dialog(
          AlertDialog(
            title: const Text("Data Berhasil Di Simpan"),
            content: const Text("Sekarang Anda Bisa Login"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Get.off(LoginScreen());
                },
                child: const Text("Login"),
              ),
            ],
          ),
        );
      }
    }
  }

  late SharedPreferences prefget;
  getPref() async {
    prefget = await SharedPreferences.getInstance();
    nama = prefget.getString("nama")!;
    email = prefget.getString("email")!;
    password = prefget.getString("password")!;
  }

  void logOut() {
    Get.off(LoginScreen());
  }

  //login
  TextEditingController namaController = TextEditingController();
  TextEditingController passController = TextEditingController();

  getDataPref() async {
    prefget = await SharedPreferences.getInstance();

    nama = prefget.getString("nama")!;
    password = prefget.getString("password")!;
  }

  loginData() {
    if (namaController.text == nama && passController.text == password) {
      Get.off(Home());
    } else {
      Get.snackbar(
        "Maaf!!",
        "Anda Belum Terdaftar",
        backgroundColor: Colors.yellow,
      );
    }
  }

  @override
  void onReady() {
    saveDataRegis();
    // getPref();
    // getDataPref();
    super.onReady();
  }
}
