import 'package:anora/app/features/auth/data/models/invitation_model.dart';

void main() {
  print('Entry Point');
  final x = {
    'from':
        '{email: MS_RiPgsi@trial-yzkq340opj24d796.mlsender.net, name: Baimam Boukar}',
    'to': '{email: baimamboukar@gmail.com, name: Joubenti}',
    'organization': "baimamboukar@anora.io's Space",
    'subject': "Invitation to Join baimamboukar@anora.io's Space on AnoraAI 💐",
    'html': '',
    'uid': 'f89a38cc-8c43-4878-814d-93a54039aa57',
    'on': '2024-05-23T00:55:11.569706',
    'role': 'MANAGER',
    'orguid': '46a919d3-c26e-4d82-82b5-4ff2126ed67d',
  };
  final invitation = Invitation.fromMap(x, fromInvite: true);
  print(invitation);
}
