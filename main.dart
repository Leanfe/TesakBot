import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';

const BOT_TOKEN = 'NULL';

final List<String> messages = [
  "Здравствуйте мои маленькие любители экстремизма! \nВведите /help, что бы получить список доступных команд.",
  "Список доступных команд ⚡: \n"
      "/video 🎁\n"
      "/book  🎉\n"
      "/quote ✌\n"
      "/about 🧨\n"
      "/github 😊\n"
      "/contact 📻\n",
  "Небольшой бот в память о Максиме Марцинкевиче Тесаке, который был убит российскими властями, перед этим репрессирован как политический деятель. 😢",
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

  teledart.onCommand('start').listen((message) => {
    message.reply(messages[0])
  });

  teledart.onCommand('help').listen((event) => {
    event.reply(messages[1])
  });

  teledart.onCommand('quote').listen((event) async => {
    event.reply("Совет 🗳: " + await parseQuote())
  });

  teledart.onCommand('about').listen((event) => {
    event.reply(messages[2])
  });

  teledart.onCommand('github').listen((event) => {
    event.reply(messages[3])
  });

  teledart.onCommand('book').listen((event) => {
    event.reply(messages[4]),
    event.replyDocument(new File("./files/Restrukt.fb2"))
  });

  teledart.onCommand('contact').listen((event) => {
    event.reply(messages[5])
  });

}

Future<String> parseQuote() async {
  var url = Uri.parse("http://fucking-great-advice.ru/api/random");
  http.Response response = await http.get(url);

  Map<String,dynamic> data = jsonDecode(response.body);
  String verse = data["text"];

  return verse;
}