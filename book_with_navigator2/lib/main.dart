import 'package:book_with_navigator2/models/book.dart';
import 'package:book_with_navigator2/views/book_detail_view.dart';
import 'package:book_with_navigator2/views/book_list_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  Book? _selectedBook;

  List<Book> _books = [
    Book('Left Hand of Darkness', 'Ursula K. Le Guin'),
    Book('Too Like the Lightning', 'Ada Palmer'),
    Book('Kindred', 'Octavia E. Butler'),
  ];

  @override
  void initState() {
    _selectedBook = _books[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Navigator(
          pages: [
            MaterialPage(
              key: ValueKey('BookListView'),
              child: BookListView(
                books: _books,
                selectedBook: _selectedBook,
                onBookPressed: (book) => setState(() {
                  _selectedBook = book;
                }),
              ),
            ),
            if (_selectedBook != null)
              MaterialPage(
                key: ValueKey(_selectedBook),
                child: BookDetailView(
                  book: _selectedBook,
                ),
              )
          ],
          onPopPage: (route, result) => route.didPop(result),
        ),
      );
}
