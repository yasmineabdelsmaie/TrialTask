class Item {
  final String title;
  final String description;

  Item({required this.title, required this.description});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      title: json['title'],
      description: json['description'],
    );
  }
}
