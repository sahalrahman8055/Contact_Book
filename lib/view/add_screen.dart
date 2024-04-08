import 'package:contact_book_firebase/controller/addscreen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "Add Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Consumer<AddContactProvider>(
        builder: (context, value, child) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: value.formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: value.contactName,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter name";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Enter name")),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: value.contactNumber,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter number";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Enter number")),
                  ),
                  TextFormField(
                    controller: value.contactEmail,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter Email";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Enter Email")),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: ElevatedButton(
                      onPressed: () {
                        if (value.formKey.currentState!.validate()) {
                          value.addContact();
                          Navigator.pop(context);

                          value.contactName.clear();
                          value.contactNumber.clear();
                          value.contactEmail.clear();
                        }
                      },
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                              const Size(double.infinity, 45))),
                      child: const Text(
                        "Submit",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
