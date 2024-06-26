import 'package:anora/core/core.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class RecorderWidget extends StatefulWidget {
  const RecorderWidget({super.key});

  @override
  State<RecorderWidget> createState() => _RecorderWidgetState();
}

class _RecorderWidgetState extends State<RecorderWidget> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  double _confidence = 1;
  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    final style = context.header.copyWith(
      color: context.colorScheme.primary,
    );
    final words = [
      'flutter',
      'Anora',
      'Data',
      'Highlight',
      'Custom',
      'Analyze',
      'Analyse',
      'Help',
      'Custom',
      'Please',
      'Sales',
    ];
    final highlights = <String, HighlightedWord>{};
    for (final word in words) {
      highlights[word] = HighlightedWord(
        onTap: () => debugPrint(word),
        textStyle: style,
      );
    }
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Confidence: ${(_confidence * 100.0).toStringAsFixed(1)}%'),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _isListening,
        glowRadiusFactor: 0.9,
        glowColor: context.colorScheme.primary,
        // endRadius: 75.0,
        // repeatPauseDuration: const Duration(milliseconds: 100),
        child: FloatingActionButton(
          onPressed: _listen,
          child: Icon(_isListening ? Icons.mic : Icons.mic_none),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 150),
          child: TextHighlight(
            text: _text,
            words: highlights,
            textStyle: context.header,
            // textStyle: const TextStyle(
            //   fontSize: 32,
            //   color: Colors.black,
            //   fontWeight: FontWeight.w400,
            // ),
          ),
        ),
      ),
    );
  }

  Future<void> _listen() async {
    if (!_isListening) {
      final available = await _speech.initialize(
        onStatus: (val) => debugPrint('onStatus: $val'),
        onError: (val) => debugPrint('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        await _speech.listen(
          localeId: 'en_US',
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      await _speech.stop();
    }
  }
}
