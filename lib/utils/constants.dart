import 'package:flutter/material.dart';
import 'package:get/get.dart';

var screenHeight = Get.height;
var screenWidth = Get.width;
var height10 = screenHeight / 72.24;
var width10 = screenWidth / 50.160;
var black = Colors.black87;
var red = Color.fromARGB(255, 209, 0, 0);
var white = Colors.white;
var blue = const Color.fromARGB(255, 21, 0, 255);
var empty = "can not be empty";
var blackBoldTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: height10 * 2.6,
  color: black,
);
var blackButtonStyle = ButtonStyle(backgroundColor: MaterialStateProperty.all(black), textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20)));
var whiteTextStyle = TextStyle(
  fontSize: height10 * 2,
  color: white,
);
var redButtonstyly = TextStyle(fontSize: height10, color: red);
