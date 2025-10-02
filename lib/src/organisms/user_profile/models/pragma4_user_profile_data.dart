/// Modelo de datos del perfil de usuario
class Pragma4UserProfileData {
  const Pragma4UserProfileData({
    required this.id,
    required this.name,
    required this.avatarUrl,
    this.title,
    this.email,
    this.bio,
  });

  final String id;
  final String name;
  final String avatarUrl;
  final String? title;
  final String? email;
  final String? bio;

  /// Obtiene las iniciales del nombre para el avatar
  String get initials => name.isNotEmpty ? name[0] : '?';

  /// Indica si el usuario tiene información de contacto
  bool get hasContactInfo => email != null;

  /// Indica si el usuario tiene información profesional
  bool get hasProfessionalInfo => title != null;

  /// Indica si el usuario tiene biografía
  bool get hasBio => bio != null && bio!.isNotEmpty;
}