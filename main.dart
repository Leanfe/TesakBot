import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';

import 'commands/baseCommands.dart';
import 'util/logManager.dart';

const BOT_TOKEN = '5776772483:AAH6eX-BzoWu_lQHw3L0VK_rV2LL9_2QNMY';

void main() async {
  final username = (await Telegram(BOT_TOKEN).getMe()).username;
  final teledart = TeleDart(BOT_TOKEN, Event(username));

  final logManager = new LogManager();

  logManager.init();
  teledart.start();

  new BaseCommands(teledart, logManager).loadCommands();

}