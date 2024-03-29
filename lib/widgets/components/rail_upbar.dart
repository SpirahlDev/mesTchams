import 'package:flutter/material.dart';
import 'package:mes_tchams/controllers/global_state_manager.dart';
import 'package:mes_tchams/utils/app_colors.dart';
import 'package:mes_tchams/utils/functions.dart';
import 'package:diacritic/diacritic.dart';

class RailUpBar extends StatefulWidget{
  const RailUpBar({super.key,this.railsWidth});
  
  final double? railsWidth;

  static const double raduisValue=5.0;

  @override
  State<RailUpBar> createState() => _RailUpBarState();
}

class _RailUpBarState extends State<RailUpBar> {

  static bool isSearchBarVisible=false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.surface,
        ),
        width: (isMobileScreenContext(context))?null:widget.railsWidth,
        child: Padding(
          padding: isSearchBarVisible? const EdgeInsets.only(left:18,right: 18,bottom: 10):const EdgeInsets.only(left:18,right: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "mesTchams",
                    style: TextStyle(
                      fontFamily: 'Kaushan Script',
                      fontSize: 28,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isSearchBarVisible=!isSearchBarVisible;
                      });
                    },
                    icon: Image.asset(
                      'assets/icons/search_icon.png', // Assurez-vous que le chemin est correct
                      width: 30,
                      height: 30,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const TabBar(
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.messenger_outlined,
                      size: 20,
                    ),
                    height: 30,
                  ),
                  Tab(
                    icon: Icon(
                      Icons.people,
                      size: 20,
                    ),
                    height: 30,
                  ),
                  Tab(
                    icon: Icon(
                      Icons.call_end_rounded,
                      size: 20,
                    ),
                    height: 30,
                  ),
                  Tab(
                    icon: Icon(
                      Icons.archive_outlined,
                      size: 20,
                    ),
                    height: 30,
                  ),
                ]
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300), 
                curve: Curves.easeInOut,
                height: isSearchBarVisible ? 40 : 0, 
                child: isSearchBarVisible ? const RailSearchBar() : null,
              ),
            ],
          ),
        ),
      ),
      
    );
  }
}

class RailSearchBar extends StatelessWidget {
  const RailSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(builder: (context, controller) {
      return SearchBar(
        hintText: "Recherchez un contact",
        controller: controller,
        onTap: () {
          controller.openView();
        },
        onChanged: (String currentInput) {
          controller.openView();
          
        },
        elevation: MaterialStateProperty.resolveWith((states) => 1),
    
        backgroundColor: MaterialStateProperty.resolveWith((states){
          const Color bgColor= Color.fromRGBO(217, 217, 217, 1);
    
          if(states.contains(MaterialState.pressed)){
            return bgColor;
          }    
    
          return bgColor;
        }),
        shape: MaterialStateProperty.resolveWith((states){
          if(states.contains(MaterialState.pressed)){
              return const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            );
          }
          return const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          );
        }),
    
           
    
      );
    },
      suggestionsBuilder: (BuildContext context, SearchController controller) { 
        Iterable<Contact> searchResult=[];

        if(controller.text.isNotEmpty){
          searchResult= GlobalStateManager.messages.where(
            (contact) => removeDiacritics(contact.contactName.toLowerCase()).contains(removeDiacritics(controller.text.toLowerCase()))
          );
        }

        
        return List<ListTile>.generate(
          searchResult.length, (index) {
            return ListTile(title: Text("${searchResult.elementAt(index)}"));
          } 
        );
     },);
  }
}


