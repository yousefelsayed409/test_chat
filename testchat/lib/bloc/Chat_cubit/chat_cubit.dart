import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:testchat/constants.dart';
import 'package:testchat/models/message.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollections);

  void sendmessage({required String message, required String email}) {
    messages.add(
      {
        kMessage: message,
        kCreatedAt: DateTime.now(),
        'id ': email,
      },
    );
  }

  void getMessage() {
    messages.orderBy(kCreatedAt, descending: true).snapshots()
      ..listen(
        (event) {
          List<Message> mesagesslist = [];
          for (var doc in event.docs) {
            mesagesslist.add(Message.fromJson(doc));
          }
          emit(ChatSuccess(messages: mesagesslist));
        },
      );
  }
}
