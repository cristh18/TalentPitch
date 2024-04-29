import 'package:logger/logger.dart';

String getConnectedValue(Object obj) {
  try {
    if (obj is String) {
      return obj;
    } else if (obj is int) {
      return obj.toString();
    } else if (obj is double) {
      return obj.toString();
    } else if (obj is bool) {
      return obj.toString();
    } else {
      return '';
    }
  } catch (e) {
    final Logger logger = Logger();
    logger.e(e);
    return '';
  }
}
