import 'package:flutter/material.dart';

double deviceHeight(BuildContext context) =>
    MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

const primaryColor = Color.fromRGBO(30, 30, 30, 1);
