import 'package:flutter/material.dart';
import 'package:to_dont_list/objects/item.dart';

typedef ToDoListChangedCallback = Function(Item item, bool completed);
typedef ToDoListRemovedCallback = Function(Item item);

class ToDoListItem extends StatefulWidget {
  ToDoListItem(
      {required this.item,
      required this.completed,
      required this.onListChanged,
      required this.onDeleteItem})
      : super(key: ObjectKey(item));

  final Item item;
  final bool completed;

  final ToDoListChangedCallback onListChanged;
  final ToDoListRemovedCallback onDeleteItem;

  Color _getColor(BuildContext context) {
    // The theme depends on the BuildContext because different
    // parts of the tree can have different themes.
    // The BuildContext indicates where the build is
    // taking place and therefore which theme to use.

    return completed //
        ? Colors.black54
        : Theme.of(context).primaryColor;
  }

  TextStyle? _getTextStyle(BuildContext context) {
    if (!completed) return null;

    return const TextStyle(
      color: Colors.black,
      decoration: TextDecoration.lineThrough,
    );
  }
  @override
  State<ToDoListItem> createState() => _ToDoListItemState();
  
}
class _ToDoListItemState extends State<ToDoListItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        widget.onListChanged(widget.item, widget.completed);
      },
      onLongPress: widget.completed
          ? () {
              widget.onDeleteItem(widget.item);
            }
          : null,
      leading: CircleAvatar(
        backgroundColor: widget._getColor(context),
        child: Text(widget.item.quantity.toString()),
      ),
      title: Text(
        widget.item.name,
        style: widget._getTextStyle(context),
      ),
      //OverflowBar implementation from https://api.flutter.dev/flutter/widgets/OverflowBar-class.html
      trailing: OverflowBar(
        spacing: 8,
        overflowAlignment: OverflowBarAlignment.end,
        children: <Widget>[
          ElevatedButton(key: const Key("Increment"), onPressed: (){
            setState((){widget.item.increment();});
            },child: const Text('+'),),
          ElevatedButton(key: const Key("Decrement"), onPressed: (){
            setState((){widget.item.decrement();});
            }, child: const Text('-')),
        ],
      ),
    );
  }
}