import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

String? validaCPF(String cpf) {
  // quero uma funcao pra validar cpf
  // Remove any non-digit characters from the input
  cpf = cpf.replaceAll(RegExp(r'\D'), '');

  // Check if the CPF has 11 digits
  if (cpf.length != 11) {
    return 'CPF must have 11 digits';
  }

  // Check if all digits are the same
  if (RegExp(r'^(\d)\1*$').hasMatch(cpf)) {
    return 'CPF cannot have all digits equal';
  }

  // Calculate the first verification digit
  int sum = 0;
  for (int i = 0; i < 9; i++) {
    sum += int.parse(cpf[i]) * (10 - i);
  }
  int digit1 = (sum * 10) % 11;

  // Calculate the second verification digit
  sum = 0;
  for (int i = 0; i < 10; i++) {
    sum += int.parse(cpf[i]) * (11 - i);
  }
  int digit2 = (sum * 10) % 11;

  // Check if the verification digits match
  if (digit1 != int.parse(cpf[9]) || digit2 != int.parse(cpf[10])) {
    return 'Invalid CPF';
  }

  return null; // CPF is valid
}
