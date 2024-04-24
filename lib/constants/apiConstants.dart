class ApiConst{

  static const String _PROTOCOL = 'http://';
  // static const String _SERVER = '154.56.60.109/';//hostinger nevironment
  static const String _SERVER = '127.0.0.1/';//LocalHost

  static const String _FOLDER_PATH = 'SmartVanApiV2/api/';//local abic system
  // static const String _FOLDER_PATH = 'smartvan/api/';

  static const String _API_VERSION = 'v2/';

  static const String BASE_URL = '${_PROTOCOL}${_SERVER}${_FOLDER_PATH}${_API_VERSION}';

  //auth
  static const String _MODULE_AUTH = 'auth/';
  static const String URL_LOGIN = '${_MODULE_AUTH}login';



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