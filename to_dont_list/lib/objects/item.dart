// Data class to keep the string and have an abbreviation function

class Item {
  Item({required this.name, this.quantity = 1});

  int quantity;
  final String name;
  
  increment(){
    quantity ++;
  }
  decrement(){
    quantity --;
  }
}
