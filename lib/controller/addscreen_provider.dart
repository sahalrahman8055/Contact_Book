import 'package:contact_book_firebase/model/contact_model.dart';
import 'package:contact_book_firebase/service/firebase_service.dart';
import 'package:flutter/material.dart';

class AddContactProvider extends ChangeNotifier {
  AddContactProvider() {
    fetchContact();
  }

  final TextEditingController contactName = TextEditingController();
  final TextEditingController contactNumber = TextEditingController();
  final TextEditingController contactEmail = TextEditingController();

  final formKey = GlobalKey<FormState>();

  List<ContactModel> contacts = [];

  final FirebaseService firebaseServices = FirebaseService();

  Future<void> fetchContact() async {
    contacts = await firebaseServices.fetchContact();

    notifyListeners();
  }

  void addContact() async {
    final contact = ContactModel(
        id: "",
        name: contactName.text,
        phone: contactNumber.text,
        email: contactEmail.text);
    firebaseServices.addContact(contact);
    await fetchContact();
    notifyListeners();
  }




}
