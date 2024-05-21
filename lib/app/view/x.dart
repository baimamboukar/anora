import 'package:anora/app/features/auth/data/models/invitation_model.dart';

void main() {
  print('Entry Point');
  final x = {
    'from':
        '{email: MS_RiPgsi@trial-yzkq340opj24d796.mlsender.net, name: Baimam Boukar}',
    'to': '{email: baimamboukar@gmail.com, name: Baimam JJ}',
    'organization': "Baimam's Space",
    'subject': "Invitation to Join Baimam's Space on AnoraAI 💐",
    'html': '',
    'uid': '233f8be6-b74a-4e0c-9942-be6dcace2264',
    'on': '2024-05-21T11:09:55.633907',
    'role': 'MANAGER',
  };
  final invitation = Invitation.fromMap(x, fromInvite: true);
  print(invitation);
}
