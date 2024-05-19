import 'package:mes_tchams/controllers/global_state_manager.dart';
import 'package:mes_tchams/widgets/windows/chat_room.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainRuntime());
}

class MainRuntime extends StatelessWidget {
  const MainRuntime({super.key});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
        create: (context) => GlobalStateManager(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "mesTchams",
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                  seedColor: const Color.fromARGB(255, 41, 148, 198)),
              useMaterial3: true),
          home: const EntryPoint(),
        ));
  }
}

class EntryPoint extends StatelessWidget {
  const EntryPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChatRoom(),
    );
  }
}
