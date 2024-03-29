
import 'package:flutter/material.dart';
import 'package:mes_tchams/controllers/global_state_manager.dart';
import 'package:mes_tchams/utils/app_colors.dart';
import 'package:mes_tchams/utils/functions.dart';
import 'package:mes_tchams/widgets/components/chat_rail_column.dart';
import 'package:mes_tchams/widgets/windows/chat_screen.dart';

class ChatRoom extends StatefulWidget{
  const ChatRoom({super.key});

  @override
  State<StatefulWidget> createState() => _ChatRoom();


  static void openContact(BuildContext context,Contact contact,String heroTag){
      if(isMobileScreenContext(context)){
        Navigator.push(context,MaterialPageRoute<void>(
          builder:(context)=>ChatScreen(contact: contact,heroTag: heroTag,))
        );
      }else{
        print("Contact $contact ouvert");
      }
  }
}

class _ChatRoom extends State<ChatRoom>{

  int chatIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints){
          double freeWidth=constraints.maxWidth;

          if(freeWidth<=MediaQueryBreakPoints.smallScreenMaxWidth){
            return const Column(
              children: [
                Expanded(child: ChatRailColumn())
              ],
            );
          }else{
            return const Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                ChatRailColumn(),
                Expanded(child: Text("Etendu"))
              ],
            );
          }
        },
      ),
    );
  }
}