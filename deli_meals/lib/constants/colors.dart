import 'package:flutter/cupertino.dart';

LinearGradient kLinearGradient(color) => LinearGradient(
      colors: [color.withOpacity(0.7), color],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
