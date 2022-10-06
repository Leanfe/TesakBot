import 'dart:io';

import '../util/logManager.dart';
import '../utils.dart';

class BaseCommands {

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

  final teledart;
  final logManager;

  BaseCommands(this.teledart, this.logManager);

  void loadCommands() {

    teledart.onCommand('start').listen((message) => {
      logManager.sendLog(LogOperationType.INFO, "Used /start command.", DateTime.now(), message.chat.id),
      message.reply(messages[0])
    });

    teledart.onCommand('help').listen((event) => {
      event.reply(messages[1])
    });

    teledart.onCommand('quote').listen((event) async => {
      logManager.sendLog(LogOperationType.INFO, "Used /quote command.", DateTime.now(), event.chat.id),
      event.reply("Совет 🗳: " + await Utils.parseQuote())
    });

    teledart.onCommand('about').listen((event) => {
      logManager.sendLog(LogOperationType.INFO, "Used /about command.", DateTime.now(), event.chat.id),
      event.reply(messages[2])
    });

    teledart.onCommand('github').listen((event) => {
      logManager.sendLog(LogOperationType.INFO, "Used /github command.", DateTime.now(), event.chat.id),
      event.reply(messages[3])
    });

    teledart.onCommand('book').listen((event) => {
      logManager.sendLog(LogOperationType.INFO, "Used /book command.", DateTime.now(), event.chat.id),
      event.reply(messages[4]),
      event.replyDocument(new File("./files/Restrukt.fb2"))
    });

    teledart.onCommand('contact').listen((event) => {
      logManager.sendLog(LogOperationType.INFO, "Used /contact command.", DateTime.now(), event.chat.id),
      event.reply(messages[5])
    });

  }
}