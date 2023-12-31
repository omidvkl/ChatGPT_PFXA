import 'package:flutter/cupertino.dart';

import '../models/chat_model.dart';
import '../services/api.services.dart';

class ChatProvider with ChangeNotifier {
  List<ChatModel> chatList = [];

  List<ChatModel> get getChatList {
    return chatList;
  }

  void addUserMessage({required String msg}) {
    chatList.add(ChatModel(msg: msg, chatIndex: 0));
    notifyListeners();
  }

  Future<void> sendMessageAndGetAnswers(
      {required String msg, required String choseModelId}) async {
    if (choseModelId.toLowerCase().startsWith("gpt")){
      chatList.addAll(await ApiService.sendMessageGPT(
        message: msg,
        modelId: choseModelId,
      ));
    }else {
      chatList.addAll(await ApiService.sendMessage(
        message: msg,
        modelId: choseModelId,
      ));
    }
    notifyListeners();
  }
}
