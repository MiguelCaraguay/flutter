final String tableNotes = 'contactos';

class NoteFields {
  static final List<String> values = [
    /// Add all fields
    id,  nombre, apellido, parentesco, time, correo, telefono
  ];

  static final String id = '_id';
  static final String number = 'number';
  static final String nombre = 'nombre';
  static final String apellido = 'apellido';
  static final String parentesco = 'parentesco';
  static final String correo = 'correo';
  static final String telefono = 'celular';
  static final String time = 'time';
}

class Contact {
  final int? id;
  final int number;
  final String nombre;
  final String apellido;
  final String parentesco;
  final String correo;
  final String telefono;
  final DateTime createdTime;

  const Contact({
    this.id,

    required this.number,
    required this.nombre,
    required this.apellido,
    required this.parentesco,
    required this.correo,
    required this.telefono,
    required this.createdTime,
  });

  Contact copy(
      {int? id,
        bool? isImportant,
        int? number,
        String? nombre,
        String? apellido,
        String? parentesco,
        String? correo,
        String? celular,
        DateTime? createdTime}) =>
      Contact(
        id: id ?? this.id,
        number: number ?? this.number,
        nombre: nombre ?? this.nombre,
        apellido: apellido ?? this.apellido,
        parentesco: parentesco ?? this.parentesco,
        correo: parentesco ?? this.correo,
        telefono: parentesco ?? this.telefono,
        createdTime: createdTime ?? this.createdTime,
      );

  static Contact fromJson(Map<String, Object?> json) => Contact(
    id: json[NoteFields.id] as int?,
    number: json[NoteFields.number] as int,
    nombre: json[NoteFields.nombre] as String,
    apellido: json[NoteFields.apellido] as String,
    createdTime: DateTime.parse(json[NoteFields.time] as String),
    parentesco: json[NoteFields.parentesco] as String,
    correo: json[NoteFields.correo] as String,
    telefono: json[NoteFields.telefono] as String? ?? " ",
  );

  Map<String, Object?> toJson() => {
    NoteFields.id: id,
    NoteFields.nombre: nombre,
    NoteFields.number: number,
    NoteFields.apellido: apellido,
    NoteFields.parentesco: parentesco,
    NoteFields.correo: correo,
    NoteFields.telefono: telefono,
    NoteFields.time: createdTime.toIso8601String(),
  };
}