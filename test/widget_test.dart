import 'package:flutter_test/flutter_test.dart';
import 'package:contadordepasos/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Construye la aplicación
    await tester.pumpWidget(const StepTrackerApp());
    await tester.pumpAndSettle(); // Espera a que se renderice todo

    // Verifica que el contador inicia en 0
    expect(find.text('Pasos: 0'), findsOneWidget);
    expect(find.text('Pasos: 100'), findsNothing);

    // Simula un clic en el botón de +100 pasos
    await tester.tap(find.text('+100 Pasos'));
    await tester.pump();

    // Verifica que el contador ahora muestra 100
    expect(find.text('Pasos: 100'), findsOneWidget);
  });
}
