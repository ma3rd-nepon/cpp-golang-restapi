import "package:flutter/material.dart";
import "package:go_dart_e2e/widgets/buttons.dart";

const textStyle = TextStyle(color: Colors.white);

const chatList1 = [
  ChatListElement(
    chatName: "эмир тиктокер",
    chatLastMsg: "привет",
    chatIcon: Icon(Icons.person, size: 70),
    chatStatus: true,
    index: 0,
  ),
  ChatListElement(
    chatName: "chat2",
    chatLastMsg: "нет",
    chatIcon: Icon(Icons.person, size: 70),
    chatStatus: false,
    index: 1,
  ),
  ChatListElement(
    chatName: "chat300000000000",
    chatLastMsg: "пока",
    chatIcon: Icon(Icons.person, size: 70),
    chatStatus: true,
    index: 2,
  ),
  ChatListElement(
    chatName: "chat488",
    chatLastMsg: "2222",
    chatIcon: Icon(Icons.person, size: 70),
    chatStatus: false,
    index: 3,
  ),
  ChatListElement(
    chatName: "chat5856756",
    chatLastMsg: "ываываыва",
    chatIcon: Icon(Icons.person, size: 70),
    chatStatus: true,
    index: 4,
  ),
  ChatListElement(
    chatName: "chat6666666666666",
    chatLastMsg: "хвы",
    chatIcon: Icon(Icons.person, size: 70),
    chatStatus: true,
    index: 5,
  ),
  ChatListElement(
    chatName: "эмир тиктокер",
    chatLastMsg: "1234",
    chatIcon: Icon(Icons.person, size: 70),
    chatStatus: true,
    index: 6,
  ),
  ChatListElement(
    chatName: "эмир тиктокер",
    chatLastMsg: "idgaf",
    chatIcon: Icon(Icons.person, size: 70),
    chatStatus: true,
    index: 7,
  ),
  ChatListElement(
    chatName: "эмир тиктокер",
    chatLastMsg: "германия",
    chatIcon: Icon(Icons.person, size: 70),
    chatStatus: false,
    index: 8,
  ),
];

List<Widget> messageList1 = [
  MessageBubble(text: "вляпалась", isMe: false),
  MessageBubble(text: "врезалась", isMe: false),
  MessageBubble(text: "потеряла голову", isMe: true),
  MessageBubble(text: "вкрашилась", isMe: true),
  MessageBubble(text: "втрескалась", isMe: false),
  MessageBubble(text: "я просто в тебя втюрилась", isMe: true),
  MessageBubble(text: "но я не влюблена в тебя", isMe: false),
  MessageBubble(text: "я спрятала улыбку", isMe: false),
  MessageBubble(text: "но ты проходишь мимо", isMe: false),
  MessageBubble(text: "я все еще мечтаю о тебе", isMe: true),
  MessageBubble(text: "привет", isMe: true),
];

List<Widget> messageList2 = [
  MessageBubble(text: "я сигма бой", isMe: false),
  MessageBubble(text: "пошла нахуй дура", isMe: false),
  MessageBubble(text: "чем твое безразличие", isMe: true),
  MessageBubble(text: "твои крики лучше", isMe: true),
  MessageBubble(text: "как раньше", isMe: false),
  MessageBubble(text: "поругайся со мной", isMe: true),
  MessageBubble(text: "можешь покричать на меня", isMe: false),
  MessageBubble(text: "мне так нехватает твоих истерик", isMe: true),
  MessageBubble(text: "сошел с ума", isMe: false),
  MessageBubble(text: "я наверно", isMe: true),
  MessageBubble(text: "привет", isMe: true),
];

List<List<Widget>> chatList = [
  messageList1,
  messageList2,
  messageList1,
  messageList2,
  messageList1,
  messageList2,
  messageList1,
  messageList2,
]; // its a big cringe momento but emir still hasn't provided me with a copy of the database

class MessageBubble extends StatelessWidget {
  final String text;
  final bool isMe;

  const MessageBubble({super.key, required this.text, required this.isMe});

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
        child: Text(text, style: textStyle),
      ),
    );
  }
}

class ChatListElement extends StatefulWidget {
  final String _chatName;
  final String _chatLastMsg;
  final Icon _chatIcon;
  final bool _chatStatus;
  final int _index;

  const ChatListElement({
    super.key,
    required this._chatName,
    required this._chatLastMsg,
    required this._chatIcon,
    this._chatStatus = false,
    required this._index,
  });

  @override
  State<ChatListElement> createState() => _ChatListElementState();
}

class _ChatListElementState extends State<ChatListElement> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) => setState(() {
        _hover = true;
      }),
      onExit: (event) => setState(() {
        _hover = false;
      }),
      child: GestureDetector(
        onTap: () => Tabs.of(context).setIndex(widget._index, widget._chatName),
        child: Container(
          height: 100,
          padding: const EdgeInsets.only(top: 12),
          color: Tabs.of(context).selectedIndex == widget._index
              ? Color.fromARGB(255, 43, 82, 120)
              : _hover
              ? Color.fromARGB(255, 32, 43, 54)
              : Color.fromARGB(255, 23, 33, 43),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget._chatIcon,
              Column(
                children: [
                  Text(widget._chatName, style: textStyle),
                  const SizedBox(height: 10),
                  Text(widget._chatLastMsg, style: textStyle),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: .end,
                  children: [
                    widget._chatStatus ? Icon(Icons.check) : Icon(Icons.close),
                    // timeLastMsg
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetList extends StatelessWidget {
  final List<Widget> _items;
  final bool reverse;

  const WidgetList({super.key, required this._items, this.reverse = false});

  @override
  Widget build(BuildContext context) {
    final Axis scrollDirection = Tabs.of(context).scrollDirection;
    return Container(
      width: double.infinity,
      color: Color.fromARGB(255, 14, 22, 33),
      child: ListView.builder(
        scrollDirection: scrollDirection,
        reverse: reverse,
        itemCount: _items.length,
        itemBuilder: (cntxt, index) {
          return _items[index];
        },
      ),
    );
  }
}

class Tabs extends InheritedWidget {
  final int selectedIndex;
  final int animationDuration;
  final bool scrollable;
  final Axis scrollDirection;
  final String currentChatName;
  final Function(int, String) setIndex;

  const Tabs({
    super.key,
    required super.child,
    required this.scrollDirection,
    required this.setIndex,
    required this.selectedIndex,
    required this.currentChatName,
    this.animationDuration = 0,
    this.scrollable = true,
  });

  static Tabs of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Tabs>()!;
  }

  @override
  bool updateShouldNotify(Tabs old) => old.selectedIndex != selectedIndex;
}

class ChatContent extends StatelessWidget {
  final TextEditingController _controller;
  final VoidCallback _sendMsg;
  final List<List<Widget>> _items;
  final FocusNode _focusNode;

  const ChatContent({
    super.key,
    required this._controller,
    required this._sendMsg,
    required this._items,
    required this._focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .center,
      children: [
        Container(
          color: Color.fromARGB(255, 27, 39, 52),
          height: 80,
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: .center,
            children: [
              Column(
                children: [
                  Builder(
                    builder: (context) => Text(
                      Tabs.of(context).currentChatName,
                      style: textStyle,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("был(а) давно", style: textStyle),
                ],
              ),
              SizedBox(width: 250),
              Row(
                children: [
                  CustomIconButton(
                    icon: Icon(Icons.search),
                    iconSize: 20,
                    onPress: () => (),
                  ),
                  CustomIconButton(
                    icon: Icon(Icons.call),
                    iconSize: 20,
                    onPress: () => (),
                  ),
                  CustomIconButton(
                    icon: Icon(Icons.tab),
                    iconSize: 20,
                    onPress: () => (),
                  ),
                  CustomIconButton(
                    icon: Icon(Icons.house),
                    iconSize: 20,
                    onPress: () => (),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          flex: 9,
          child: WidgetList(
            items: _items[Tabs.of(context).selectedIndex],
            reverse: true,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                color: Color.fromARGB(255, 23, 33, 43),
                child: TextField(
                  autofocus: true,
                  focusNode: _focusNode,
                  controller: _controller,
                  decoration: InputDecoration(hintText: "Enter a message"),
                  onSubmitted: (value) => _sendMsg(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            CustomIconButton(
              onPress: _sendMsg,
              icon: Icon(Icons.send),
              iconSize: 25,
            ),
          ],
        ),
      ],
    );
  }
}
