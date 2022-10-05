import 'dart:io';

import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';

import 'logManager.dart';
import 'utils.dart';

const BOT_TOKEN = '';

final List<String> messages = [
  "Здравствуйте мои маленькие любители экстремизма! \nВведите /help, что бы получить список доступных команд.",
  "Список доступных команд ⚡: \n"
      "/video 🎁\n"
      "/book  🎉\n"
      "/quote ✌\n"
      "/about 🧨\n"
      "/github 😊\n"
      "/contact 📻\n",
  "Небольшой бот в память о Максиме Марцинкевиче Тесаке, который был убит российскими властями, перед этим репрессирован как политический деятель. 😢\n"
      "Power by Dart. 👀",
  "Мой GitHub 😎: https://leanfe.github.io/",
  "Книга Максима Марцинкевича 'Реструкт'. (Перед тем как запрашивать ещё-раз, подождите несколько секунд.)",
  "Приветствую, если у вас есть какие-либо вопросы, либо вы хотите пообщаться - прошу ко мне в лс. \n"
      "(telegram 🐱‍) @Leafe_t\n"
      "(vk 😜) https://vk.com/leafe_t",
];

void main() async {
  final username = (await Telegram(BOT_TOKEN).getMe()).username;
  final teledart = TeleDart(BOT_TOKEN, Event(username));

  teledart.start();

  LogManager logManager = new LogManager();
  
  logManager.init();
  
  teledart.onCommand('start').listen((message) => {
    logManager.addUserLog(message.chat.id, "Use /start command.", DateTime.now()),
    message.reply(messages[0])
  });

  teledart.onCommand('help').listen((event) => {
    event.reply(messages[1])
  });

  teledart.onCommand('quote').listen((event) async => {
    logManager.addUserLog(event.chat.id, "Use /quote command.", DateTime.now()),
    event.reply("Совет 🗳: " + await Utils.parseQuote())
  });

  teledart.onCommand('about').listen((event) => {
    logManager.addUserLog(event.chat.id, "use /about command.", DateTime.now()),
    event.reply(messages[2])
  });

  teledart.onCommand('github').listen((event) => {
    logManager.addUserLog(event.chat.id, "Use /github command.", DateTime.now()),
    event.reply(messages[3])
  });

  teledart.onCommand('book').listen((event) => {
    logManager.addUserLog(event.chat.id, "Use /book command.", DateTime.now()),
    event.reply(messages[4]),
    event.replyDocument(new File("./files/Restrukt.fb2"))
  });

  teledart.onCommand('contact').listen((event) => {
    logManager.addUserLog(event.chat.id, "Use /contact command.", DateTime.now()),
    event.reply(messages[5])
  });


}