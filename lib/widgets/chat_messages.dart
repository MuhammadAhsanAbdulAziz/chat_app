import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('chat').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text("No messages found"),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Error Loading Messages"),
          );
        }

        final loadedMesssages = snapshot.data!.docs;
        return ListView.builder(
          itemCount: loadedMesssages.length,
          itemBuilder: (context, index) {
            return Text(loadedMesssages[index].data()['text']);
          },
        );
      },
    );
  }
}
