String weatherFromInt(dynamic v) {
  if (v == 0) {
    return 'Clear';
  } else if (v == 1 || v == 2 || v == 3) {
    return 'Mainly Clear';
  } else if (v >= 45 && v < 61) {
    return 'Foggy';
  } else if (v >= 61 && v < 95) {
    return 'Rain';
  } else if (v >= 95) {
    return 'ThunderStorm';
  } else {
    return 'Clear';
  }
}

String isOpen(int v) => v < 61 ? "Open" : "Closed";
