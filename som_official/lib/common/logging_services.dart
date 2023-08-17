import 'package:logger/logger.dart';

class LoggingService {
  static final Logger _logger = Logger();

  static void logText(String text) {
    _logger.d(text);
  }
}
