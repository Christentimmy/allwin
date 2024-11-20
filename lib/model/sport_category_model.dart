class SportCategoryModel {
  final int id;
  final String name;
  final int icon;
  final String slug;

  SportCategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.slug,
  });

  factory SportCategoryModel.fromJson(var json) {
    return SportCategoryModel(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      icon: json["icon"] ?? 0,
      slug: json["slug"] ?? "",
    );
  }
}
