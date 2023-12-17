
import 'package:flutter/cupertino.dart';

@immutable
abstract class CounterEvents {}

class Increment extends CounterEvents{}

class Decrement extends CounterEvents{}