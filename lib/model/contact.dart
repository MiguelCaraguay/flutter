final String tableContactos = 'contactos';

class ContactFields {
  static final List<String> values = [
    /// Add all fields
    id,  nombre, apellido, parentesco, correo, telefono
  ];

  static final String id = '_id';
  static final String number = 'number';
  static final String nombre = 'nombre';
  static final String apellido = 'apellido';
  static final String parentesco = 'parentesco';
  static final String correo = 'correo';
  static final String telefono = 'telefono';
}

class Contact {
  final int? id;
  final String nombre;
  final String apellido;
  final String parentesco;
  final String correo;
  final String telefono;

  const Contact({
    this.id,

    required this.nombre,
    required this.apellido,
    required this.parentesco,
    required this.correo,
    required this.telefono,
  });

  Contact copy(
      {int? id,
        String? nombre,
        String? apellido,
        String? parentesco,
        String? correo,
        String? telefono,
        DateTime? createdTime}) =>
      Contact(
        id: id ?? this.id,
        nombre: nombre ?? this.nombre,
        apellido: apellido ?? this.apellido,
        parentesco: parentesco ?? this.parentesco,
        correo: parentesco ?? this.correo,
        telefono: parentesco ?? this.telefono,
      );

  static Contact fromJson(Map<String, Object?> json) => Contact(
    id: json[ContactFields.id] as int?,
    nombre: json[ContactFields.nombre] as String,
    apellido: json[ContactFields.apellido] as String,
    parentesco: json[ContactFields.parentesco] as String,
    correo: json[ContactFields.correo] as String,
    telefono: json[ContactFields.telefono] as String? ?? " ",
  );

  Map<String, Object?> toJson() => {
    ContactFields.id: id,
    ContactFields.nombre: nombre,
    ContactFields.apellido: apellido,
    ContactFields.parentesco: parentesco,
    ContactFields.correo: correo,
    ContactFields.telefono: telefono,
  };
}