import 'package:flutter/material.dart';
import 'package:whatsappclone/models/contacts.dart';

class ProfilePicPage extends StatelessWidget {
  final ContactModel contact;

  ProfilePicPage(this.contact);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: BackButton(
          color: Colors.white,
        ),
        title: Text(
          contact.name,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: Center(
          child: FractionallySizedBox(
            widthFactor: 0.7,
            heightFactor: 0.95,
            child: Image.network(
              contact.profilePicUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
