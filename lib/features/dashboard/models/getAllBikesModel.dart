class GetAllBikesModel {
  final String id;
  final String bikeName;
  final String model;
  final int year;
  final String createdAt;

  GetAllBikesModel({
    required this.id,
    required this.bikeName,
    required this.model,
    required this.year,
    required this.createdAt,
  });

  factory GetAllBikesModel.fromJson(Map<String, dynamic> json) {
    return GetAllBikesModel(
      id: json['_id'] ,
      bikeName: json['bikeName'],
      model: json['model'] ,
      year: json['year'] ,
      createdAt: json['createdAt'] ,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'bikeName': bikeName,
      'model': model,
      'year': year,
      'createdAt': createdAt,
    };
  }
}