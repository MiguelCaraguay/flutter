import 'package:flutter/material.dart';

import '../db/contacts_database.dart';
import '../model/contact.dart';
import '../widget/contact_form_widget.dart';

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
  late String nombre;
  late String apellido;
  late String parentesco;
  late String correo;
  late String telefono;

  @override
  void initState() {
    super.initState();

    nombre = widget.contact?.nombre ?? 'M';
    apellido = widget.contact?.apellido ?? 'A';
    parentesco = widget.contact?.parentesco ?? 'P';
    correo = widget.contact?.correo ?? 'C';
    telefono = widget.contact?.telefono ?? 'T';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text("Formulario"),
      ),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: ContactFormWidget(
              nombre: nombre,
              apellido: apellido,
              parentesco: parentesco,
              correo: correo,
              telefono: telefono,
              onChangedNombre: (nombre) => setState(() => this.nombre = nombre),
              onChangedApellido: (apellido) =>
                  setState(() => this.apellido = apellido),
              onChangedParentesco: (parentesco) =>
                  setState(() => this.correo = parentesco),
              onChangedCorreo: (correo) => setState(() => this.correo = correo),
              onChangedTelefono: (telefono) =>
                  setState(() => this.telefono = telefono),
            ),
          ),
          buildButton()
        ],
      ));

  Widget buildButton() {
    final isFormValid = nombre.isNotEmpty &&
        apellido.isNotEmpty &&
        parentesco.isNotEmpty &&
        correo.isNotEmpty &&
        telefono.isNotEmpty;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.blue[1000],
          primary: isFormValid ? null : Colors.blue[700],
        ),
        onPressed: addOrUpdateNote,
        child: Text('Guardar Personal',
            style: TextStyle(color: Colors.white, fontSize: 14)),
      ),
    );
  }

  void addOrUpdateNote() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.contact != null;
      print('valido');
      if (isUpdating) {
        await updateContact();
      } else {
        await addContact();
      }

      Navigator.of(context).pop();
    }
  }

  Future updateContact() async {
    final contact = widget.contact!.copy(
      nombre: nombre,
      apellido: apellido,
      parentesco: parentesco,
      correo: correo,
      telefono: telefono,
    );
    await ContactsDatabase.instance.update(contact);
  }

  Future addContact() async {
    final contact = Contact(
      nombre: nombre,
      apellido: apellido,
      parentesco: parentesco,
      correo: correo,
      telefono: telefono,
    );
    print(contact.telefono);
    print(contact.nombre);
    print(contact.apellido);
    print(contact.parentesco);
    await ContactsDatabase.instance.create(contact);
  }
}
