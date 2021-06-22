import 'dart:io';
class Place {
  final String id;
  final String title;
  final location;
  final File image;
  Place({
    required this.id,
    required this.title,
    this.location,
    required this.image,
  });
}
