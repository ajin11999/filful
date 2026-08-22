import 'dart:ffi';
import 'dart:io';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:filful/src/app.dart';
import 'package:filful/src/core/database/app_database.dart';
import 'package:sqlite3/open.dart';

void main() {
  setUpAll(() async {
    if (Platform.isLinux) {
      open.overrideFor(OperatingSystem.linux, () {
        try {
          return DynamicLibrary.open('libsqlite3.so.0');
        } catch (_) {
          return DynamicLibrary.open('/usr/lib/x86_64-linux-gnu/libsqlite3.so.0');
        }
      });
    }
    await initializeDateFormatting('id_ID', null);
  });

  testWidgets('FilfulApp smoke test', (WidgetTester tester) async {
    final inMemoryDb = AppDatabase(NativeDatabase.memory());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          databaseProvider.overrideWithValue(inMemoryDb),
        ],
        child: const FilfulApp(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Daftar Purchase Order (PO)'), findsOneWidget);
    expect(find.text('Belum Ada Purchase Order'), findsOneWidget);

    await inMemoryDb.close();
  });
}
