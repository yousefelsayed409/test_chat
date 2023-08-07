import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testchat/pages/Welcom_Page.dart';
import '../constants.dart';
import '../models/message.dart';
import '../widgets/chat_buble.dart';

class ChatPage extends StatelessWidget {
  static String id = 'ChatPage';

  final _controller = ScrollController();

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollections);
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)?.settings.arguments as String? ?? '';

    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagesList = snapshot.data!.docs
              .map(
                (doc) => Message.fromJson(doc.data() as Map<String, dynamic>),
              )
              .toList();

          return Scaffold(
            backgroundColor: kprimerycolorthree,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kprimercolortow,
              title: Text('Chat'),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, WelcomPage.id);
                    },
                    icon: Icon(Icons.logout))
              ],
              centerTitle: true,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return messagesList[index].id == email
                          ? ChatBublee(
                              message: messagesList[index],
                            )
                          : ChatBubleForFriend(
                              message: messagesList[index],
                            );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (data) {
                      if (email.isNotEmpty) {
                        messages.add({
                          kMessage: data,
                          kCreatedAt: DateTime.now(),
                          'id': email,
                        });
                      }
                      controller.clear();
                      _controller.animateTo(
                        0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    },
                    decoration: InputDecoration(
                      hintText: 'Send Message',
                      suffixIcon: const Icon(
                        Icons.send,
                        color: kprimercolortow,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: kprimercolortow,
                        ),
                      ), 
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: kprimercolortow
                        ),
                      )
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Text('Loading...');
        }
      },
    );
  }
}
