class FilterItemModel {
  final int id;
  final String name;
  final int? parentId;
  final String slug;

  FilterItemModel({
    required this.id,
    required this.name,
    this.parentId,
    required this.slug,
  });

  factory FilterItemModel.fromJson(Map<String, dynamic> json) {
    {
      return FilterItemModel(
          id: json['id'],
          name: json['name'],
          slug: json['slug'],
          parentId: json['parent_id']);
    }
  }
}
