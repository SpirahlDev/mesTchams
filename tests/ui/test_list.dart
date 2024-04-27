
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Liste avec couleur de fond'),
        ),
        body: Container(
          color: const Color.fromARGB(255, 59, 167, 221), // Couleur de fond de la colonne
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  'Ma Liste',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10, // Nombre d'éléments dans la liste
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      color: index % 2 == 0 ? Colors.grey[300] : Colors.white, // Alterner les couleurs de fond
                      child: Material(
                        child: ListTile(
                          leading: const CircleAvatar(child: Icon(Icons.school),),
                          title: Text('Élément $index'),
                          onTap: () {
                            print('Élément $index sélectionné');
                          },
                          tileColor: Colors.red,
                        
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
