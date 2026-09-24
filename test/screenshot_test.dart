import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_concepts_app/main.dart';

class LocalAssetBundle extends CachingAssetBundle {
  @override
  Future<ByteData> load(String key) async {
    final file = File(key);
    if (await file.exists()) {
      final bytes = await file.readAsBytes();
      return ByteData.view(bytes.buffer);
    }
    return rootBundle.load(key);
  }

  @override
  Future<ui.ImmutableBuffer> loadBuffer(String key) async {
    final file = File(key);
    if (await file.exists()) {
      final bytes = await file.readAsBytes();
      return ui.ImmutableBuffer.fromUint8List(bytes);
    }
    return rootBundle.loadBuffer(key);
  }
}

Future<void> loadFonts() async {
  final poppins = FontLoader('Poppins');
  for (final w in ['Regular', 'Medium', 'SemiBold', 'Bold']) {
    final bytes = File('assets/fonts/Poppins-$w.ttf').readAsBytesSync();
    poppins.addFont(Future.value(ByteData.view(bytes.buffer)));
  }
  await poppins.load();

  final icons = FontLoader('MaterialIcons');
  final iconBytes = File('assets/fonts/MaterialIcons-Regular.otf').readAsBytesSync();
  icons.addFont(Future.value(ByteData.view(iconBytes.buffer)));
  await icons.load();
}

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await loadFonts();
  });

  testWidgets('Capture screenshots of all screens', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1170, 2532); // iPhone standard resolution
    tester.view.devicePixelRatio = 3.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final appWidget = DefaultAssetBundle(
      bundle: LocalAssetBundle(),
      child: const FlutterConceptsApp(),
    );

    // 1. HomeScreen
    await tester.pumpWidget(appWidget);
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(FlutterConceptsApp),
      matchesGoldenFile('../screenshots/home_screen.png'),
    );

    // 2. FormScreen
    await tester.tap(find.text('User Input & Forms'));
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(FlutterConceptsApp),
      matchesGoldenFile('../screenshots/form_screen.png'),
    );

    // Go back
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();

    // 3. ImageGridScreen
    await tester.tap(find.text('Images, Assets & Fonts'));
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(FlutterConceptsApp),
      matchesGoldenFile('../screenshots/image_grid_screen.png'),
    );

    // Go back
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();

    // 4. AnimationScreen
    await tester.ensureVisible(find.text('Interactive Animations'));
    await tester.tap(find.text('Interactive Animations'));
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(FlutterConceptsApp),
      matchesGoldenFile('../screenshots/animation_screen.png'),
    );
  });
}
