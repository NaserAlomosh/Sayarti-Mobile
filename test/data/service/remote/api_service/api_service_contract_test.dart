import 'package:flutter_test/flutter_test.dart';
import 'package:retrofit/dio.dart';
import 'package:sayarti_mobile/data/model/remote/response/dashboard/dashboard_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/vehicle_activity/get_vehicle_activity_response_model.dart';
import 'package:sayarti_mobile/data/service/remote/api_service/api_service.dart';

// These typed tear-offs make changes to either repository-facing method
// signature a compile-time failure without issuing a network request.
final Future<HttpResponse<DashboardResponseModel>> Function(ApiService, String)
dashboardApiContract = (service, vehicleId) =>
    service.getDashboard(vehicleId);

final Future<HttpResponse<GetVehicleActivityResponseModel>> Function(
  ApiService,
  String,
  int?,
)
vehicleActivityApiContract = (service, vehicleId, limit) =>
    service.getVehicleActivity(vehicleId, limit);

void main() {
  test('exposes the dashboard and vehicle activity contracts', () {
    expect(dashboardApiContract, isNotNull);
    expect(vehicleActivityApiContract, isNotNull);
  });
}
