import 'package:flutter/material.dart';

import '../db/contacts_database.dart';
import '../model/contact.dart';
import '../widget/contact_form_widget.dart';
//import 'package:trabajo_grupal_flutter/widget/note_form_widget.dart';

class AddEditContactPage extends StatefulWidget {
  final Contact? contact;

  const AddEditContactPage({
    Key? key,
    this.contact,
  }) : super(key: key);

  @override
  _AddEditContactPageState createState() => _AddEditContactPageState();
}

class _AddEditContactPageState extends State<AddEditContactPage> {
  final _formKey = GlobalKey<FormState>();
  late int number;
  late String nombre;
  late String apellido;
  late String parentesco;
  late String correo;
  late String telefono;

  @override
  void initState() {
    super.initState();

    number = widget.contact?.number ?? 0;
    nombre = widget.contact?.nombre ?? '';
    apellido = widget.contact?.apellido ?? '';
    parentesco = widget.contact?.parentesco ?? '';
    correo = widget.contact?.correo ?? '';
    telefono = widget.contact?.telefono ?? '';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [buildButton()],
        ),
        body: Form(
          key: _formKey,
          child: ContactFormWidget(
            number: number,
            nombre: nombre,
            apellido: apellido,
            parentesco: parentesco,
            correo: correo,
            telefono: telefono,
            onChangedNumber: (number) => setState(() => this.number = number),
            onChangedNombre: (nombre) => setState(() => this.nombre = nombre),
            onChangedApellido: (apellido) =>
                setState(() => this.apellido = apellido),
            onChangedParentesco: (parentesco) =>
                setState(() => this.correo = parentesco),
            onChangedCorreo: (correo) => setState(() => this.correo = correo),
            onChangedTelefono: (telefono) =>
                setState(() => this.telefono = correo),
          ),
        ),
      );

  Widget buildButton() {
    final isFormValid = nombre.isNotEmpty && apellido.isNotEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: isFormValid ? null : Colors.grey.shade700,
        ),
        onPressed: addOrUpdateNote,
        child: Text('Guardar'),
      ),
    );
  }

  void addOrUpdateNote() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.contact != null;

      if (isUpdating) {
        await updateNote();
      } else {
        await addNote();
      }

      Navigator.of(context).pop();
    }
  }

  Future updateNote() async {
    final note = widget.contact!
        .copy(number: number, nombre: nombre, apellido: apellido);

    await ContactsDatabase.instance.update(note);
  }

  Future addNote() async {
    final note = Contact(
      number: number,
      nombre: nombre,
      apellido: apellido,
      parentesco: parentesco,
      correo: correo,
      telefono: telefono,
      createdTime: DateTime.now(),
    );

    await ContactsDatabase.instance.create(note);
  }
}
