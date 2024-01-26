import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oracle_app_2/chat_page/model/chat_service.dart';
import 'pages/chat_page.dart';

class MainChatPage extends StatefulWidget {
  const MainChatPage({super.key});

  @override
  State<MainChatPage> createState() => _MainChatPageState();
}
  final FirebaseAuth _auth = FirebaseAuth.instance;
class _MainChatPageState extends State<MainChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Page'),
      ),
        body: _buildUserList(),
    );
  }
    Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('error'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading.....');
          }
          return ListView(
            children: snapshot.data!.docs
                .map<Widget>((doc) => _buildUserListItem(doc))
                .toList(),
          );
        });
  }
Widget _buildUserListItem(DocumentSnapshot document) {
  Map<String, dynamic>? data = document.data() as Map<String, dynamic>?;

  if (data != null && _auth.currentUser!.email != data['email']) {
    String initials = _getInitials(data['username']);

    return StreamBuilder<QuerySnapshot>(
      stream: ChatService.getLastMessage(
        _auth.currentUser!.uid, // текущий пользователь
        data['uid'], // пользователь из списка чатов
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("");
        }

        if (snapshot.hasError) {
          return const Text("Ошибка загрузки сообщений");
        }

        if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
          // Display a ListTile with "Нет сообщений" if there are no messages
          return ListTile(
            title: Text(data['username'],
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w600,
              )),
            subtitle: const Text("Нет сообщений"),
            leading: CircleAvatar(
              child: Text(initials),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(
                    receiverUserEmail: data['email'],
                    receiverUsername: data['username'],
                    receiverUserId: data['uid'],
                  ),
                ),
              );
            },
          );
        }

        var messageData = snapshot.data!.docs[0].data() as Map<String, dynamic>;
        var senderUsername = messageData['senderUsername'] ?? '';
        var messageText = messageData['message'];

        return ListTile(
          title: Text(data['username'],
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w600,
            )),
          subtitle: Text("$senderUsername: $messageText"),
          leading: CircleAvatar(
            child: Text(initials),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(
                  receiverUserEmail: data['email'],
                  receiverUsername: data['username'],
                  receiverUserId: data['uid'],
                ),
              ),
            );
          },
        );
      },
    );
  } else {
    return Container();
  }
  }
  String _getInitials(String username) {
  List<String> nameParts = username.split(" ");
  return nameParts.isNotEmpty
      ? (nameParts[0].isNotEmpty ? nameParts[0][0] : (nameParts.length > 1 && nameParts.last.isNotEmpty ? nameParts.last[0] : ''))
      : '';
}
}