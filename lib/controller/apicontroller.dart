import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Apicontroller extends GetxController {
  String alamatApi = "https://newsapi.org/v2/top-headlines?sources=";
  String source = "techcrunch";
  String apikey = "ec965c38b5cf4a26a7ec1bb0305778a9";

  List<dynamic> listNews = [];

  void getApi() {
    http
        .get(
      Uri.parse(alamatApi + source + "&apiKey=" + apikey),
    )
        .then((http.Response value) {
      if (value.statusCode == 200) {
        Map<String, dynamic> response = json.decode(value.body);
        listNews = response["articles"];
        print(listNews);
      }
    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
    });

    update();
  }

  @override
  void onReady() {
    getApi();
    super.onReady();
  }
}
