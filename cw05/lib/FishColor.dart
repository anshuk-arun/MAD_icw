// Color of the Fish
import 'package:flutter/material.dart';

enum FishColor {
    blue("Blue", Colors.blue),
    red("Red", Colors.red),
    green("Green", Colors.green),
    orange("Orange", Colors.orange),
    black("Black", Colors.black);

    const FishColor(this.label, this.color);
    final String label;
    final Color color;
}