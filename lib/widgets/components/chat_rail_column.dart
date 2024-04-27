import 'package:flutter/material.dart';
import 'package:mes_tchams/utils/functions.dart';
import 'package:mes_tchams/widgets/components/chat_rails.dart';
import 'package:mes_tchams/widgets/components/rail_upbar.dart';

class ChatRailColumn extends StatelessWidget {
  const ChatRailColumn({super.key});

  static const double defaultRailWidth = 400;

  @override
  Widget build(BuildContext context) {
    if (isMobileScreenContext(context)) {
      return const DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Scaffold(
          body: Column(
            children: [
              RailUpBar(railsWidth: defaultRailWidth),
              Expanded(
                child: TabBarView(
                  children: [
                    ChatRails(railsWidth: defaultRailWidth),
                    Text("Seconde pages"),
                    Text("Troisième pages"),
                    Text("Quatrième pages"),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return const Column(
        children: [
          RailUpBar(railsWidth: defaultRailWidth),
          Expanded(child: ChatRails(railsWidth: defaultRailWidth))
        ],
      );
    }
  }
}
