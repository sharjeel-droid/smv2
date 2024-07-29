const String appName = 'SmartVanV2';

class viewTitles{
  static const splash = 'Splash';
}
class errorMessages{
  static const unable_to_update_stat = 'Unable to Update Student Status';
}

class StudentTripStatus{
  static const WAITING = "waiting";
  static const NEXT = "next";
  static const PICKED_UP = "pickedUp";
  static const ABSENT = "absent";
  static const DROPPED_OFF = "droppedOff";
  static const REACHED_SCHOOL = "reachedSchool";
}


enum UserRole{
  SADMIN,
  ADMIN,
  SUPERVISOR,
  DRIVER,
  PARENT,
  UNKNOWN
}

enum VehicleTypes{
  BUS,
  COASTER,
  HI_ACE,
  HI_ROOF,
  CAR,
  RIKSHAW,
  BIKE,
}

// enum StudentTripStatus{
//   WAITING,
//   NEXT,
//   PICKED_UP,
//   ABSENT,
//   DROPPED_OFF,
// }