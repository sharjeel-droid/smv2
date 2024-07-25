const String appName = 'SmartVanV2';
const String continue_trip = 'Continue Trip';
const String new_trip = 'New Trip';

class viewTitles{
  static const splash = 'Splash';
}
class errorMessages{
  static const unable_to_update_stat = 'Unable to Update Student Status';
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

enum StudentTripStatus{
  WAITING,
  NEXT,
  PICKED_UP,
  ABSENT,
  DROPPED_OFF,
}