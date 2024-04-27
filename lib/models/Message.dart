
class Message{
  String messageBody="";

  Message({required this.messageBody});

  set setMessage(String text){
    messageBody=text;
  }
  get messageText=>messageBody;
}