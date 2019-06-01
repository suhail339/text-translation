class Language{
  final String code;
  final String name;

  Language(this.code, this.name);

  Language.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        name = json['name'];

  Map<String, dynamic> toJson() =>
      {
        'code': code,
        'name': name,
      };
}