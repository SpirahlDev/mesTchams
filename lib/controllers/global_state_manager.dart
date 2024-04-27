

import 'package:flutter/material.dart';
import 'package:mes_tchams/models/Contact.dart';
import 'package:mes_tchams/models/Message.dart';

class GlobalStateManager extends ChangeNotifier{

  static List <Contact> messages=[
    Contact(name: "Mylene Ahouré"),
    Contact(name: "Coulibaly Zahira"),
    Contact(name: "Maimouna Koffi"),
    Contact(name: "Bammoh").addMessage(Message(messageBody: "bammoh a relation dans le pays il connait alloué"))
  ]; 
}




