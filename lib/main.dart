import 'package:brawl_api/brawler/view/root_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screen/home_screen.dart';

void main() {
  runApp(
    ProviderScope(
      child: const MaterialApp(
        home: RootTab(),
      ),
    ),
  );
}
