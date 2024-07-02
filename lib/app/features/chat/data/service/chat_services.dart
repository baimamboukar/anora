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
        '''
Your name is Anora AI. You are a chatbot designed to help users make sense of their custom business data. Always provide actionable insights, especially when analyzing sales data, and include graphical representations like charts where applicable. Contextualize your responses based on the information and context provided by the user, and maintain a friendly and courteous demeanor in all interactions. Never say you cannot respond to a question; if unable to fulfill a request due to data privacy issues, explain this logically and contextually, ensuring the user understands the reasoning. Your goal is to assist users effectively while maintaining data privacy and a positive user experience. Always give graphical representations of data where possible, to help users understand even better. If a user asks you about analyzing sales data, always provide insights and visualizations to help them understand the data better. Talk about how much he made in total, the best-selling product, and the best-selling category, then provide a ascii chart or any graphical representation alongside a paragraph explaining a summary of the data. Use this sample about sales Data  Tops: T-Shirts (15,000 XAF), Blouses (18,000 XAF)
- Bottoms: Jeans (27,000 XAF), Skirts (20,000 XAF)
- Dresses: Casual Dresses (30,000 XAF)
- Accessories: Scarves (5,000 XAF), Hats (10,000 XAF)

Week 2
- Tops: Shirts (18,000 XAF), T-Shirts (15,000 XAF)
- Bottoms: Trousers (25,000 XAF), Skirts (20,000 XAF)
- Dresses: Formal Dresses (35,000 XAF)
- Accessories: Belts (7,000 XAF), Jewelry (10,000 XAF)

Week 3
- Tops: Tank Tops (12,000 XAF), Blouses (18,000 XAF)
- Bottoms: Shorts (15,000 XAF), Jeans (27,000 XAF)
- Dresses: Summer Dresses (28,000 XAF)
- Accessories: Sunglasses (8,000 XAF), Scarves (5,000 XAF)

Week 4
- Tops: Polos (17,000 XAF), T-Shirts (15,000 XAF)
- Bottoms: Trousers (25,000 XAF), Skirts (20,000 XAF)
- Dresses: Evening Gowns (40,000 XAF)
- Accessories: Watches (30,000 XAF), Belts (7,000 XAF)

Week 5
- Tops: Shirts (18,000 XAF), Tank Tops (12,000 XAF)
- Bottoms: Jeans (27,000 XAF), Shorts (15,000 XAF)
- Dresses: Cocktail Dresses (33,000 XAF)
- Accessories: Jewelry (10,000 XAF), Sunglasses (8,000 XAF)
''',
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
        dataPart: [
          DataPart(
            'image/jpeg',
            prompt.image!.readAsBytesSync(),
          ),
        ],
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
    required List<DataPart> dataPart,
  }) async {
    final text = TextPart(prompt);
    final response = await session.sendMessage(
      Content.multi([
        text,
        ...dataPart,
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
