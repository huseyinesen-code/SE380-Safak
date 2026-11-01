// A simple book model. It only needs a title for now.
class Book {
  final String title;

  const Book(this.title);
}

// Made-up books to fill the UI until there is real data.
const List<Book> fakeBooks = [
  Book('The Last Lighthouse'),
  Book('Paper Moons'),
  Book('A Quiet Kind of Storm'),
  Book('The Mapmaker\'s Daughter'),
  Book('Salt and Static'),
  Book('Midnight at the Archive'),
  Book('Small Gods of Summer'),
  Book('The Glass Orchard'),
];
