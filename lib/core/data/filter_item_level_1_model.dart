import 'package:flutter_ecommerce_app/core/data/filter_item_level_2_model.dart';

class FilterItemLevel1Model {
  final String id;
  final String name;
  final List<FilterItemLevel2Model>? listFilterLevel2;

  FilterItemLevel1Model({
    required this.id,
    required this.name,
    this.listFilterLevel2,
  });

  factory FilterItemLevel1Model.fromJson(Map<String, dynamic> json) {
    {
      return FilterItemLevel1Model(
        id: json['_id'],
        name: json['name'],
        listFilterLevel2: List<Map<String, dynamic>>.from(
          json['list_filter_level_2'],
        )
            .map(
              (e) => FilterItemLevel2Model.fromJson(e),
            )
            .toList(),
      );
    }
  }
}
