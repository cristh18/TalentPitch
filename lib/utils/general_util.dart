import 'package:logger/logger.dart';

String getConnectedValue(Object? obj) {
  if (obj is String || obj is int || obj is double || obj is bool) {
    return obj.toString();
  } else {
    final Logger logger = Logger();
    logger.e('Unsupported data type: ${obj.runtimeType}');
    return '';
  }
}
