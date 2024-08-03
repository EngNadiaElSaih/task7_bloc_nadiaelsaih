class Item {
  final int id;
  final String name;
  final String description;

  Item({required this.id, required this.name, required this.description});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      name: map['name'],
      description: map['description'],
    );
  }

  selectItem(Item item) {}
}
