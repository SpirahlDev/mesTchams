import 'package:flutter/material.dart';
import 'package:mes_tchams/controllers/global_state_manager.dart';
import 'package:mes_tchams/utils/app_colors.dart';
import 'package:mes_tchams/utils/functions.dart';
import 'package:mes_tchams/widgets/windows/chat_room.dart';


class ChatRails extends StatelessWidget{

  const ChatRails({super.key, required this.railsWidth});

  final double railsWidth;
  
  @override
  Widget build(BuildContext context) {
  
    return Container(
      width: (isMobileScreenContext(context))?null:railsWidth,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/motif-bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 8,left: 8,top: 8),
        child: Column(
          children: <Widget>[
            Expanded(
              child:ListView.builder(
                itemCount: GlobalStateManager.messages.length,
                itemBuilder: ((context, index) {
                  return ChatRailTile(contact: GlobalStateManager.messages[index],railsWidth:railsWidth,postion: index,);
                }))
            )
          ]
        ),
      ),
    );
  }
  
}

class ChatRailTile extends StatelessWidget {
  final Contact contact;
  final double railsWidth;
  final int postion;

  const ChatRailTile({required this.contact,required this.railsWidth,required this.postion,super.key});

  @override
  Widget build(BuildContext context) {
    const double raduisValue=10;
    String heroTag="contact-$postion";
    //get screen dimensions
    Size screenSize=MediaQuery.of(context).size;
    double width=screenSize.width;
    double whiteLineWidth=(isMobileScreenContext(context))?width:railsWidth;
    print(whiteLineWidth*71/100);
    //deal with dynamic raduis
    BorderRadiusGeometry? dynamicRaduis;

    if(postion==0){
      dynamicRaduis=const BorderRadius.only(topLeft: Radius.circular(raduisValue),topRight: Radius.circular(raduisValue));
    }else if(postion==GlobalStateManager.messages.length-1){
      dynamicRaduis=const BorderRadius.only(bottomLeft: Radius.circular(raduisValue),bottomRight: Radius.circular(raduisValue));
    }

    return Container(
      decoration: BoxDecoration(
        color: AppColors.tileColor, // Couleur de fond du ListTile
        borderRadius: dynamicRaduis,

      ),
      width: (isMobileScreenContext(context))?null:railsWidth,
      child: Column(
        children: [
          Material(
            borderRadius: dynamicRaduis,

            child: InkWell(
              borderRadius: BorderRadius.circular(raduisValue),
    
              onTap: (){
                ChatRoom.openContact(context,contact,heroTag);
              },
              mouseCursor: SystemMouseCursors.click,
              hoverColor: const Color.fromRGBO(42, 123, 118, 1),

              child: ListTile(
                shape: (dynamicRaduis!=null)?RoundedRectangleBorder(borderRadius: dynamicRaduis):const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                tileColor: AppColors.tileColor,
                enableFeedback: true,
                leading: Hero(
                  tag: heroTag,
                  child: const CircleAvatar(),
                ),
                contentPadding:const EdgeInsets.fromLTRB(15,5,15,5),
                title: Text(
                  contact.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300
                  )
                ),
                subtitle: Text(
                  truncateText(contact.messages[contact.messages.length-1].messageText,30),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                  )
                ),
                  
                trailing: Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(child: Text(contact.messages.length.toString())),
                ),
              ),
            ),
          ),
          Material(
            child: Container(
              alignment: Alignment.center,
              height: (postion==GlobalStateManager.messages.length-1)?0:2,
              width: whiteLineWidth*71/100,
              color: Colors.white,
            ),
          )
        ]
      ),
    );
  }


  
}

