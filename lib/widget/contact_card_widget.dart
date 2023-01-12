import 'package:flutter/material.dart';
import 'package:grupal/model/contact.dart';

final _lightColors = [
  Colors.blue[900],
  Colors.blue[600],
];

class ContactCardWidget extends StatelessWidget {
  ContactCardWidget({
    Key? key,
    required this.contact,
    required this.index,
  }) : super(key: key);

  final Contact contact;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: _lightColors[index % _lightColors.length],
        child: ListTile(
          leading: Icon(Icons.person, size: 20),
          title: Text(contact.nombre + " " + contact.apellido),
          subtitle: Text(
              "Telefono: " + contact.telefono + "  email: " + contact.correo),
        ));
  }
}
