import 'package:flutter/material.dart';
/*
1.application main color
2.application main text color
3.application main icon color
4.application main text field color
*/

  //application main color
  const Color primaryColor = Color(0xFFFFFFFF);
  const Color secondaryColor = Color(0xFF060053);

  //application main text color
  const Color primaryTextColor = Color(0xFFFFFFFF);
  const Color secondaryTextColor = Color(0xFFADADAD);

  //application main background color
  const Color backgroundColor = Color(0xFF000000);

  //application main icon color
  const Color primaryIconColor = Color(0xFFFFFFFF);
  const Color secondaryIconColor = Color(0xFFADADAD);

  //textfield color
  const Color textFieldBBackgroundColor = Color(0XFF2C2C2E);
  const Color textFieldHintColor = Color(0XFF787878);

  //gradient color
  const gradient = LinearGradient(
    colors: [
      Color(0xFF660B90),
      Color(0xFF1C80C8),
    ],
    stops: [0.0, 1.0],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  
const gradient1 = LinearGradient(
  colors: [
    Color(0xFFE27625),
    Color(0xFF233447),
    Color(0xFF161616),
  ],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const gradient2 = LinearGradient(
  colors: [
    Color.fromARGB(255, 50, 53, 128),
    Color(0xFF233447),
    Color(0xFF161616),
  ],
  begin: Alignment.bottomLeft,
  end: Alignment.centerRight,
);

const gradient3 = LinearGradient(
  colors: [
    Color(0xFF233447),
    Color(0xFF161616),
  ],
  begin: Alignment.bottomLeft,
  end: Alignment.centerRight,
);