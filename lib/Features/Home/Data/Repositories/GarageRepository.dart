import 'package:dio/dio.dart';

import '../Models/GarageModel.dart';

class GarageRepository {
  final Dio dio;

  GarageRepository(this.dio);

  Future<List<GarageModel>> getNearbyGarages() async {
    final response = await dio.get(
      'https://fleetcatalog.disturbingbyte.pt/v1/makes',
    );

    final List items = response.data['items'];

    return items.map((item) => GarageModel.fromJson(item)).toList();
  }
}
