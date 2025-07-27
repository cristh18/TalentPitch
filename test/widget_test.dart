import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talent_pitch/data/repositories/talents_repository.dart';
import 'package:talent_pitch/di/service_locator.dart';
import 'package:talent_pitch/domain/models/talent_categories_model.dart';
import 'package:talent_pitch/main.dart';
import 'package:talent_pitch/presentation/home/cubit/home_cubit.dart';
import 'package:talent_pitch/presentation/home/ui/home_page.dart';
import 'mocks.mocks.dart';

void main() {
  late MockTalentsRepository mockTalentsRepository;

  setUp(() {
    mockTalentsRepository = MockTalentsRepository();
    locator.registerLazySingleton<TalentsRepository>(() => mockTalentsRepository);
  });

  tearDown(() {
    locator.reset();
  });

  testWidgets('HomePage displays talent categories', (WidgetTester tester) async {
    when(mockTalentsRepository.getTalentCategories()).thenAnswer((_) async => [
      TalentCategoriesModel(title: 'Category 1', key: 'key', url: 'url', type: 'Type 1', image: ''),
    ]);

    await tester.pumpWidget(const MyApp());

    await tester.pump();

    expect(find.text('Explore'), findsOneWidget);
    expect(find.text('Category 1'), findsOneWidget);
  });
}
