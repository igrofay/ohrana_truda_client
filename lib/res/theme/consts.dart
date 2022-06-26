import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:ohrana_truda/res/widgets/admin.dart';

final kDefauldborderRadius = BorderRadius.circular(8);
const kAppBarHeight = 90.0;
const kDefaultPadding = 16.0;
const kDefaultVerticalPadding = SizedBox(height: kDefaultPadding);
const kDefaultHorizontalPadding = SizedBox(width: kDefaultPadding);

const leftDemoData = [
  'Наименование ОПФ юрлица',
  'Полное наименование организации (для ИП - ФИО)',
  'Краткое наименование организации',
  'ИНН',
  'Основной вид деятельности по ОКВЭД',
  'Телефон'
];
const rightDemoData = [
  'Адрес юридический',
  'Адрес фактический (необязательно)',
  'ФИО и должность руководителя',
  'E-mail официальный',
  'ФИО и должность специалиста по охране труда',
  'Среднесписочная численность работников'
];

final zayavkaDemoData = [
  Zayavka('7866758', '12.23.43', "ООО \'Акбулак\'", PasportState.rejected),
  Zayavka('4365465', '44.23.43', "ООО \'Аватар\'", PasportState.moderate),
  Zayavka('7656765', '32.45.21', "ООО \'Хиросима\'", PasportState.moderate),
  Zayavka('2452355', '32.21.12', "ООО \'Кукундрия\'", PasportState.sucsess),
];

final zolotoDemoData = [
  Zayavka('6756767', '12.98.00', "ООО \'Карашганда\'", PasportState.sucsess),
  Zayavka('3543455', '21.43.55', "ООО \'Арива\'", PasportState.moderate),
  Zayavka('7567645', '43.45.34', "ООО \'Нагасаки\'", PasportState.sucsess),
  Zayavka('2342354', '12.21.22', "ООО \'Кувандык\'", PasportState.moderate),
];

enum PasportState { sucsess, moderate, rejected }

final StateMS = Observable(true);

void changeStateMS(bool state) {
  final con = ActionController(name: "main");
  final info = con.startAction(name: "main.changeStateMS");
  try {
    StateMS.value = state;
  } finally {
    con.endAction(info);
  }
}
