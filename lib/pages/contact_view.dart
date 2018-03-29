import 'package:flutter/material.dart';
import '../models/contact_data.dart';
import 'contact_details.dart';

class ContactsPage extends StatelessWidget {
  Drawer buildDrawer(BuildContext context) {
    var header = DrawerHeader(
      child: Container(
        child: Text("Contact App Header"),
      )
    );

    var about = AboutListTile(
      child: Text("About Contact"),
      applicationName: "Contact App Example",
      applicationVersion: "V0.0.1",
      applicationIcon: Icon(Icons.hourglass_empty),
      icon: Icon(Icons.info),
    );

    ListTile buildNavItem(var icon, String label, String route) {
      return ListTile(
        leading: Icon(icon),
        title: Text(label),
        onTap: () {
          // FIXME: Need Stateful Widget
          // setState(() {
          //   Navigator.of(context).pop();
          //   Navigator.of(context).pushNamed(route);
          // });
        },
      );
    }

    var navList = [
      header,
      buildNavItem(Icons.home, "Home", "/"),
      buildNavItem(Icons.settings, "Settings", "/contact_details"),
      buildNavItem(Icons.account_balance_wallet, "Account", "/account"),
      about
    ];

    ListView listView = ListView(children: navList);

    return Drawer(child: listView);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Contacts"),
        ),
        drawer: buildDrawer(context),
        body: Container(
          child: ContactList(kContacts),
        ));
  }
}

class ContactList extends StatelessWidget {
  final List<Contact> _contacts;

  ContactList(this._contacts);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      itemCount: _contacts.length,
      itemBuilder: _buildContacts,
    );
  }

  Widget _buildContacts(context, index) {
    return ContactItem(_contacts[index]);
  }
}

class ContactItem extends StatelessWidget {
  const ContactItem(this.contact);

  final Contact contact;

  Widget _buildTiles(BuildContext context, Contact contact) {
    return ListTile(
      title: Text(contact.fullName),
      subtitle: Text(contact.email),
      leading: CircleAvatar(
        child: Text(contact.fullName[0]),
      ),
      trailing: Icon(Icons.card_travel),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              // TODO: 어떻게 page간 데이터를 넘기는지?
              return ContactViewPage();
              // return Scaffold(
              //   appBar: AppBar(
              //     title: Text(contact.fullName)
              //   ),
              //   body: Text('Hello'),
              // );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(context, contact);
  }
}
