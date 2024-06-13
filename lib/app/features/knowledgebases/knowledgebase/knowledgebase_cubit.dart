import 'dart:io';

import 'package:anora/app/features/auth/data/models/anora_datasource_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'knowledgebase_cubit.freezed.dart';
part 'knowledgebase_state.dart';

class KnowledgebaseCubit extends Cubit<KnowledgebaseState> {
  KnowledgebaseCubit() : super(const KnowledgebaseState.initial());

  Future<void> addDataSource(
    PlatformFile file,
    String knowledgeID,
    String? driveURL,
  ) async {
    try {
      emit(const KnowledgebaseState.addingData());
      final extension = file.extension ?? 'pdf';
      final source = AnoraDataSource(
        type: extension,
        uid: const Uuid().v4(),
        knowledgeBaseID: knowledgeID,
        details: DataSourceDatails(
          sourceID: const Uuid().v4(),
          sourceType: extension,
          sourceName: file.name,
          sourceURL: await uploadToFirebase(file.path!, knowledgeID),
        ),
      );
      await FirebaseFirestore.instance
          .collection('data_sources')
          .doc(source.uid)
          .set(source.toMap());

      emit(KnowledgebaseState.addingDataSuccess(source));
    } catch (err) {
      emit(KnowledgebaseState.addingDataFailed(err.toString()));
    }
  }

  Future<void> getDataSources(String uid) async {
    try {
      emit(const KnowledgebaseState.gettingDataSource());

      final snapshot = await FirebaseFirestore.instance
          .collection('data_sources')
          .where('knowledgeBaseID', isEqualTo: uid)
          .get();

      final sources = snapshot.docs.map((doc) {
        return AnoraDataSource.fromMap(doc.data());
      }).toList();

      emit(KnowledgebaseState.gettingDataSourceSuccess(sources));
    } catch (err) {
      emit(KnowledgebaseState.gettingDataSourceFailed(err.toString()));
    }
  }

// Function to upload file to Firebase Storage and get the download URL
  Future<String> uploadToFirebase(String filePath, String orguid) async {
    final file = File(filePath);
    final fileExtension = getFileExtension(filePath);
    final fileName = '${DateTime.now().millisecondsSinceEpoch}.$fileExtension';

    final uploadTask = FirebaseStorage.instance
        .ref('data_sources/$orguid/$fileName')
        .putFile(file);

    final snapshot = await uploadTask;
    return snapshot.ref.getDownloadURL();
  }

// Function to get file extension from file path
  String getFileExtension(String filePath) {
    return filePath.split('.').last;
  }
}
