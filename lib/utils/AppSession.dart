
import 'package:SMV2/constants/valueConstants.dart';
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
  static const currentUser = const _CurrentUser();
}

class _CurrentUser{
  const _CurrentUser();
  // late final SharedPreferences spref_cu;
  // CurrentUser(this.spref_cu);

  static SharedPreferences? _prefs_currentUser;
  static Future<SharedPreferences> get _instance async =>
      _prefs_currentUser ??= await SharedPreferences.getInstance();

  //generics
  Future<void> setString(String key, String value) async => (await _instance).setString(key, value);
  Future<String?> getString(String key) async => (await _instance).getString(key) ?? "";

  //customs
  Future<bool> clear() async => (await _instance).clear();


  handleCurrentUserData({
    required access_id,
    required label_id,
    required user_id,
    required login_id,
    required token_id,
    required admin_id,
    required school_id,
    required first_name,
    required last_name,
    required gender,
    required nic_number,
    required email,
    required contact1,
    contact2,
    required address,
    required pic,
    required longitude,
    required latitude,
  })
  async
  {

    await _set_access_id(access_id);
    await _set_label_id(label_id);
    await _set_user_id(user_id);
    await _set_login_id(login_id);
    await _set_token_id(token_id);
    await _set_admin_id(admin_id);
    await _set_school_id(school_id);
    await _set_first_name(first_name);
    await _set_last_name(last_name);
    await _set_gender(gender);
    await _set_nic_number(nic_number);
    await _set_email(email);
    await _set_contact_1(contact1);
    await _set_contact_2(contact2??"");
    await _set_address(address);
    await _set_pic(pic);
    await _set_longitude(longitude);
    await _set_latitude(latitude);
  }

  //extras
  Future<bool> isUserSessionPresent()
  async
  {
    return !( (await user_id()) ?. isBlank ?? true);
  }
  Future<UserRole> userRole()
  async{
    var labelId = await label_id();
    var convertedLID = 0;

    if(labelId != null){
      if(labelId == ""){
        convertedLID = 0;
      }else{
        try{
          convertedLID = int.parse(labelId);
        }
        catch(e){
          dev.log("invalid String");
        }
      }



      switch(convertedLID)
      {
        case 1 :{
          return UserRole.SADMIN;
          break;
        }

        case 2 :{
          return UserRole.ADMIN;
          break;
        }

        case 3 :{
          return UserRole.SUPERVISOR;
          break;
        }

        case 4 :{
          return UserRole.DRIVER;
          break;
        }

        case 5 :{
          return UserRole.PARENT;
          break;
        }

        default:{
          return UserRole.UNKNOWN;
          break;
        }
      }
    }else{
      return UserRole.UNKNOWN;
    }


  }

  //access_id
  Future<void> _set_access_id(String access_id)=> setString("access_id", access_id);
  Future<String?> access_id()=> getString ("access_id") ;

  //label_id
  Future<void> _set_label_id(String label_id)=> setString("label_id", label_id);
  Future<String?> label_id()=> getString ("label_id") ;
  //user_id
  Future<void> _set_user_id(String user_id)=> setString("user_id", user_id);
  Future<String?> user_id() => getString ("user_id");
  //login_id
  Future<void> _set_login_id(String login_id)=> setString("login_id", login_id);
  Future<String?> login_id()=> getString ("login_id") ;
  //token_id
  Future<void> _set_token_id(String token_id)=> setString("token_id", token_id);
  Future<String?> token_id()=> getString ("token_id") ;
  //admin_id
  Future<void> _set_admin_id(String admin_id)=> setString("admin_id", admin_id);
  Future<String?> admin_id()=> getString ("admin_id") ;
  //school_id
  Future<void> _set_school_id(String school_id)=> setString("school_id", school_id);
  Future<String?> school_id()=> getString ("school_id") ;
  //first_name
  Future<void> _set_first_name(String first_name)=> setString("first_name", first_name);
  Future<String?> first_name()=> getString ("first_name") ;
  //last_name
  Future<void> _set_last_name(String last_name)=> setString("last_name", last_name);
  Future<String?> last_name()=> getString ("last_name") ;
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