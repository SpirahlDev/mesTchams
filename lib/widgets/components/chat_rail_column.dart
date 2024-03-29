import 'package:flutter/material.dart';
import 'package:mes_tchams/widgets/components/chat_rails.dart';
import 'package:mes_tchams/widgets/components/rail_upbar.dart';


class ChatRailColumn extends StatelessWidget{
  const ChatRailColumn({super.key});

  static const double defaultRailWidth=400;

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const RailUpBar(railsWidth: defaultRailWidth),
        ),
        body: TabBarView(
          children: [
            ChatRails(railsWidth:defaultRailWidth),
            // Expanded(
            // ),
            Text("Seconde pages"),
            Text("Troisième pages"),
            Text("Quatrième pages"),
          ],
        ),
      ),
    );
  }

}

