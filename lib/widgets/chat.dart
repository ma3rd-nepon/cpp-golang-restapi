import "package:flutter/material.dart";



const textStyle = TextStyle(color: Colors.white);


class MessageBubble extends StatelessWidget {
  final String text;
  final bool isMe;

  const MessageBubble({
    super.key,
    required this.text,
    required this.isMe
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 43, 82, 120),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}

class ChatListElement extends StatelessWidget {
  final String _chatName;
  final String _chatLastMsg;
  final Icon _chatIcon;
  final bool _chatStatus;

  const ChatListElement({
    super.key,
    required this._chatName,
    required this._chatLastMsg,
    required this._chatIcon,
    this._chatStatus=false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.only(top: 12),
      color: Color.fromARGB(255, 23, 33, 43),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _chatIcon,
          Column(children: [
            Text(_chatName, style: textStyle),
            const SizedBox(height: 10),
            Text(_chatLastMsg, style: textStyle)
          ],),
          Expanded(
            child: Column(
              crossAxisAlignment: .end,
              children: [
                _chatStatus ? Icon(Icons.check) : Icon(Icons.close)
                // timeLastMsg
              ]
            )
          )
        ]
      )
    );
  }
}

class WidgetList extends StatelessWidget {
  final List<Widget> _items;
  final bool reverse;

  const WidgetList({
    super.key,
    required this._items,
    this.reverse=true
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Color.fromARGB(255, 14, 22, 33),
      child: ListView.builder(
        reverse: reverse,
        itemCount: _items.length,
        itemBuilder: (cntxt, index) {
          return _items[index];
        }
      )
    );
  }
}