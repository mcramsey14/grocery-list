// Data class to keep the string and have an abbreviation function

class Item {
  Item({required this.name, this.quantity = 1});

  int quantity;
  final String name;

  String abbrev() {
    return name.substring(0, 1);
  }
  increment(){
    quantity ++;
  }
  decrement(){
    quantity --;
  }
}
