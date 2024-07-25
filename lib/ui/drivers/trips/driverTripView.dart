import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:SMV2/constants/uiConstants.dart';

class DriverTripView extends StatefulWidget {
  const DriverTripView({Key? key}) : super(key: key);

  @override
  State<DriverTripView> createState() => _DriverTripViewState();
}

class _DriverTripViewState extends State<DriverTripView> {
  static const LatLng _karachi = LatLng(24.8607, 67.0011);

  // Dummy student data
  final List<Map<String, String>> students = [
    {
      'name': 'Student A',
      'address': 'Address A',
      'parent': 'parent A',
      'contact': '123456789',
      'status': 'Next',
      'image': 'assets/images/def_student.png',
    },
    {
      'name': 'Student B',
      'address': 'Address B',
      'parent': 'parent B',
      'contact': '123456789',
      'status': 'Waiting',
      'image': 'assets/images/def_student.png',
    },
    {
      'name': 'Student C',
      'address': 'Address C',
      'parent': 'parent C',
      'contact': '123456789',
      'status': 'PickedUp',
      'image': 'assets/images/def_student.png',
    },
    {
      'name': 'Student D',
      'address': 'Address D',
      'parent': 'parent D',
      'contact': '123456789',
      'status': 'Absent',
      'image': 'assets/images/def_student.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    String routeName = "Route A";
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    String formattedTime = DateFormat('hh:mm a').format(now);

    int totalStudents = 30;
    int pickedStudents = 20;
    int absentStudents = 5;
    int remainingStudents = totalStudents - pickedStudents - absentStudents;

    return Scaffold(
      body: Stack(
        children: [
          const GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _karachi,
              zoom: 13,
            ),
          ),
          Positioned(
            top: 10,
            left: 5,
            right: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              routeName,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(formattedDate),
                                Text(formattedTime),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Students',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildStudentInfoCard('Total', totalStudents),
                            _buildStudentInfoCard('Picked', pickedStudents),
                            _buildStudentInfoCard('Absent', absentStudents),
                            _buildStudentInfoCard(
                                'Remaining', remainingStudents),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: students
                        .map((student) => _buildStudentCard(student))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStudentInfoCard(String title, int count) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(
          '$count',
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildStudentCard(Map<String, String> student) {
    return GestureDetector(
      onTap: () => _showStudentPopup(student),
      child: Card(
        child: Container(
          width: 200,
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  student['image']!,
                  width: 50,
                  height: 50,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 2.0),
                      decoration: BoxDecoration(
                        color: _getStatusColor(student['status']!),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        student['status']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      student['name']!,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(student['address']!),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showStudentPopup(Map<String, String> student) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(student['name']!),
              IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Parent: ${student['parent']}'),
              const SizedBox(height: 10),
              Text('Contact #: ${student['contact']}'),
              const SizedBox(height: 10),
              Text('Address: ${student['address']}'),
            ],
          ),
          actions: <Widget>[
            student['status'] == 'Next'
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                            child: const Text(
                              'Pick Up',
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            child: const Text('Absent',
                                style: TextStyle(color: Colors.black)),
                            onPressed: () {},
                          ),
                        ),
                      ])
                : TextButton(
                    child: const Text('Close'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
          ],
        );
      },
    );
  }

  Color _getStatusColor(String status) {
    Color statusColor = Colors.white;
    if (status == 'Next') {
      statusColor = Color.fromRGBO(255, 198, 7, 1);
    } else if (status == 'Waiting') {
      statusColor = Colors.grey;
    } else if (status == 'PickedUp') {
      statusColor = Colors.green;
    } else if (status == 'Absent') {
      statusColor = Colors.red;
    }

    return statusColor;
  }
}
