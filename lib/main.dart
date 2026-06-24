import 'package:flutter/material.dart';

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
    _items.add(
      Align(
        alignment: Alignment.centerRight,
        child: Container(
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.blue[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
    _controller.clear();
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: .center,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: .center,
                mainAxisAlignment: .center,
                children: [
                  TextField(decoration: const InputDecoration(hintText: "Search chats")),
                  Expanded(child: const Text("This will be a chat list"))
                ]
              )
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: .center, 
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      width: double.infinity,
                      color: Colors.green,
                      child: ListView.builder(
                        reverse: true,
                        itemCount: _items.length,
                        itemBuilder: (context, index) {
                          return _items[index];
                        },
                      )
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: 
                      Row(
                        children: [
                          Expanded(child: TextField(controller: _controller, decoration: InputDecoration(hintText: "Enter a message"))),
                          ElevatedButton(
                            onPressed: _sendMsg,
                            child: const Text('Отправить'),
                      ),
                        ]
                      )
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
