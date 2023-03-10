import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:grupal/db/contacts_database.dart';
import 'package:grupal/model/contact.dart';
import 'package:grupal/widget/contact_card_widget.dart';

import 'contact_detail_screen.dart';
import 'edit_contact_screen.dart';

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  late List<Contact> contacts;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  @override
  void dispose() {
    ContactsDatabase.instance.close();

    super.dispose();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    this.contacts = await ContactsDatabase.instance.readAllContacts();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Contactos',
            style: TextStyle(fontSize: 24),
          ),
        ),
        body: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : contacts.isEmpty
                  ? Text(
                      'No existen Contactos',
                      style: TextStyle(color: Colors.black, fontSize: 24),
                    )
                  : buildContacts(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: Icon(Icons.add),
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddEditContactPage()),
            );
            refreshNotes();
          },
        ),
      );

  Widget buildContacts() => StaggeredGridView.countBuilder(
        itemCount: contacts.length,
        staggeredTileBuilder: (index) => StaggeredTile.fit(1),
        crossAxisCount: 1,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ContactDetailPage(noteId: contact.id!),
              ));
              refreshNotes();
            },
            child: ContactCardWidget(contact: contact, index: index),
          );
        },
      );
}
