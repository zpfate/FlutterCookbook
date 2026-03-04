
import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class CommandData {

  static int packageHead = 0xfaaf;

  static int commandId = 0x01;

  static int commadData = 0xBC;

  static int packageEnd = 0xfeef;

  static Uint8List getCommandData() {
    Uint8List uint8list = Uint8List.fromList([packageHead,commandId,commadData, packageEnd]);
    Color(0xff);
    return uint8list;
  }

}