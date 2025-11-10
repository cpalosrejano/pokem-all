class Pokemon {
  final int id;
  final String nombre;
  final String imagen; // Esta será la URL

  const Pokemon({
    required this.id,
    required this.nombre,
    required this.imagen,
  });

  // Podríamos añadir fromJson, equatables, etc. pero lo mantenemos simple.
}