class ItemModelo {
  String id;
  String item;
  String data;

  ItemModelo({required this.id, required this.item, required this.data});

  ItemModelo.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        item = map["item"],
        data = map["data"];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "item": item,
      "data": data,
    };
  }
}
