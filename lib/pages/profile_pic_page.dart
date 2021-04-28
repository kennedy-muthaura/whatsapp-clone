import 'package:flutter/material.dart';
import 'package:whatsappclone/models/contacts.dart';

class ProfilePicPage extends StatelessWidget {
  final String profilePicUrl;
  final String name;

  ProfilePicPage({required this.profilePicUrl, required this.name});

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
          name,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: Center(
          child: FractionallySizedBox(
            widthFactor: 0.7,
            heightFactor: 0.95,
            child: Image.network(
              profilePicUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
