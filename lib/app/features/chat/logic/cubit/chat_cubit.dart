import 'package:anora/app/features/chat/data/service/chat_services.dart';
import 'package:anora/app/features/chat/logic/models/anora_prompt.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_cubit.freezed.dart';
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(const ChatState.initial());
  final _firestore = FirebaseFirestore.instance;

  final id = FirebaseAuth.instance.currentUser!.uid;
  String chatUID = '';
  //late ChatSession session;
  final service = GeminiService(
    model: GeminiService.init().$1,
    session: GeminiService.init().$2,
  );

  Future<void> completeChat({required Prompt promt}) async {
    emit(const ChatState.completing());
    final response = await service.completeChat(prompt: promt);

    emit(ChatState.completed(response: response));
  }

  Future<void> saveMessage(Prompt prompt, String uid) async {
    emit(const ChatState.completing());
    chatUID = uid;
    final id = FirebaseAuth.instance.currentUser!.uid;
    await _firestore.collection('chats').doc(id).set(
      {
        'query': prompt.text,
        'timestamp': FieldValue.serverTimestamp(),
      },
    );
    emit(const ChatState.completed(response: ''));
  }

  // Future<String> uploadToStorage(File image) async {
  //   // Create a reference to the Firebase Storage location
  //   final storageRef = FirebaseStorage.instance
  //       .ref()
  //       .child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');

  //   // Upload the image to Firebase Storage
  //   final uploadTask = storageRef.putFile(image);

  //   // Wait for the upload to complete and get the download URL
  //   final snapshot = await uploadTask;
  //   final String downloadURL = await snapshot.ref.getDownloadURL();

  //   return downloadURL;
  // }
}
