// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

class Prompt {
  final String text;
  final File? image;
  Prompt({
    required this.text,
    this.image,
  });
}
