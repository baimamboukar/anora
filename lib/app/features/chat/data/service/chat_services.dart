import 'package:anora/app/features/chat/logic/models/anora_prompt.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  GeminiService({
    required this.model,
    required this.session,
  });
  static (GenerativeModel, ChatSession) init() {
    final model = GenerativeModel(
      model: 'gemini-1.5-pro',
      apiKey: 'AIzaSyB3mflnpWaJUWwKI593R15KHqJmROtZx68',
      systemInstruction: Content.system(
        "Your name is Anora AI, you are a chatbot that help users to make sense of their custom business data. Contextualize all your responses to the user's query",
      ),
      tools: [],
    );
    final session = model.startChat();
    return (model, session);
  }

  final GenerativeModel model;
  final ChatSession session;
  Future<(Content, String)> completeChat({
    required Prompt prompt,
  }) async {
    if (prompt.image != null) {
      final response = await generateContentFromImage(
        prompt: prompt.text,
        dataPart: DataPart('image/jpeg', prompt.image!.readAsBytesSync()),
      );
      return response;
    }
    final response = await generateContentFromText(prompt: prompt.text);
    return response;
  }

  Future<(Content, String)> generateContentFromText({
    required String prompt,
  }) async {
    final response = await session.sendMessage(
      Content.text(prompt),
    );
    final content = Content(
      'model',
      response.candidates.first.content.parts,
    );
    return (content, response.text ?? 'Something went wrong with your request');
  }

  Future<(Content, String)> generateContentFromImage({
    required String prompt,
    required DataPart dataPart,
  }) async {
    final text = TextPart(prompt);
    final response = await session.sendMessage(
      Content.multi([
        text,
        dataPart,
      ]),
    );
    // final response = await model.generateContent([
    //   Content.multi([text, dataPart]),
    // ]);
    // session.history.toList().add(
    //       Content(
    //         'model',
    //         response.candidates.first.content.parts,
    //       ),
    //     );
    final content = Content(
      'model',
      response.candidates.first.content.parts,
    );
    return (content, response.text ?? 'Something went wrong with your request');
  }
}
