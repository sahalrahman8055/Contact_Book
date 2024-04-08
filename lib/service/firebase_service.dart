import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_book_firebase/model/contact_model.dart';


class FirebaseService {
  final CollectionReference firebaseContact =
      FirebaseFirestore.instance.collection('ContactBook');

  Future<List<ContactModel>> fetchContact() async {
    final snapshot = await firebaseContact.get();
    return snapshot.docs.map((doc) {
      return ContactModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
    }).toList();
  }

  void addContact(ContactModel contact) {
    final data = contact.toMap();
    firebaseContact.add(data);
  }


}
