class ApiConst{

  static const String _PROTOCOL = 'http://';
  // static const String _SERVER = '154.56.60.109/';//hostinger nevironment
  // static const String _SERVER = '10.0.1.24/';//LocalHost - ABIC
  static const String _SERVER = '192.168.0.110/';//LocalHost - HOME

  static const String _FOLDER_PATH = 'SmartVanApiV2/api/';//local abic system
  // static const String _FOLDER_PATH = 'smartvan/api/';

  static const String _API_VERSION = 'v2/';

  static const String BASE_URL = '${_PROTOCOL}${_SERVER}${_FOLDER_PATH}${_API_VERSION}';

  //auth
  static const String _MODULE_AUTH = 'auth/';
  static const String URL_LOGIN = '${_MODULE_AUTH}login';

  //dc
  static const String _MODULE_DC = 'dc/';
  static const String URL_SCHOOL_DETS_FOR_ADMINS = '${_MODULE_DC}getschooldetsforadmin';
  static const String URL_SCHOOL_NEW_FOR_ADMINS = '${_MODULE_DC}m_addschoolforadmin';
  static const String URL_STUDENT_DETS_FOR_ADMINS = '${_MODULE_DC}m_getstudentsforadmin';
  static const String URL_STUDENT_NEW_FOR_ADMINS = '${_MODULE_DC}m_addstudentforadmin';
  static const String URL_VANS_DETS_FOR_ADMINS = '${_MODULE_DC}m_getvansforadmin';
  static const String URL_VANS_NEW_FOR_ADMINS = '${_MODULE_DC}m_addvanforadmin';


  //Google Maps Related
  static const String GOOGLE_API_KEY = "AIzaSyBbnJMcOAOF5hP0GVMgbKduGtYRa5Q56v0";
}

// class _env_liveHostinger implements interface_api_attributes{
//   const _env_liveHostinger();
//
//   @override
//   BASE_URL() {
//     // TODO: implement BASE_URL
//     throw UnimplementedError();
//   }
//
//   @override
//   _SERVER() {
//     // TODO: implement _SERVER
//     throw UnimplementedError();
//   }
//
//   @override
//   _MODULE_AUTH() {
//     // TODO: implement _MODULE_AUTH
//     throw UnimplementedError();
//   }
//
//   // @override
//   // _MODULE_DC() {
//   //   // TODO: implement _MODULE_DC
//   //   throw UnimplementedError();
//   // }
//
//   @override
//   _PROTOCOL() {
//     // TODO: implement _PROTOCOL
//     throw UnimplementedError();
//   }
//
//   // http://154.56.60.109/webserv_smartvan/auth/updatefcmtoken
//   // static const BASE_URL = "";
//
//
// }
//
//
// //api attributes interface
// abstract class interface_api_attributes{
//
//   _PROTOCOL();
//   _SERVER();
//   _MODULE_AUTH();
//   _MODULE_DC(){
//
//   }
//   BASE_URL();
//
// }