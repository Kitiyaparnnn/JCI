import 'package:flutter/material.dart';

class Constants {
  //app name
  static const String APP_NAME = "JCI";
  static const String APP_TITLE = "Quality Recording System";
  static const String CREATE_BY = "Copyright @2022 - Pose Intelligence Limited";

  //title
  static const String STERILE_TITLE = "Sterile Zone";
  static const String DIRTY_TITLE = "Dirty Zone";
  static const String CLEAN_TITLE = "Clean Zone";

  //subtitle
  static const String STERILE_SUBTITLE = "โซนปลอดเชื้อ";
  static const String DIRTY_SUBTITLE = "โซนสกปรก";
  static const String CLEAN_SUBTITLE = "โซนสะอาด";

  //app font
  static const String APP_FONT = "poppins";

  //routes
  static const String HOME_ROUTE = "/home";
  static const String LOGIN_ROUTE = "/login";

  static const String IMAGE_DIR = "lib/src/assets/images";

  //login
  static const String LOGO_IMAGE = "$IMAGE_DIR/logo.png";
  static const String SPLASH_IMAGE = "$IMAGE_DIR/splash.png";
  static const String BG_IMAGE = "$IMAGE_DIR/bg_login.png";
  static const String LOADING_TEXT = "POSE JCI...";

  //sterile
  static const String STERILE_TEXT_POINT1 =
      "Utilities Room Electric Box \nRO System Air Compressor";
  static const String STERILE_TEXT_POINT2 = "Spray Gun \n(Air Jet & Water Jet)";
  static const String STERILE_TEXT_POINT3 = "Drying Cabinet";
  static const String STERILE_TEXT_POINT4 = "Triple sink";

  //dirty
  static const String DIRTY_TEXT_POINT1 =
      "Utilities Room Electric Box \nRO System Air Compressor";
  static const String DIRTY_TEXT_POINT2 = "Drying Cabinet";
  static const String DIRTY_TEXT_POINT3 = "Triple sink";
  static const String DIRTY_TEXT_POINT4 = "Spray Gun \n(Air Jet & Water Jet)";

//clean
  static const String CLEAN_TEXT_POINT1 = "Triple sink";
  static const String CLEAN_TEXT_POINT2 =
      "Utilities Room Electric Box \nRO System Air Compressor";
  static const String CLEAN_TEXT_POINT3 = "Drying Cabinet";
  static const String CLEAN_TEXT_POINT4 = "Spray Gun \n(Air Jet & Water Jet)";

  static const String TEXT_CONFIRM = "ตกลง";
  static const String TEXT_CANCEL = "Cancel";
  static const String TEXT_SEARCH = "ค้นหา";
  static const String TEXT_DATA_NOT_FOUND = "ไม่พบข้อมูล";
  static const String TEXT_LOGIN_FAILED =
      "ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง กรุณาลองใหม่";
  static const String TEXT_LOGIN_SCAN_FAILED =
      "รหัสที่สแกนไม่มีอยู่ในระบบ กรุณาติดต่อเจ้าหน้านี้";
  static const String TEXT_FAILED = "ผิดพลาด";
  static const String TEXT_SUCCESS = "สำเร็จ";
  static const String TEXT_LOGOUT = "Log out";
  static const String TEXT_PROFILE = "Profile";
  static const String TEXT_SETTING = "Settings";
  static const String TEXT_LOGOUT_MESSAGE = "You want to log out?";
  static const String TEXT_SAVE = "บันทึก";
  static const String TEXT_SOME_THING_WRONG =
      "มีบางอย่างผิดพลาด กรุณาลองใหม่อีกครั้ง";
}
