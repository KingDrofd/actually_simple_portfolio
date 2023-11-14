import 'package:flutter/material.dart';

class CheckPhone {}

bool checkPhone(BuildContext context, {double size = 700}) {
  if ((MediaQuery.sizeOf(context).width) < size) {
    return true;
  } else {
    return false;
  }
}
