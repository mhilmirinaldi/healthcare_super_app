extension StrExtension on String {
  String capitalize() {
    if (this.isEmpty) {
      return this;
    } else if (this.length == 1) {
      return this.toUpperCase();
    } else {
      List<String> words = this.split(' ');
      List<String> capitalizedWords = words.map((word) {
        if (word.isEmpty) {
          return word;
        } else if (word.length == 1) {
          return word.toUpperCase();
        } else {
          return word[0].toUpperCase() + word.substring(1).toLowerCase();
        }
      }).toList();
      return capitalizedWords.join(' ');
    }
  }
}
