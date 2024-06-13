import 'package:anora/app/features/auth/data/models/space_models.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'integration_cubit.freezed.dart';
part 'integration_state.dart';

class IntegrationCubit extends Cubit<IntegrationState> {
  IntegrationCubit() : super(const IntegrationState.initial());

  Future<void> createKnowledgeBase(
    String uid,
    String name,
    String useruid,
    String orguid,
  ) async {
    try {
      final firestore = FirebaseFirestore.instance;
      emit(const IntegrationState.addingKnowledgeBase());
// Create a new instance of SpaceKnowledgeBase
      final knowledgeBase = SpaceKnowledgeBase(
        name: name,
        knowledgeID: uid,
        spaceID: orguid,
        sources: [],
      );

      // Convert the knowledge base instance to a map
      final knowledgeBaseMap = knowledgeBase.toMap();
      final ref = firestore.collection('spaces').doc(orguid);
      await ref.update({
        'knowledges': FieldValue.arrayUnion([knowledgeBaseMap]),
      });
      emit(IntegrationState.addingKnowledgeBaseSuccess(knowledgeBase));
    } catch (err) {
      rethrow;
    }
  }
}
