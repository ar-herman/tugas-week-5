import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas/controller/apicontroller.dart';
import 'package:tugas/widgets/drawer.dart';

class Home extends StatelessWidget {
  late Apicontroller controller;

  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller = Get.find<Apicontroller>();

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Tugas Lima",
          style: TextStyle(
            letterSpacing: 3,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: controller.listNews.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.orange,
                    ),
                    child: Text(
                      "Penulis : ${controller.listNews[index]["author"]}",
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Image.network(
                    controller.listNews[index]["urlToImage"],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    controller.listNews[index]["description"],
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      drawer: MainDrawer(),
    );
  }
}
