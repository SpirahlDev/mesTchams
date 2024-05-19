import 'package:flutter/material.dart';
import 'package:mes_tchams/models/Contact.dart';
class ChatScreen extends StatelessWidget{

  final Contact contact;
  final String heroTag;

  const ChatScreen({super.key,required this.contact,required this.heroTag});

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: ChatScreenUpBar(heroTag: heroTag, contact: contact),
        centerTitle: true,
      ) ,
      body: const Column(
        children: [
          
        ],
      ),
    );
  }

}

class ChatScreenUpBar extends StatelessWidget {
  
  const ChatScreenUpBar({
    super.key,
    required this.heroTag,
    required this.contact,
  });

  final String heroTag;
  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        
        borderRadius: BorderRadius.circular(5),
        onTap: (){},
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(//upBar
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Hero(
                tag: heroTag,
                child: const CircleAvatar(),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                contact.toString(),
                style: const TextStyle(
                  fontSize: 15,
                ),
              )
            ],
          ),
        ),
      );
  }
}