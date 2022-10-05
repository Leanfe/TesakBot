import 'dart:convert';
import 'dart:io';

import 'package:intl/intl.dart';

class LogManager {
  DateFormat publicFormat = DateFormat("yyyy-MM-dd HH:mm");

  File log;

  void init() {
    DateFormat fileFormat = DateFormat("yyyy-MM-dd");

    log = new File("./logs/${fileFormat.format(DateTime.now())}-log.txt");

    if (log.existsSync()) {
      stdout.writeln("Found log-file!");
      return;
    }

    log.createSync();
    stdout.writeln("Log-file not found! Create...");
  }

  void addUserLog(int chat_id, String message, DateTime date) {

    log.writeAsStringSync('User: $chat_id, Action: $message At: ${publicFormat.format(date)} \n', mode: FileMode.append, encoding: utf8);
    stdout.writeln("Add new line!");
  }

}