// Not: Bu bir sözdizimi şablonudur, çalıştırılabilir Dart kodu değildir.


// Switch deyimi:
switch (something) {
  case somePattern when some || boolean || expression:
    //             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Koruma ifadesi (guard clause).
    body;
}

// Switch ifadesi:
var value = switch (something) {
  somePattern when some || boolean || expression => body,
  //               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Koruma ifadesi (guard clause).
}

// If-case deyimi:
if (something case somePattern when some || boolean || expression) {
  //                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Koruma ifadesi (guard clause).
  body;
}
