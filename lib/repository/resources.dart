import 'package:ddofinance/models/resources/resources_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ddofinance/services/base_service.dart';

class ResourcesRepository extends BaseService {
  Future<List<ResourcesModel>> resourcesDataRepository() async {
    String? authToken;
    try {
      Future<String?> getTokenFromLocalStorage() async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        authToken = prefs.getString('authToken')!;
        return authToken;
      }

      authToken = await getTokenFromLocalStorage();
      List<dynamic> response = await makeRequest(
        url: '',
        method: HttpMethod.get,
        authToken: authToken,
      );

      if ( response.isNotEmpty ) {
        List<ResourcesModel> resources = response
            .map((data) => ResourcesModel.fromJson(data))
            .toList();
        return resources;

      } else {
        throw 'HTTP Error: $response';
      }
    } catch (error) {
      throw 'Error on Add Project Screen: $error';
    }
  }
}
