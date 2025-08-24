class Verse {
  final String text;
  final String reference;

  Verse({required this.text, required this.reference});

  factory Verse.fromMap(Map<String, String> map) {
    return Verse(
      text: map['verse']!,
      reference: map['reference']!,
    );
  }
}