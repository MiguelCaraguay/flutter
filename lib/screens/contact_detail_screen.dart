import 'package:flutter/material.dart';
import 'package:grupal/screens/edit_contact_screen.dart';
import 'package:intl/intl.dart';

import '../db/contacts_database.dart';
import '../model/contact.dart';

class ContactDetailPage extends StatefulWidget {
  final int noteId;

  const ContactDetailPage({
    Key? key,
    required this.noteId,
  }) : super(key: key);

  @override
  _ContactDetailPageState createState() => _ContactDetailPageState();
}

class _ContactDetailPageState extends State<ContactDetailPage> {
  late Contact contacts;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNote();
  }

  Future refreshNote() async {
    setState(() => isLoading = true);

    this.contacts = await ContactsDatabase.instance.readContact(widget.noteId);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [editButton(), deleteButton()],
          // actions: [deleteButton()],
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : Container(
                height: 250,
                padding: EdgeInsets.all(12),
                child: Card(
                  semanticContainer: true,
                  color: Colors.blue[800],
                  child: ListView(
                    padding: EdgeInsets.all(10),
                    children: [
                      Text(
                        "${contacts.nombre} ${contacts.apellido}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.people, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            contacts.parentesco,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.house, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            contacts.direccion,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.mail, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            contacts.correo,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.phone, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            contacts.telefono,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
      );

  Widget editButton() => IconButton(
      icon: Icon(Icons.edit_outlined),
      onPressed: () async {
        if (isLoading) return;

        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddEditContactPage(contact: contacts),
        ));

        refreshNote();
      });

  Widget deleteButton() => IconButton(
        icon: Icon(Icons.delete),
        onPressed: () async {
          await ContactsDatabase.instance.delete(widget.noteId);
          Navigator.of(context).pop();
        },
      );
}
