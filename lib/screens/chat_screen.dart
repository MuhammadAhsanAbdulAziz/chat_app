import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min,children: [
          const Text("Chat room h bahi yh."),
          ElevatedButton(onPressed: () {
            FirebaseAuth.instance.signOut();
          }, child: const Text("Logout"))
        ]),
      ),
    );
  }
}
