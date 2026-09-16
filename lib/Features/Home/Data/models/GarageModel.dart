class GarageModel {
  final String name;
  final String distance;

  const GarageModel({required this.name, required this.distance});

  factory GarageModel.fromJson(Map<String, dynamic> json) {
    return GarageModel(name: json['name'] ?? 'Unknown', distance: '-- km');
  }
}
