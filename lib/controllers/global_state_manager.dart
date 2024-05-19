import 'package:flutter/material.dart';
import 'package:mes_tchams/models/Contact.dart';
import 'package:mes_tchams/models/Message.dart';
import 'package:mes_tchams/services/httpService.dart';

class GlobalStateManager extends ChangeNotifier {
  static HttpService httpClient = HttpService();

  static Map<String, dynamic> message ={};

  static List<Contact> messages = [
    Contact(name: "Mylene Ahouré"),
    Contact(name: "Coulibaly Zahira"),
    Contact(name: "Maimouna Koffi"),
    Contact(name: "Bammoh").addMessage(Message(
        messageBody: "bammoh a relation dans le pays il connait alloué"))
  ];

  static getNames() async {
    message = await httpClient.getRequest("api-experience");
    print(message["message"]);
  }

  static checkForMessage() {
    Future.delayed(
        const Duration(seconds: 2),
        () => {
            print("Recherche de nouveaux messages..."),
            getNames(),
            checkForMessage()
        });
  }
}
