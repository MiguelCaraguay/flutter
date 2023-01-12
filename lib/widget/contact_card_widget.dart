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
        padding:EdgeInsets.all(10),
        alignment: Alignment.center,
        color: _lightColors[index % _lightColors.length],
        child: ListTile(
          leading: Icon(
            Icons.person,
            size: 40,
            color: Colors.white,
          ),
          title: Text(
            contact.nombre + " " + contact.apellido,
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Text(
              "Parentesco: ${contact.parentesco}\nTelefono: ${contact
                  .telefono}\nEmail: ${contact.correo}\nDireccion: ${contact
                  .direccion}",
              style: TextStyle(color: Colors.white)),
        ));
  }
}
