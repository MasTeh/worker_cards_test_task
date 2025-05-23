import 'package:talker_flutter/talker_flutter.dart';

abstract final class LoggerService {
  static final logger = TalkerLogger();

  static void log(Object? message) {
    logger.log(message);
  }

  static void debug(Object? message) {
    logger.debug(message);
  }

  static void logError(Object? exception) {
    logger.error(exception);
  }
}
