class ListaModelo {
  String id;
  String titulo;
  String local;
  String? descricao;

  ListaModelo(
      {required this.id,
      required this.titulo,
      required this.local,
      this.descricao});

  ListaModelo.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        titulo = map["titulo"],
        local = map["local"],
        descricao = map["descricao"];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "titulo": "titulo",
      "local": "local",
      "descricao": "descricao",
    };
  }
}
