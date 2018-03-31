import 'package:flutter/material.dart';

import '../models/contact_data.dart';

class ContactViewPage extends StatelessWidget {
  final Contact contact;

  ContactViewPage({Key key, this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(contact.fullName),
        ),
        body: Container(
          child: Text(contact.email),
        ));
  }
}
