import 'package:flutter/material.dart';
import 'package:myapp/telas/listas_tela.dart'; // Tela com a lista de itens
import 'package:myapp/telas/chatbot_tela.dart'; // Importando a tela do chatbot

class InicioTela extends StatelessWidget {
  const InicioTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shop Easy"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Bem-vindo ao Shop Easy",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Botão para navegar para a lista de itens
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ListasTela()), // Navega para a tela de listas
                );
              },
              child: const Text("Ir para Listas de Compras"),
            ),
            const SizedBox(height: 20),

            // Botão para abrir o Chatbot de Ajuda
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, '/chatbot'); // Navega para a tela do chatbot
              },
              child: const Text("Abrir Chatbot de Ajuda"),
            ),
          ],
        ),
      ),
    );
  }
}
