
import 'package:decimal/decimal.dart';
import 'package:rational/rational.dart';
import 'dart:math' as math;
/// 浮点数精准计算
class NumUtils {

  static String add(String num1, String num2) {
    Decimal decimal = Decimal.parse(num1) + Decimal.parse(num2);
    return decimal.toString();
  }

  static String minus(String num1, String num2) {
    Decimal decimal = Decimal.parse(num1) - Decimal.parse(num2);
    return decimal.toString();
  }

  static String multiply(String num1, String num2) {
    Decimal decimal = Decimal.parse(num1) * Decimal.parse(num2);
    return decimal.toString();
  }

  static String divide(String num1, String num2) {
    Rational rational = Decimal.parse(num1) / Decimal.parse(num2);
    return rational.toString();
  }
}

/// 字符串保留几位小数扩展
extension NumUtilsExtension on String {

  String toStringAsFixed({int fractionDigits = 2}) {
    num? value = num.tryParse(this);
    if (value != null) {
      return value.toStringAsFixed(fractionDigits);
    }
    return "";
  }

  /// 保留几位小数并舍弃其余小数位
  String toStringAsRounded({int scale = 0}) {
    num? value = num.tryParse(this);
    if (value != null) {
      num result = (value * math.pow(10, scale)).truncate() / math.pow(10, scale);
      return result.toString();
    }
    return "";
  }
}

