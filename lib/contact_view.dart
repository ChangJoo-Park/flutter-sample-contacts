import 'package:flutter/material.dart';
import 'contact_data.dart';

class ContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Contacts"),
        ),
        body: new Container(
          child: new ContactList(kContacts),
        )
      );
  }
}

class ContactList extends StatelessWidget {
  final List<Contact> _contacts;

  ContactList(this._contacts);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      itemCount: _contacts.length,
      itemBuilder: _buildContacts,
    );
  }

  Widget _buildContacts(context, index) {
    return new ContactItem(_contacts[index]);
  }
}

class ContactItem extends StatelessWidget {
  const ContactItem(this.contact);

  final Contact contact;

  Widget _buildTiles(Contact contact) {
    return ListTile(
        title: Text(contact.fullName),
        subtitle: Text(contact.email),
        leading: CircleAvatar(
          child: Text(contact.fullName[0]),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(contact);
  }
}

// class _ContactListItem extends ListTile {
//   _ContactListItem(Contact contact)
//       : super(
//             title: new Text(contact.fullName),
//             subtitle: new Text(contact.email),
//             leading: new CircleAvatar(child: new Text(contact.fullName[0])));
// }
