import 'package:flutter/material.dart';
import 'package:myapp/modelos/mensagem_modelo.dart'; // Importando o modelo de mensagem

class ChatbotTela extends StatefulWidget {
  @override
  _ChatbotTelaState createState() => _ChatbotTelaState();
}

class _ChatbotTelaState extends State<ChatbotTela> {
  List<MensagemModelo> mensagens = []; // Lista de mensagens
  TextEditingController _controller =
      TextEditingController(); // Controlador do input de texto

  // Função para responder ao usuário
  void responderBot(String texto) {
    setState(() {
      mensagens.add(
          MensagemModelo(texto: texto, isUsuario: false)); // Resposta do bot
    });
  }

  // Função para enviar a mensagem do usuário e gerar a resposta do bot
  void enviarMensagem() {
    String texto = _controller.text.trim();
    if (texto.isNotEmpty) {
      setState(() {
        mensagens.add(MensagemModelo(
            texto: texto, isUsuario: true)); // Mensagem do usuário
      });
      _controller.clear(); // Limpa o campo de texto

      // Resposta do chatbot (aqui você pode melhorar com lógica de IA)
      Future.delayed(const Duration(seconds: 1), () {
        if (texto.toLowerCase().contains('compras')) {
          responderBot(
              "Eu posso ajudar a criar uma lista de compras. Qual item você precisa adicionar?");
        } else if (texto.toLowerCase().contains('login')) {
          responderBot("Se você precisar de ajuda com o login, posso guiá-lo.");
        } else {
          responderBot("Desculpe, não entendi. Você pode reformular?");
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chatbot de Ajuda"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: mensagens.length,
              itemBuilder: (context, index) {
                final mensagem = mensagens[index];
                return ListTile(
                  title: Align(
                    alignment: mensagem.isUsuario
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color:
                            mensagem.isUsuario ? Colors.blue : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        mensagem.texto,
                        style: TextStyle(
                            color: mensagem.isUsuario
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Digite sua mensagem...",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: enviarMensagem, // Envia a mensagem
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
