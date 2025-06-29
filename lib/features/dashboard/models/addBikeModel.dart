class Addbikemodel {

String? bikeName;
  String? model;
  int? year;

  Addbikemodel({this.bikeName, this.model, this.year});

  Addbikemodel.fromJson(Map<String, dynamic> json) {
    bikeName = json['bikeName'];
    model = json['model'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bikeName'] = bikeName;
    data['model'] = model;
    data['year'] = year;
    return data;
  }

  @override
  String toString() {
    return 'Addbikemodel{bikeName: $bikeName, model: $model, year: $year}';
  }


}
