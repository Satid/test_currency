import 'dart:convert';


class ApiService {
  // String endpoint = 'https://kontin.net/mobileapi/api/Dashboard?userId=41477c10-d62a-4331-a249-f80ded7b26bd';
  // Future<List<DashboardModel>> getDashboard() async {
  //   Response response = await get(Uri.parse(endpoint));
  //   if (response.statusCode == 200) {
  //     final List result = jsonDecode(response.body)['data'];
  //     return result.map(((e) => DashboardModel.fromJson(e))).toList();
  //   } else {
  //     throw Exception(response.reasonPhrase);
  //   }
  // }

  //String endpointLogin = 'https://kontin.net/mobileapi/api/Login?username=KHOUANCHAY&password=123456';
  // String endpointLogin = 'https://kontin.net/mobileapi/api/Login?username=kcsall&password=kcsall';

  // Future<LoginModel> getLogin(String userName, String password) async {
  //   String endpointLogin = 'https://kontin.net/mobileapi/api/Login?username=' +
  //       userName +
  //       '&password=' +
  //       password;
  //   Response response = await get(Uri.parse(endpointLogin));
  //   if (response.statusCode == 200) {
  //     final LoginModel = await loginModelFromJson(response.body);
  //     return LoginModel;
  //   } else {
  //     throw Exception(response.reasonPhrase);
  //   }
  // }

  // String endpointDashboard =
  //     'https://kontin.net/mobileapi/api/Dashboard?userId=71db4bb8-5bcd-4777-be70-c46a90ef9385';

  // Future<DashboardModel> getDashboard(String userId) async {
  //   String endpointDashboard =
  //       'https://kontin.net/mobileapi/api/Dashboard?userId=' + userId;
  //   Response response = await get(Uri.parse(endpointDashboard));
  //   if (response.statusCode == 200) {
  //     final dashboardModel = await dashboardModelFromJson(response.body);
  //     return dashboardModel;
  //   } else {
  //     throw Exception(response.reasonPhrase);
  //   }
  // }

  // String endpointTracking =
  //     'https://kontin.net/mobileapi/api/Tracking?userId=71db4bb8-5bcd-4777-be70-c46a90ef9385';

  // Future<List<TrackingModel>> getTracking(String userId, int type) async {
  //   // String endpointTracking =
  //   //     'https://kontin.net/mobileapi/api/Tracking?userId=' + userId;
  //   String endpointTracking = 'https://kontin.net/mobileapi/api/Tracking/' +
  //       userId +
  //       '?type=' +
  //       type.toString();
  //   Response response = await get(Uri.parse(endpointTracking));
  //   if (response.statusCode == 200) {
  //     final trackingModel = await trackingModelFromJson(response.body);
  //     return trackingModel;
  //   } else {
  //     throw Exception(response.reasonPhrase);
  //   }
  // }
  //
  // Future<List<TrackingModel>> getHistory(
  //     int vehicleId, String dateTime, int period) async {
  //   String endpointTracking =
  //       'https://kontin.net/mobileapi/api/History?vehicleId=${vehicleId}&dateTime=${dateTime}&period=${period}';
  //   Response response = await get(Uri.parse(endpointTracking));
  //   if (response.statusCode == 200) {
  //     final trackingModel = await trackingModelFromJson(response.body);
  //     return trackingModel;
  //   } else {
  //     throw Exception(response.reasonPhrase);
  //   }
  // }
  //
  // Future<List<PoiTypeModel>> getTypePoi(String poiMasterData) async {
  //   String endpointTypePoi = 'https://kontin.net/mobileapi/api/MasterData/228';
  //   Response response = await get(Uri.parse(endpointTypePoi));
  //   if (response.statusCode == 200) {
  //     List<PoiTypeModel> poiTypeModel =
  //         await poiTypeModelFromJson(response.body);
  //     return poiTypeModel;
  //   } else {
  //     throw Exception(response.reasonPhrase);
  //   }
  // }

  // Future<ReturnStatus> fetchSomeDataFromApi(
  //     int poiId,
  //     String userId,
  //     int companyId,
  //     String poiEN,
  //     String poiTH,
  //     String typeName,
  //     double latitude,
  //     double longitude,
  //     String address,
  //     String district,
  //     String amphur,
  //     String province,
  //     String postCode,
  //     )  async {
  //   String endpointUrl = 'https://kontin.net/mobileapi/api/MasterData/' +
  //       poiId.toString() +
  //       '?userId=' +
  //       userId +
  //       '&companyId=' +
  //       companyId.toString() +
  //       '&poiEN=' +
  //       poiEN +
  //       '&poiTH=' +
  //       poiTH +
  //       '&typeName=' +
  //       typeName +
  //       '&latitude=' +
  //       latitude.toString() +
  //       '&longitude=' +
  //       longitude.toString() +
  //       '&address=' +
  //       address +
  //       '&district=' +
  //       district +
  //       '&amphur=' +
  //       amphur +
  //       '&province=' +
  //       province +
  //       '&postCode=' +
  //       postCode;
  //   final response = await post(Uri.parse(endpointUrl),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: null,
  //   );
  //
  //   if (response.statusCode == 200) {
  //     //var returnValue = ReturnStatus.fromJson(json.decode(response.body));
  //     final jsonMap = jsonDecode(response.body) as Map<String, dynamic>;
  //     final returnStatus = ReturnStatus.fromJson(jsonMap);
  //     //var returnValue = ReturnStatus.fromJson(jsonDecode(response.body));
  //     return returnStatus;
  //   } else {
  //     throw Exception('Failed to create album.');
  //   }
  //   // if (response.statusCode == 200) {
  //   //   return jsonDecode(response.body);
  //   // } else {
  //   //   throw Exception('Failed to fetch data from API');
  //   // }
  // }


}


