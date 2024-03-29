

import 'package:flutter/material.dart';

class GlobalStateManager extends ChangeNotifier{

  
  static List <Contact> messages=[
    Contact(name: "Mylene Ahouré"),
    Contact(name: "Coulibaly Zahira"),
    Contact(name: "Maimouna Koffi"),
    Contact(name: "Bammoh").addMessage(Message(messageBody: "bammoh a relation dans le pays il connait alloué"))
  ]; 


}


class Message{
  String messageBody="";

  Message({required this.messageBody});

  set setMessage(String text){
    messageBody=text;
  }
  get messageText=>messageBody;
}

class Contact{
  String name="";
  Contact({required this.name});

  final List<Message> _messages=[
    Message(messageBody: "Salut"),
    Message(messageBody: "Tu m'as oublié ?"),
    Message(messageBody: "Comment c'etait ta journée  ?"),
  ];

  List<Message> get messages=>_messages;
  String get contactName => name;

  @override
  String toString() {
    return name;
  }

  void deleteMessage(){
    _messages.clear();
  }

  Contact addMessage(Message msg){
    _messages.add(msg);
    return this;
  }
}