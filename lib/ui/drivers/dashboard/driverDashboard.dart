import 'package:SMV2/constants/navigationConstants.dart';
import 'package:SMV2/constants/uiConstants.dart';
import 'package:SMV2/constants/valueConstants.dart';
import 'package:SMV2/ui/drivers/dashboard/driverDashboardViewModel.dart';
import 'package:SMV2/domain/models/dc/DCDriverDashApiResponseDomainModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DriverDashboard extends StatelessWidget {
  DriverDashboard({Key? key}) : super(key: key);

  final DriverDashboardViewModel _viewModel =
      Get.find<DriverDashboardViewModel>();

  @override
  Widget build(BuildContext context) {
    _viewModel.init(); //getDashboardDetails();

    String newTrip = 'New Trip';
    String continueTrip = 'Continue Trip';

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Obx(
            () => defaults.widget.flashCard(
              value: _viewModel.schools.value?.school_name ?? "~",
              title: "School Name",
            ),
          ),
          Obx(
            () => defaults.widget.flashCard(
              value:
                  "${_viewModel.vehicle.value?.vehicle_type ?? "~"} : ${_viewModel.vehicle.value?.reg_number ?? "~"}",
              title: "Vehicle",
            ),
          ),
          Obx(() => defaults.widget.flashCard(
                value: _viewModel.route.value?.route_title ?? "~",
                title: "Route",
              )),
          Obx(() {
            return defaults.widget.flashCardActionable(
              value: _viewModel.tripToday.value.isEmpty
                  ? inforMessages.no_trips_today
                  : "",
              title: "TRIPS",
              content: _viewModel.tripToday.isNotEmpty
                  ? Center(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _viewModel.tripToday.length,
                        itemBuilder: (context, index) {
                          final trip = _viewModel.tripToday[index];
                          return ListTile(
                            title: Text(
                              '${trip.time_start ?? "N/A"} -> ${trip.status ?? "N/A"}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: defaults.font.size.body,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : null,
              buttonText:
                  _viewModel.tripActive.value.isEmpty ? newTrip : continueTrip,
              buttonColor: Colors.black,
              onButtonPressed: () {
                if (_viewModel.tripActive.isNotEmpty) {
                  String message = _viewModel.tripActive.value.isEmpty
                      ? newTrip
                      : continueTrip;
                  Fluttertoast.showToast(msg: message);
                  const navigate().todriverTripView();
                } else {
                  Fluttertoast.showToast(msg: 'No Trip Found Today.');
                }
              },
            );
          }),
        ],
      ),
    );
  }
}
