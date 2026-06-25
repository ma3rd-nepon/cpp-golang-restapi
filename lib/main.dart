import 'package:flutter/material.dart';
import "package:flutter_resizable_container/flutter_resizable_container.dart";

import "package:go_dart_e2e/widgets/buttons.dart";
import "package:go_dart_e2e/widgets/chat.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 123',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: const Color.fromARGB(255, 92, 0, 252)),
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = TextEditingController();
  final List<Widget> _items = []; 

  void _sendMsg() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _items.insert(0, MessageBubble(text: text, isMe: true));
      _controller.clear();
    });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: .center,
          children: [
            Expanded(
            child: ResizableContainer(
              direction: Axis.horizontal,
              children: [
                ResizableChild(
                  divider: ResizableDivider(thickness: 5),
                  size: const ResizableSize.expand(min: 250),
                child:
                Container(
                  width: double.infinity,
                  color: Color.fromARGB(255, 23, 33, 43),
                  child: Column(
                    crossAxisAlignment: .center,
                    mainAxisAlignment: .center,
                    children: [
                      TextField(decoration: const InputDecoration(hintText: "Search chats")),
                      Expanded(
                        child: WidgetList(
                          items: [
                            ChatListElement(chatName: "эмир тиктокер", chatLastMsg: "привет", chatIcon: Icon(Icons.person, size: 70), chatStatus: true),
                            ChatListElement(chatName: "chat2", chatLastMsg: "нет", chatIcon: Icon(Icons.person, size: 70), chatStatus: false),
                            ChatListElement(chatName: "chat3", chatLastMsg: "пока", chatIcon: Icon(Icons.person, size: 70), chatStatus: true),
                            ChatListElement(chatName: "chat4", chatLastMsg: "2222", chatIcon: Icon(Icons.person, size: 70), chatStatus: false),
                            ChatListElement(chatName: "chat5", chatLastMsg: "ываываыва", chatIcon: Icon(Icons.person, size: 70), chatStatus: true),
                            ChatListElement(chatName: "chat6", chatLastMsg: "хвы", chatIcon: Icon(Icons.person, size: 70), chatStatus: true),
                            ChatListElement(chatName: "эмир тиктокер", chatLastMsg: "1234", chatIcon: Icon(Icons.person, size: 70), chatStatus: true),
                            ChatListElement(chatName: "эмир тиктокер", chatLastMsg: "idgaf", chatIcon: Icon(Icons.person, size: 70), chatStatus: true),
                            ChatListElement(chatName: "эмир тиктокер", chatLastMsg: "германия", chatIcon: Icon(Icons.person, size: 70), chatStatus: false)
                          ],
                          reverse: false
                        )
                      )
                    ]
                  )
                )
                ),
                ResizableChild(
                  size: const ResizableSize.expand(min: 500),
                  child: Column(
                mainAxisAlignment: .center, 
                children: [
                  Expanded(flex: 9, child: WidgetList(items: _items, reverse: true)),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Color.fromARGB(255, 23, 33, 43), 
                          child: TextField(
                            autofocus:true, 
                            controller: _controller, 
                            decoration: InputDecoration(
                              hintText: "Enter a message"
                            ), 
                            onSubmitted: (value) => _sendMsg(), 
                            style: const TextStyle(color: Colors.white)
                          )
                        )
                      ),
                      CustomIconButton(onPress: _sendMsg, icon: Icon(Icons.send))
                    ]
                  )
                ],
              )
                )
              ]
            )
            ),
          ],
        ),
      ),
    );
  }
}
