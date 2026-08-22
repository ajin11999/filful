import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:filful/src/app.dart';

void main() {
  testWidgets('FilfulApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: FilfulApp(),
      ),
    );

    expect(find.text('Purchase Orders'), findsOneWidget);
    expect(find.text('No Purchase Orders Yet'), findsOneWidget);
  });
}
