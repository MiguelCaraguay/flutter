import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

class ContactFormWidget extends StatelessWidget {
  final int? number;
  final String? nombre;
  final String? apellido;
  final String? parentesco;
  final String? correo;
  final String? telefono;
  final ValueChanged<int> onChangedNumber;
  final ValueChanged<String> onChangedNombre;
  final ValueChanged<String> onChangedApellido;
  final ValueChanged<String> onChangedParentesco;
  final ValueChanged<String> onChangedCorreo;
  final ValueChanged<String> onChangedTelefono;

  const ContactFormWidget({
    Key? key,
    this.number = 0,
    this.nombre = '',
    this.apellido = '',
    this.parentesco = '',
    this.correo = '',
    this.telefono = '',
    required this.onChangedNumber,
    required this.onChangedNombre,
    required this.onChangedApellido,
    required this.onChangedParentesco,
    required this.onChangedCorreo,
    required this.onChangedTelefono,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Slider(
                      value: (number ?? 0).toDouble(),
                      min: 0,
                      max: 5,
                      divisions: 5,
                      onChanged: (number) => onChangedNumber(number.toInt()),
                    ),
                  )
                ],
              ),
              buildName(),
              SizedBox(height: 3),
              buildLastName(),
              SizedBox(height: 8),
              buildParent(),
              SizedBox(height: 8),
              buildMail(),
              SizedBox(height: 16),
              buildPhone(),
              SizedBox(height: 8),
            ],
          ),
        ),
      );

  Widget buildName() =>
      TextFormField(
        maxLines: 1,
        initialValue: nombre,
        style: TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Nombre',
          hintStyle: TextStyle(color: Colors.white70),
        ),
        validator: (title) =>
        title != null && title.isEmpty
            ? 'El nombre no debe estar vacio'
            : null,
        onChanged: onChangedNombre,
      );

  Widget buildLastName() =>
      TextFormField(
        maxLines: 5,
        initialValue: apellido,
        style: TextStyle(color: Colors.white60, fontSize: 18),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Apellido',
          hintStyle: TextStyle(color: Colors.white60),
        ),
        validator: (title) =>
        title != null && title.isEmpty
            ? 'El Apellido no puede estar vacío'
            : null,
        onChanged: onChangedApellido,
      );

  Widget buildParent() =>
      TextFormField(
        maxLines: 5,
        initialValue: parentesco,
        style: TextStyle(color: Colors.white60, fontSize: 18),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Parentesco',
          hintStyle: TextStyle(color: Colors.white60),
        ),
        validator: (title) =>
        title != null && title.isEmpty
            ? 'El parentesco no puede estar vacío'
            : null,
        onChanged: onChangedParentesco,
      );

  Widget buildMail() =>
      TextFormField(
        maxLines: 5,
        initialValue: correo,
        style: TextStyle(color: Colors.white60, fontSize: 18),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Correo',
          hintStyle: TextStyle(color: Colors.white60),
        ),
        validator: (title) =>
        title != null && title.isEmpty
            ? 'El correo no puede estar vacío'
            : null,
        onChanged: onChangedCorreo,
      );

  Widget buildPhone() =>
      TextFormField(
        maxLines: 5,
        initialValue: correo,
        style: TextStyle(color: Colors.white60, fontSize: 18),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Telefono',
          hintStyle: TextStyle(color: Colors.white60),
        ),
        validator: (title) =>
        title != null && title.isEmpty
            ? 'El telefono no puede estar vacío'
            : null,
        onChanged: onChangedTelefono,
      );

}