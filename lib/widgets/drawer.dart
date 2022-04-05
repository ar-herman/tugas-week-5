import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas/controller/maincontroller.dart';

class MainDrawer extends StatelessWidget {
  late Maincontroller controller;

  MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller = Get.find<Maincontroller>();
    return Drawer(
      child: Container(
        color: Colors.blueGrey,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.yellow,
                child: Text("photo"),
              ),
              accountName: Text(
                controller.nama,
                style: const TextStyle(
                  fontSize: 20,
                  letterSpacing: 2,
                ),
              ),
              accountEmail: Text(
                controller.email,
                style: const TextStyle(
                  fontSize: 24,
                  letterSpacing: 2,
                ),
              ),
              decoration: const BoxDecoration(
                color: Colors.blueGrey,
              ),
            ),
            const Divider(
              thickness: 2,
              color: Colors.yellow,
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.yellow,
              ),
              title: const Text(
                "Log Out",
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
              onTap: () {
                controller.logOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
