class FilterItemLevel2Model {
  final String id;
  final String name;

  FilterItemLevel2Model({
    required this.id,
    required this.name,
  });

  factory FilterItemLevel2Model.fromJson(Map<String, dynamic> json) {
    {
      return FilterItemLevel2Model(
        id: json['_id'],
        name: json['name'],
      );
    }
  }
}
