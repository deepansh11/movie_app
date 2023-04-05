// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:movie_app/Models/fake_movie.dart';
import 'package:movie_app/UI/Views/Widgets/movie_item.dart';

import 'package:movie_app/repo/movie.dart';
import 'package:network_image_mock/network_image_mock.dart';

Widget makeTestableWidget() => ProviderScope(
      overrides: [movieServiceProvider.overrideWithValue(FakeMovies())],
      child: MaterialApp(
        home: Scaffold(
          body: Consumer(
            builder: (context, ref, child) {
              final movies = ref.watch(popularFutureProvider);
              if (movies.asData == null) {
                return const CircularProgressIndicator();
              }
              return ListView(
                children: [
                  for (final movie in movies.asData!.value)
                    MovieListItem(
                      name: movie.title.toString(),
                      imageUrl: movie.poster_path.toString(),
                      desc: movie.releaseDate.toString(),
                    )
                ],
              );
            },
          ),
        ),
      ),
    );

void main() {
  testWidgets(
    'Finding a single movie item',
    (WidgetTester tester) async {
      // Build our app and trigger a frame.
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          makeTestableWidget(),
        );

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        await tester.pump();
        expect(find.byType(CircularProgressIndicator), findsNothing);

        expect(
          tester.widgetList(
            find.byType(MovieListItem),
          ),
          [
            isA<MovieListItem>()
                .having((s) => s.name, 'movie.title', 'Test Movie')
                .having(
                  (s) => s.imageUrl,
                  'movie.poster_path',
                  'https://images.unsplash.com/photo-1679678691256-fa3ce50c2159?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1253&q=80',
                )
                .having((s) => s.desc, 'movie.releaseDate', '1970-1-1'),
          ],
        );
      });
    },
  );
}
