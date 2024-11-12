// models/mensagem_modelo.dart
class MensagemModelo {
  final String texto;
  final bool isUsuario; // Indica se é do usuário (true) ou do chatbot (false)

  MensagemModelo({
    required this.texto,
    required this.isUsuario,
  });
}
