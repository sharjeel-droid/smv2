import 'package:SMV2/constants/navigationConstants.dart';
import 'package:SMV2/constants/uiConstants.dart';
import 'package:SMV2/constants/valueConstants.dart';
import 'package:SMV2/ui/drivers/dashboard/driverDashboardViewModel.dart';
import 'package:SMV2/ui/parents/dashboard/parentDashboardViewModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class ParentDashboard extends StatelessWidget {
  ParentDashboard({Key? key}) : super(key: key);

  // final ParentDashboardViewModel _viewModel = Get.find<ParentDashboardViewModel>();

  @override
  Widget build(BuildContext context) {
    // _viewModel.init();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // First Card
            Card(
              color: Colors.white,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
                child: Row(
                  children: [
                    // Image with border radius
                    Container(
                      width: 50,
                      height: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/def_student.png'), 
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Column with name, mobile, and text
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name", style: Theme.of(context).textTheme.headline6),
                        Text("+92123456789", style: Theme.of(context).textTheme.subtitle1), 
                        Text("3 kids registered", style: Theme.of(context).textTheme.bodyText2),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 16),
      
            Card(
              color: Colors.yellow.shade700,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ON GOING TRIP", style: Theme.of(context).textTheme.headline6),
                    const SizedBox(height: 16),
                    Row(
                  children: [
                    // Image with border radius
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/def_student.png'), 
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Column with name, mobile, and text
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("started at: 00:00 am", style: TextStyle(color: Colors.white)),
                        Text("expected to end at: 00:00 am", style: TextStyle(color: Colors.white)), 
                        Text("you are next to be picked up", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ],
                ),
                    
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Add button action
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Row(
                        children: [
                          Text("View Trip"),
                          SizedBox(height: 18),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
      
            const SizedBox(height: 16),
      
            Card(
              color: Colors.white,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("RECENT TRIPS", style: Theme.of(context).textTheme.subtitle1),
                        const Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildDynamicRow(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDynamicRow() {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text("Active", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const ExpansionTile(
          leading: Icon(Icons.arrow_drop_down),
          title: Text("Further Info"),
          children: [
            ListTile(
              title: Text("More details about the status..."),
            ),
          ],
        ),
      ],
    );
  }
}




// class ParentDashboard extends StatefulWidget {
//   const ParentDashboard(/*{super.key}*/);
//
//   @override
//   State<ParentDashboard> createState() => _ParentDashboardState();
// }
//
// class _ParentDashboardState extends State<ParentDashboard> {
//
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(mainAxisSize: MainAxisSize.max,
//     crossAxisAlignment: CrossAxisAlignment.center,
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: [
//
//       defaults.widget.flashCard(value: "003", title: "Driver Dash")
//
//
//
//     ],);
//
//
//
//     //   Center(
//     //   child: Text("admin dash"),
//     //   // drawer: const BaseNavigationDrawer(),
//     //   // appBar: AppBar(title: const Text("Dash")),
//     //
//     // );
//   }
// }
