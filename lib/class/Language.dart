class Language {
  final int id;
  final String name;
  final String flag;
  final String languageCode;
  Language(this.id, this.name, this.flag, this.languageCode);
  static List<Language> languageList() {
    return <Language>[
      Language(1, 'Thailand', 'TH', 'th'),
      Language(2, 'English', '🇺🇸', 'en'),
      Language(3, 'Arabic', '🇸🇦', 'ar'),
      Language(4, 'Hindi', '🇮🇳', 'hi'),
      Language(5, 'Spanish', '🇪🇸', 'es'),
      Language(6, 'Portuguese', '🇵🇹', 'pt'),
      Language(7, 'Russian', '🇷🇺', 'ru'),
      Language(8, 'Japanese', '🇯🇵', 'ja'),
      Language(9, 'German', '🇩🇪', 'de'),
      Language(10, 'French', '🇫🇷', 'fr'),
    ];
  }
}
