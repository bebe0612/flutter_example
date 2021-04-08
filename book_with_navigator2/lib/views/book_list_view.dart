import 'package:book_with_navigator2/models/book.dart';
import 'package:flutter/material.dart';

class BookListView extends StatelessWidget {
  const BookListView({
    Key? key,
    @required this.books,
    @required this.selectedBook,
    @required this.onBookPressed,
  }) : super(key: key);

  final List<Book>? books;
  final Book? selectedBook;
  final Function(Book book)? onBookPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("books"),
      ),
      body: Column(
        children: [
          for (var book in books!)
            ListTile(
              title: Text(book.title),
              subtitle: Text(book.author),
              onTap: () => onBookPressed!(book),
            )
        ],
      ),
    );
  }
}
