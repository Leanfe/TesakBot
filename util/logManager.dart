import 'dart:convert';
import 'dart:io';

import 'package:intl/intl.dart';

enum LogOperationType {
  ERROR,
  WARN,
  INFO
}

class LogManager {

  DateFormat publicFormat = DateFormat("yyyy-MM-dd HH:mm");

  File log;

  void init() {
    DateFormat fileFormat = DateFormat("yyyy-MM-dd");

    if (!Directory("logs").existsSync()) {
      Directory("logs").create();
    }

    try {
      log = new File("./logs/${fileFormat.format(DateTime.now())}.log");
    } catch (e) {
      stdout.writeln("Log-file not found! Create...");
      log.createSync();
    }

    stdout.writeln("Found log-file!");

  }

  void sendLog(LogOperationType type, String message, DateTime date, [int chat_id = 0, int error_code = -1]) {
    switch(type) {
      case LogOperationType.ERROR:
        log.writeAsStringSync('[ERROR] CODE: ${error_code} At: ${publicFormat.format(date)} \n', mode: FileMode.append, encoding: utf8);
        break;
      case LogOperationType.WARN:
        log.writeAsStringSync('[WARN] Message: ${message} At: ${publicFormat.format(date)} \n', mode: FileMode.append, encoding: utf8);
        break;
      case LogOperationType.INFO:
        log.writeAsStringSync('[INFO] User: $chat_id, Action: $message At: ${publicFormat.format(date)} \n', mode: FileMode.append, encoding: utf8);
        break;
    }
    stdout.writeln("Add new line!");
  }
}