

import 'package:SMV2/constants/valueConstants.dart';
import 'package:SMV2/utils/AppSessionRX.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as dev;

class AppSession
{
  static SharedPreferences? _prefs;
  static Future<SharedPreferences> get _instance async =>
      _prefs ??= await SharedPreferences.getInstance();

  //generics
  Future<void> setString(String key, String value) async =>
      (await _instance).setString(key, value);

  Future<String?> getString(String key) async =>
      (await _instance).getString(key);

  //customs
  Future<void> clear() async =>
      (await _instance).clear();


  // late final SharedPreferences sPref;
  // AppSession(this.sPref);

  // clear() async
  // {await sPref.clear();}

  // final CurrentUser currentUser = Get.find<CurrentUser>();
  static /*const*/ _CurrentUser currentUser = /*const*/ _CurrentUser();
}

class _CurrentUser{
  /*const*/ _CurrentUser();
  // late final SharedPreferences spref_cu;
  // CurrentUser(this.spref_cu);

  static SharedPreferences? _prefs_currentUser;
  static Future<SharedPreferences> get _instance async =>
      _prefs_currentUser ??= await SharedPreferences.getInstance();

  //generics
  Future<void> setString(String key, String value) async => (await _instance).setString(key, value);
  Future<String?> getString(String key) async => (await _instance).getString(key) ?? "";
  //for int
  Future<void> setInt(String key, int value) async => (await _instance).setInt(key, value);
  Future<int> getInt(String key) async => (await _instance).getInt(key) ?? 0;



  //customs
  Future<bool> clear() async => (await _instance).clear();

  // var userRole = UserRole.UNKNOWN.obs;

  handleCurrentUserData({
    required access_id,
    required label_id,
    required user_id,
    required login_id,
    required token_id,
     admin_id,
     s_admin_id,
     school_id,
    required first_name,
     last_name,
    required gender,
    required nic_number,
    email,
    required contact1,
    contact2,
    required address,
    pic,
    longitude,
    latitude,
  })
  async
  {

    await _set_access_id(access_id);
    await _set_label_id(label_id);
    await _set_user_id(user_id);
    await _set_login_id(login_id);
    await _set_token_id(token_id);
    await _set_admin_id(admin_id);
    await _set_s_admin_id(s_admin_id??0);
    await _set_school_id(school_id);
    await _set_first_name(first_name);
    await _set_last_name(last_name??"");
    await _set_gender(gender);
    await _set_nic_number(nic_number);
    await _set_email(email??"");
    await _set_contact_1(contact1);
    await _set_contact_2(contact2??"");
    await _set_address(address);
    await _set_pic(pic??"");
    await _set_longitude(longitude??"");
    await _set_latitude(latitude??"");

    // _userRole();
    final appSessO = Get.find<AppSessionRX>();
    appSessO.updUserRole();

  }

  //extras
  Future<bool> isUserSessionPresent()
  async
  {
    int uid = await user_id() ?? 0;

    return (uid > 0) ? true : false;
  }

  /*Future<UserRole>*/
  // _userRole()
  // async{
  //   dev.log("_userRole() -> init");
  //   var labelId = await label_id();
  //   // var convertedLID = 0;
  //   //
  //   if(labelId != null){
  //   //   if(labelId == ""){
  //   //     convertedLID = 0;
  //   //   }else{
  //   //     try{
  //   //       convertedLID = int.parse(labelId);
  //   //     }
  //   //     catch(e){
  //   //       dev.log("invalid String");
  //   //     }
  //   //   }
  //
  //
  //     dev.log("_userRole() -> labelId -> ${labelId}");
  //     // switch(convertedLID)
  //     switch(labelId)
  //     {
  //       case 1 :{
  //         // return UserRole.SADMIN;
  //         dev.log("_userRole() -> is SA");
  //         userRole(UserRole.SADMIN) ;
  //         break;
  //       }
  //
  //       case 2 :{
  //         // return UserRole.ADMIN;
  //         dev.log("_userRole() -> is AD");
  //         userRole( UserRole.ADMIN);
  //         break;
  //       }
  //
  //       case 3 :{
  //         dev.log("_userRole() -> is SU");
  //         userRole(UserRole.SUPERVISOR);
  //         // return UserRole.SUPERVISOR;
  //         break;
  //       }
  //
  //       case 4 :{
  //         dev.log("_userRole() -> is DR");
  //         userRole(UserRole.DRIVER);
  //         // return UserRole.DRIVER;
  //         break;
  //       }
  //
  //       case 5 :{
  //         dev.log("_userRole() -> is PR");
  //         // return UserRole.PARENT;
  //         userRole( UserRole.PARENT);
  //         break;
  //       }
  //
  //       default:{
  //         dev.log("_userRole() -> is UK");
  //         // return UserRole.UNKNOWN;
  //         userRole(UserRole.UNKNOWN);
  //         break;
  //       }
  //     }
  //   }else{
  //     dev.log("_userRole() -> is UK");
  //     // return UserRole.UNKNOWN;
  //     userRole(UserRole.UNKNOWN);
  //   }
  //
  //
  // }

  //access_id
  Future<void> _set_access_id(int access_id)=> setInt("access_id", access_id);
  Future<int?> access_id()=> getInt ("access_id") ;

  //label_id
  Future<void> _set_label_id(int label_id)=> setInt("label_id", label_id);
  Future<int?> label_id()=> getInt ("label_id") ;
  //user_id
  Future<void> _set_user_id(int user_id)=> setInt("user_id", user_id);
  Future<int?> user_id() => getInt ("user_id");
  //login_id
  Future<void> _set_login_id(String login_id)=> setString("login_id", login_id);
  Future<String?> login_id()=> getString ("login_id") ;
  //token_id
  Future<void> _set_token_id(String token_id)=> setString("token_id", token_id);
  Future<String?> token_id()=> getString ("token_id") ;
  //admin_id
  Future<void> _set_admin_id(int admin_id)=> setInt("admin_id", admin_id);
  Future<int?> admin_id()=> getInt ("admin_id") ;
  //s_admin_id
  Future<void> _set_s_admin_id(int s_admin_id)=> setInt("s_admin_id", s_admin_id);
  Future<int?> s_admin_id()=> getInt ("s_admin_id") ;
  //school_id
  Future<void> _set_school_id(int school_id)=> setInt("school_id", school_id);
  Future<int?> school_id()=> getInt ("school_id") ;
  //first_name
  Future<void> _set_first_name(String first_name)=> setString("first_name", first_name);
  Future<String?> first_name()=> getString ("first_name") ;
  //last_name
  Future<void> _set_last_name(String last_name)=> setString("last_name", last_name);
  Future<String?> last_name()=> getString ("last_name") ;

  //full_name
  // Future<void> _set_last_name(String last_name)=> setString("last_name", last_name);
  full_name() async{

    String fn = (await first_name())??"";
    String ln = (await last_name())??"";

    return  ( fn +" "+ ln)  ;
  }

  //gender
  Future<void> _set_gender(String gender)=> setString("gender", gender);
  Future<String?> gender()=> getString ("gender") ;
  //nic_number
  Future<void> _set_nic_number(String nic_number)=> setString("nic_number", nic_number);
  Future<String?> nic_number()=> getString ("nic_number") ;
  //email
  Future<void> _set_email(String email)=> setString("email", email);
  Future<String?> email()=> getString ("email") ;
  //contact_1
  Future<void> _set_contact_1(String contact_1)=> setString("contact_1", contact_1);
  Future<String?> contact_1()=> getString ("contact_1") ;
  //contact_2
  Future<void> _set_contact_2(String contact_2)=> setString("contact_2", contact_2);
  Future<String?> contact_2()=> getString ("contact_2") ;
  //address
  Future<void> _set_address(String address)=> setString("address", address);
  Future<String?> address()=> getString ("address") ;
  //pic
  Future<void> _set_pic(String pic)=> setString("pic", pic);
  Future<String?> pic()=> getString ("pic") ;
  //longitude
  Future<void> _set_longitude(String longitude)=> setString("longitude", longitude);
  Future<String?> longitude()=> getString ("longitude") ;
  //latitude
  Future<void> _set_latitude(String latitude)=> setString("latitude", latitude);
  Future<String?> latitude()=> getString ("latitude") ;

}



// class _currentUser{
//   late final SharedPreferences spref_cu;
//   _currentUser(this.spref_cu);
//
//   _set_access_id(String access_id){spref_cu.setString("access_id", access_id);}
//   String access_id(){return (spref_cu.getString("access_id")??"0") ;}
//
//
//
// }