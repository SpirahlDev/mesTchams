import 'package:mes_tchams/models/Message.dart';

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