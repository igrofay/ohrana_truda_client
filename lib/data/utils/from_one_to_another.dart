

import 'package:dio/dio.dart';

mixin ToJsonData{
  Map<String,dynamic> toJsonData();
}

mixin ToFormData{
  FormData toFormData();
}

mixin ToRequestParam{
  String toRequestParam();
}