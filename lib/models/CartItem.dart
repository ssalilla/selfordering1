class CartItem {
  final int id;
  final String title;
  final double price;
  final List<int> options;
  final int size;

  CartItem(
      {this.id = 0,
      required this.title,
      required this.price,
      this.options = const [],
      required this.size});
}
