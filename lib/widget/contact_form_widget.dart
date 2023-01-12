import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

class ContactFormWidget extends StatelessWidget {
  final String? nombre;
  final String? apellido;
  final String? parentesco;
  final String? direccion;
  final String? correo;
  final String? telefono;
  final ValueChanged<String> onChangedNombre;
  final ValueChanged<String> onChangedApellido;
  final ValueChanged<String?>? onChangedParentesco;
  final ValueChanged<String> onChangedDireccion;
  final ValueChanged<String> onChangedCorreo;
  final ValueChanged<String> onChangedTelefono;

  const ContactFormWidget({
    Key? key,
    this.nombre = '',
    this.apellido = '',
    this.parentesco = '',
    this.direccion = '',
    this.correo = '',
    this.telefono = '',
    required this.onChangedNombre,
    required this.onChangedApellido,
    required this.onChangedParentesco,
    required this.onChangedDireccion,
    required this.onChangedCorreo,
    required this.onChangedTelefono,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildName(),
              SizedBox(height: 3),
              buildApellido(),
              SizedBox(height: 3),
              buildParentesco(),
              SizedBox(height: 3),
              buildDireccion(),
              SizedBox(height: 3),
              buildCorreo(),
              SizedBox(height: 3),
              buildTelefono(),
              SizedBox(height: 3),
            ],
          ),
        ),
      );

  Widget buildName() => TextFormField(
        maxLines: 1,
        initialValue: nombre,
        decoration: InputDecoration(
          icon: Icon(Icons.person),
          hintText: 'Nombres',
          hintStyle: TextStyle(color: Colors.black),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'El nombre no debe estar vacio'
            : null,
        onChanged: onChangedNombre,
      );

  Widget buildApellido() => TextFormField(
        maxLines: 1,
        initialValue: apellido,
        decoration: InputDecoration(
          icon: Icon(Icons.person),
          hintText: 'Apellidos',
          hintStyle: TextStyle(color: Colors.black),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'El Apellido no puede estar vacío'
            : null,
        onChanged: onChangedApellido,
      );

  Widget buildParentesco() => Container(
        width: 400,
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.people),
          ),
          hint: Text("${parentesco}"),
          items: <String>['Familiar', 'Amigo', 'Conocido'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: new Text(value),
            );
          }).toList(),
          onChanged: onChangedParentesco,
        ),
      );


  Widget buildDireccion() => TextFormField(
        initialValue: direccion,
        decoration: InputDecoration(
          icon: Icon(Icons.house),
          hintText: 'Direccion',
          hintStyle: TextStyle(color: Colors.black),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'La Direccion no puede estar vacía'
            : null,
        onChanged: onChangedDireccion,
      );

  Widget buildCorreo() => TextFormField(
        initialValue: correo,
        decoration: InputDecoration(
          icon: Icon(Icons.mail),
          hintText: 'Correo',
          hintStyle: TextStyle(color: Colors.black),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'El correo no puede estar vacío'
            : null,
        onChanged: onChangedCorreo,
      );

  Widget buildTelefono() => TextFormField(
        initialValue: telefono,
        decoration: InputDecoration(
          icon: Icon(Icons.phone),
          hintText: 'Telefono',
          hintStyle: TextStyle(color: Colors.black),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'El telefono no puede estar vacío'
            : null,
        onChanged: onChangedTelefono,
      );
}
