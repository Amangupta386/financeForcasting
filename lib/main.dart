import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'ddo_finance.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(const DdoFinance());
}

