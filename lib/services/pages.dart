import 'package:flutter/material.dart';
import "package:flutter_resizable_container/flutter_resizable_container.dart";
import 'package:go_dart_e2e/widgets/buttons.dart';
import 'package:google_fonts/google_fonts.dart';

// import "package:go_dart_e2e/widgets/buttons.dart";
import "package:go_dart_e2e/widgets/chat.dart";

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  final List<List<Widget>> _items = chatList;
  int _selectedIndex = 0;
  String _selectedChatName = "Эмир тиктокер";

  void _sendMsg() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _items[_selectedIndex].insert(0, MessageBubble(text: text, isMe: true));
      _focusNode.requestFocus();
      _controller.clear();
    });
  }

  void _setIndex(int index, String chatName) {
    setState(() {
      _selectedIndex = index;
      _selectedChatName = chatName;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Tabs(
          selectedIndex: _selectedIndex,
          setIndex: _setIndex,
          currentChatName: _selectedChatName,
          scrollDirection: Axis.vertical,
          child: Row(
            mainAxisAlignment: .center,
            children: [
              Expanded(
                child: ResizableContainer(
                  direction: Axis.horizontal,
                  children: [
                    ResizableChild(
                      divider: ResizableDivider(
                        thickness: 5,
                        color: Color.fromARGB(255, 23, 33, 43),
                      ),
                      size: const ResizableSize.expand(min: 250, max: 400),
                      child: Container(
                        width: double.infinity,
                        color: Color.fromARGB(255, 23, 33, 43),
                        child: Column(
                          crossAxisAlignment: .center,
                          mainAxisAlignment: .center,
                          children: [
                            TextField(
                              decoration: const InputDecoration(
                                hintText: "Search chats",
                              ),
                            ),
                            Expanded(
                              child: WidgetList(
                                items: chatList1,
                                reverse: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ResizableChild(
                      size: const ResizableSize.expand(min: 500),
                      child: ChatContent(
                        controller: _controller,
                        focusNode: _focusNode,
                        sendMsg: _sendMsg,
                        items: _items,
                      ),
                    ),
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

class LoginPage extends StatelessWidget {
  final VoidCallback loginSuccess;

  const LoginPage({super.key, required this.loginSuccess});

  void startLogin() {
    // this will be action with database
    if (true) {
      loginSuccess();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Expanded(
          child: Column(
            children: [
              Text("Sign in page", style: GoogleFonts.jetBrainsMono()),
              TextField(decoration: InputDecoration(hintText: "Enter login")),
              TextField(
                decoration: InputDecoration(hintText: "Enter password"),
              ),
              CustomButton(text: Text("БУРМАЛДА", style: textStyle), onPress: () => startLogin()),
            ],
          ),
        ),
      ),
    );
  }
}


class CallsPage extends StatelessWidget {
  const CallsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Hello world", style: GoogleFonts.jetBrainsMono())
      )
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Hello settings", style: GoogleFonts.jetBrainsMono())
      )
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,

  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Expanded(
          child: Text("Hello Profile", style: textStyle)
        )
      ),
    );
  }
}
