/* =========================================================
   LIBRARY DATABASE - SAMPLE DATA
   Oracle SQL
   ========================================================= */


/* =========================================================
   1. MEMBERS
   ========================================================= */

INSERT INTO Members
(first_name, last_name, email, phone, join_date, membership_status)
VALUES ('Ryan', 'Young', 'ryan.young@example.com', '512-555-1001',
        DATE '2026-01-15', 'ACTIVE');

INSERT INTO Members
(first_name, last_name, email, phone, join_date, membership_status)
VALUES ('Sarah', 'Miller', 'sarah.miller@example.com', '512-555-1002',
        DATE '2026-02-10', 'ACTIVE');

INSERT INTO Members
(first_name, last_name, email, phone, join_date, membership_status)
VALUES ('James', 'Wilson', 'james.wilson@example.com', '512-555-1003',
        DATE '2025-11-20', 'SUSPENDED');

INSERT INTO Members
(first_name, last_name, email, phone, join_date, membership_status)
VALUES ('Emily', 'Davis', 'emily.davis@example.com', '512-555-1004',
        DATE '2026-03-05', 'ACTIVE');

INSERT INTO Members
(first_name, last_name, email, phone, join_date, membership_status)
VALUES ('Michael', 'Brown', 'michael.brown@example.com', '512-555-1005',
        DATE '2025-08-18', 'INACTIVE');

INSERT INTO Members
(first_name, last_name, email, phone, join_date, membership_status)
VALUES ('Amanda', 'Clark', 'amanda.clark@example.com', '512-555-1006',
        DATE '2026-04-11', 'ACTIVE');

INSERT INTO Members
(first_name, last_name, email, phone, join_date, membership_status)
VALUES ('Daniel', 'Martinez', 'daniel.martinez@example.com', '512-555-1007',
        DATE '2026-05-17', 'ACTIVE');

INSERT INTO Members
(first_name, last_name, email, phone, join_date, membership_status)
VALUES ('Jennifer', 'Taylor', 'jennifer.taylor@example.com', '512-555-1008',
        DATE '2026-06-03', 'ACTIVE');

INSERT INTO Members
(first_name, last_name, email, phone, join_date, membership_status)
VALUES ('Christopher', 'Anderson', 'chris.anderson@example.com', '512-555-1009',
        DATE '2025-12-22', 'ACTIVE');

INSERT INTO Members
(first_name, last_name, email, phone, join_date, membership_status)
VALUES ('Laura', 'Thomas', 'laura.thomas@example.com', '512-555-1010',
        DATE '2026-07-01', 'ACTIVE');


/* =========================================================
   2. AUTHORS
   ========================================================= */

INSERT INTO Authors
(first_name, last_name, birth_year, country)
VALUES ('Frank', 'Herbert', 1920, 'United States');

INSERT INTO Authors
(first_name, last_name, birth_year, country)
VALUES ('George', 'Orwell', 1903, 'United Kingdom');

INSERT INTO Authors
(first_name, last_name, birth_year, country)
VALUES ('J.R.R.', 'Tolkien', 1892, 'United Kingdom');

INSERT INTO Authors
(first_name, last_name, birth_year, country)
VALUES ('Isaac', 'Asimov', 1920, 'United States');

INSERT INTO Authors
(first_name, last_name, birth_year, country)
VALUES ('Arthur', 'Clarke', 1917, 'United Kingdom');

INSERT INTO Authors
(first_name, last_name, birth_year, country)
VALUES ('Stephen', 'King', 1947, 'United States');

INSERT INTO Authors
(first_name, last_name, birth_year, country)
VALUES ('Agatha', 'Christie', 1890, 'United Kingdom');

INSERT INTO Authors
(first_name, last_name, birth_year, country)
VALUES ('Ernest', 'Hemingway', 1899, 'United States');

INSERT INTO Authors
(first_name, last_name, birth_year, country)
VALUES ('Mary', 'Shelley', 1797, 'United Kingdom');

INSERT INTO Authors
(first_name, last_name, birth_year, country)
VALUES ('Ray', 'Bradbury', 1920, 'United States');

INSERT INTO Authors
(first_name, last_name, birth_year, country)
VALUES ('Aldous', 'Huxley', 1894, 'United Kingdom');

INSERT INTO Authors
(first_name, last_name, birth_year, country)
VALUES ('Cormac', 'McCarthy', 1933, 'United States');


/* =========================================================
   3. PUBLISHERS
   ========================================================= */

INSERT INTO Publishers
(publisher_name, city, country)
VALUES ('Penguin Random House', 'New York', 'United States');

INSERT INTO Publishers
(publisher_name, city, country)
VALUES ('HarperCollins', 'New York', 'United States');

INSERT INTO Publishers
(publisher_name, city, country)
VALUES ('Simon & Schuster', 'New York', 'United States');

INSERT INTO Publishers
(publisher_name, city, country)
VALUES ('Macmillan', 'London', 'United Kingdom');

INSERT INTO Publishers
(publisher_name, city, country)
VALUES ('Hachette Book Group', 'New York', 'United States');

INSERT INTO Publishers
(publisher_name, city, country)
VALUES ('Oxford University Press', 'Oxford', 'United Kingdom');


/* =========================================================
   4. GENRES
   ========================================================= */

INSERT INTO Genres (genre_name)
VALUES ('Science Fiction');

INSERT INTO Genres (genre_name)
VALUES ('Fantasy');

INSERT INTO Genres (genre_name)
VALUES ('Dystopian');

INSERT INTO Genres (genre_name)
VALUES ('History');

INSERT INTO Genres (genre_name)
VALUES ('Rock');

INSERT INTO Genres (genre_name)
VALUES ('Mystery');

INSERT INTO Genres (genre_name)
VALUES ('Horror');

INSERT INTO Genres (genre_name)
VALUES ('Classic');

INSERT INTO Genres (genre_name)
VALUES ('Jazz');

INSERT INTO Genres (genre_name)
VALUES ('Pop');

INSERT INTO Genres (genre_name)
VALUES ('Biography');

INSERT INTO Genres (genre_name)
VALUES ('Literary Fiction');


/* =========================================================
   5. BOOKS
   ========================================================= */

INSERT INTO Books
(title, isbn, publication_year, publisher_id, genre_id)
VALUES (
    'Dune',
    '9780441172719',
    1965,
    (SELECT publisher_id FROM Publishers
     WHERE publisher_name = 'Penguin Random House'),
    (SELECT genre_id FROM Genres
     WHERE genre_name = 'Science Fiction')
);

INSERT INTO Books
(title, isbn, publication_year, publisher_id, genre_id)
VALUES (
    '1984',
    '9780451524935',
    1949,
    (SELECT publisher_id FROM Publishers
     WHERE publisher_name = 'Penguin Random House'),
    (SELECT genre_id FROM Genres
     WHERE genre_name = 'Dystopian')
);

INSERT INTO Books
(title, isbn, publication_year, publisher_id, genre_id)
VALUES (
    'The Hobbit',
    '9780547928227',
    1937,
    (SELECT publisher_id FROM Publishers
     WHERE publisher_name = 'HarperCollins'),
    (SELECT genre_id FROM Genres
     WHERE genre_name = 'Fantasy')
);

INSERT INTO Books
(title, isbn, publication_year, publisher_id, genre_id)
VALUES (
    'Foundation',
    '9780553293357',
    1951,
    (SELECT publisher_id FROM Publishers
     WHERE publisher_name = 'Simon & Schuster'),
    (SELECT genre_id FROM Genres
     WHERE genre_name = 'Science Fiction')
);

INSERT INTO Books
(title, isbn, publication_year, publisher_id, genre_id)
VALUES (
    '2001: A Space Odyssey',
    '9780451457998',
    1968,
    (SELECT publisher_id FROM Publishers
     WHERE publisher_name = 'Macmillan'),
    (SELECT genre_id FROM Genres
     WHERE genre_name = 'Science Fiction')
);

INSERT INTO Books
(title, isbn, publication_year, publisher_id, genre_id)
VALUES (
    'The Shining',
    '9780307743657',
    1977,
    (SELECT publisher_id FROM Publishers
     WHERE publisher_name = 'Penguin Random House'),
    (SELECT genre_id FROM Genres
     WHERE genre_name = 'Horror')
);

INSERT INTO Books
(title, isbn, publication_year, publisher_id, genre_id)
VALUES (
    'Murder on the Orient Express',
    '9780062693662',
    1934,
    (SELECT publisher_id FROM Publishers
     WHERE publisher_name = 'HarperCollins'),
    (SELECT genre_id FROM Genres
     WHERE genre_name = 'Mystery')
);

INSERT INTO Books
(title, isbn, publication_year, publisher_id, genre_id)
VALUES (
    'The Old Man and the Sea',
    '9780684801223',
    1952,
    (SELECT publisher_id FROM Publishers
     WHERE publisher_name = 'Simon & Schuster'),
    (SELECT genre_id FROM Genres
     WHERE genre_name = 'Classic')
);

INSERT INTO Books
(title, isbn, publication_year, publisher_id, genre_id)
VALUES (
    'Frankenstein',
    '9780141439471',
    1818,
    (SELECT publisher_id FROM Publishers
     WHERE publisher_name = 'Penguin Random House'),
    (SELECT genre_id FROM Genres
     WHERE genre_name = 'Classic')
);

INSERT INTO Books
(title, isbn, publication_year, publisher_id, genre_id)
VALUES (
    'Fahrenheit 451',
    '9781451673319',
    1953,
    (SELECT publisher_id FROM Publishers
     WHERE publisher_name = 'Simon & Schuster'),
    (SELECT genre_id FROM Genres
     WHERE genre_name = 'Dystopian')
);

INSERT INTO Books
(title, isbn, publication_year, publisher_id, genre_id)
VALUES (
    'Brave New World',
    '9780060850524',
    1932,
    (SELECT publisher_id FROM Publishers
     WHERE publisher_name = 'HarperCollins'),
    (SELECT genre_id FROM Genres
     WHERE genre_name = 'Dystopian')
);

INSERT INTO Books
(title, isbn, publication_year, publisher_id, genre_id)
VALUES (
    'The Road',
    '9780307387899',
    2006,
    (SELECT publisher_id FROM Publishers
     WHERE publisher_name = 'Penguin Random House'),
    (SELECT genre_id FROM Genres
     WHERE genre_name = 'Literary Fiction')
);

INSERT INTO Books
(title, isbn, publication_year, publisher_id, genre_id)
VALUES (
    'The Fellowship of the Ring',
    '9780547928210',
    1954,
    (SELECT publisher_id FROM Publishers
     WHERE publisher_name = 'HarperCollins'),
    (SELECT genre_id FROM Genres
     WHERE genre_name = 'Fantasy')
);

INSERT INTO Books
(title, isbn, publication_year, publisher_id, genre_id)
VALUES (
    'The Two Towers',
    '9780547928203',
    1954,
    (SELECT publisher_id FROM Publishers
     WHERE publisher_name = 'HarperCollins'),
    (SELECT genre_id FROM Genres
     WHERE genre_name = 'Fantasy')
);

INSERT INTO Books
(title, isbn, publication_year, publisher_id, genre_id)
VALUES (
    'The Return of the King',
    '9780547928197',
    1955,
    (SELECT publisher_id FROM Publishers
     WHERE publisher_name = 'HarperCollins'),
    (SELECT genre_id FROM Genres
     WHERE genre_name = 'Fantasy')
);

INSERT INTO Books
(title, isbn, publication_year, publisher_id, genre_id)
VALUES (
    'I, Robot',
    '9780553382563',
    1950,
    (SELECT publisher_id FROM Publishers
     WHERE publisher_name = 'Penguin Random House'),
    (SELECT genre_id FROM Genres
     WHERE genre_name = 'Science Fiction')
);

INSERT INTO Books
(title, isbn, publication_year, publisher_id, genre_id)
VALUES (
    'Childhood''s End',
    '9780345444059',
    1953,
    (SELECT publisher_id FROM Publishers
     WHERE publisher_name = 'Penguin Random House'),
    (SELECT genre_id FROM Genres
     WHERE genre_name = 'Science Fiction')
);

INSERT INTO Books
(title, isbn, publication_year, publisher_id, genre_id)
VALUES (
    'And Then There Were None',
    '9780062073488',
    1939,
    (SELECT publisher_id FROM Publishers
     WHERE publisher_name = 'HarperCollins'),
    (SELECT genre_id FROM Genres
     WHERE genre_name = 'Mystery')
);

INSERT INTO Books
(title, isbn, publication_year, publisher_id, genre_id)
VALUES (
    'The Stand',
    '9780307947307',
    1978,
    (SELECT publisher_id FROM Publishers
     WHERE publisher_name = 'Penguin Random House'),
    (SELECT genre_id FROM Genres
     WHERE genre_name = 'Horror')
);

INSERT INTO Books
(title, isbn, publication_year, publisher_id, genre_id)
VALUES (
    'A Farewell to Arms',
    '9780684801469',
    1929,
    (SELECT publisher_id FROM Publishers
     WHERE publisher_name = 'Simon & Schuster'),
    (SELECT genre_id FROM Genres
     WHERE genre_name = 'Classic')
);


/* =========================================================
   6. BOOK AUTHORS
   ========================================================= */

INSERT INTO BookAuthors
VALUES (
    (SELECT book_id FROM Books WHERE title = 'Dune'),
    (SELECT author_id FROM Authors
     WHERE first_name = 'Frank' AND last_name = 'Herbert')
);

INSERT INTO BookAuthors
VALUES (
    (SELECT book_id FROM Books WHERE title = '1984'),
    (SELECT author_id FROM Authors
     WHERE first_name = 'George' AND last_name = 'Orwell')
);

INSERT INTO BookAuthors
VALUES (
    (SELECT book_id FROM Books WHERE title = 'The Hobbit'),
    (SELECT author_id FROM Authors
     WHERE last_name = 'Tolkien')
);

INSERT INTO BookAuthors
VALUES (
    (SELECT book_id FROM Books WHERE title = 'Foundation'),
    (SELECT author_id FROM Authors
     WHERE last_name = 'Asimov')
);

INSERT INTO BookAuthors
VALUES (
    (SELECT book_id FROM Books WHERE title = '2001: A Space Odyssey'),
    (SELECT author_id FROM Authors
     WHERE last_name = 'Clarke')
);

INSERT INTO BookAuthors
VALUES (
    (SELECT book_id FROM Books WHERE title = 'The Shining'),
    (SELECT author_id FROM Authors
     WHERE last_name = 'King')
);

INSERT INTO BookAuthors
VALUES (
    (SELECT book_id FROM Books WHERE title = 'Murder on the Orient Express'),
    (SELECT author_id FROM Authors
     WHERE last_name = 'Christie')
);

INSERT INTO BookAuthors
VALUES (
    (SELECT book_id FROM Books WHERE title = 'The Old Man and the Sea'),
    (SELECT author_id FROM Authors
     WHERE last_name = 'Hemingway')
);

INSERT INTO BookAuthors
VALUES (
    (SELECT book_id FROM Books WHERE title = 'Frankenstein'),
    (SELECT author_id FROM Authors
     WHERE last_name = 'Shelley')
);

INSERT INTO BookAuthors
VALUES (
    (SELECT book_id FROM Books WHERE title = 'Fahrenheit 451'),
    (SELECT author_id FROM Authors
     WHERE last_name = 'Bradbury')
);

INSERT INTO BookAuthors
VALUES (
    (SELECT book_id FROM Books WHERE title = 'Brave New World'),
    (SELECT author_id FROM Authors
     WHERE last_name = 'Huxley')
);

INSERT INTO BookAuthors
VALUES (
    (SELECT book_id FROM Books WHERE title = 'The Road'),
    (SELECT author_id FROM Authors
     WHERE last_name = 'McCarthy')
);

INSERT INTO BookAuthors
VALUES (
    (SELECT book_id FROM Books WHERE title = 'The Fellowship of the Ring'),
    (SELECT author_id FROM Authors
     WHERE last_name = 'Tolkien')
);

INSERT INTO BookAuthors
VALUES (
    (SELECT book_id FROM Books WHERE title = 'The Two Towers'),
    (SELECT author_id FROM Authors
     WHERE last_name = 'Tolkien')
);

INSERT INTO BookAuthors
VALUES (
    (SELECT book_id FROM Books WHERE title = 'The Return of the King'),
    (SELECT author_id FROM Authors
     WHERE last_name = 'Tolkien')
);

INSERT INTO BookAuthors
VALUES (
    (SELECT book_id FROM Books WHERE title = 'I, Robot'),
    (SELECT author_id FROM Authors
     WHERE last_name = 'Asimov')
);

INSERT INTO BookAuthors
VALUES (
    (SELECT book_id FROM Books WHERE title = 'Childhood''s End'),
    (SELECT author_id FROM Authors
     WHERE last_name = 'Clarke')
);

INSERT INTO BookAuthors
VALUES (
    (SELECT book_id FROM Books WHERE title = 'And Then There Were None'),
    (SELECT author_id FROM Authors
     WHERE last_name = 'Christie')
);

INSERT INTO BookAuthors
VALUES (
    (SELECT book_id FROM Books WHERE title = 'The Stand'),
    (SELECT author_id FROM Authors
     WHERE last_name = 'King')
);

INSERT INTO BookAuthors
VALUES (
    (SELECT book_id FROM Books WHERE title = 'A Farewell to Arms'),
    (SELECT author_id FROM Authors
     WHERE last_name = 'Hemingway')
);


/* =========================================================
   7. AUDIOBOOKS
   ========================================================= */

INSERT INTO Audiobooks
(title, publication_year, publisher_id, genre_id,
 duration_minutes, narrator)
VALUES (
    'Dune Audiobook',
    2007,
    (SELECT publisher_id FROM Publishers
     WHERE publisher_name = 'Penguin Random House'),
    (SELECT genre_id FROM Genres
     WHERE genre_name = 'Science Fiction'),
    1260,
    'Simon Vance'
);

INSERT INTO Audiobooks
(title, publication_year, publisher_id, genre_id,
 duration_minutes, narrator)
VALUES (
    '1984 Audiobook',
    2022,
    (SELECT publisher_id FROM Publishers
     WHERE publisher_name = 'Penguin Random House'),
    (SELECT genre_id FROM Genres
     WHERE genre_name = 'Dystopian'),
    680,
    'Andrew Wincott'
);

INSERT INTO Audiobooks
(title, publication_year, publisher_id, genre_id,
 duration_minutes, narrator)
VALUES (
    'The Hobbit Audiobook',
    2020,
    (SELECT publisher_id FROM Publishers
     WHERE publisher_name = 'HarperCollins'),
    (SELECT genre_id FROM Genres
     WHERE genre_name = 'Fantasy'),
    670,
    'Andy Serkis'
);

INSERT INTO Audiobooks
(title, publication_year, publisher_id, genre_id,
 duration_minutes, narrator)
VALUES (
    'The Fellowship of the Ring Audiobook',
    2021,
    (SELECT publisher_id FROM Publishers
     WHERE publisher_name = 'HarperCollins'),
    (SELECT genre_id FROM Genres
     WHERE genre_name = 'Fantasy'),
    1360,
    'Andy Serkis'
);

INSERT INTO Audiobooks
(title, publication_year, publisher_id, genre_id,
 duration_minutes, narrator)
VALUES (
    'The Shining Audiobook',
    2012,
    (SELECT publisher_id FROM Publishers
     WHERE publisher_name = 'Penguin Random House'),
    (SELECT genre_id FROM Genres
     WHERE genre_name = 'Horror'),
    960,
    'Campbell Scott'
);

INSERT INTO Audiobooks
(title, publication_year, publisher_id, genre_id,
 duration_minutes, narrator)
VALUES (
    'Fahrenheit 451 Audiobook',
    2014,
    (SELECT publisher_id FROM Publishers
     WHERE publisher_name = 'Simon & Schuster'),
    (SELECT genre_id FROM Genres
     WHERE genre_name = 'Dystopian'),
    300,
    'Tim Robbins'
);

INSERT INTO Audiobooks
(title, publication_year, publisher_id, genre_id,
 duration_minutes, narrator)
VALUES (
    'The Road Audiobook',
    2007,
    (SELECT publisher_id FROM Publishers
     WHERE publisher_name = 'Penguin Random House'),
    (SELECT genre_id FROM Genres
     WHERE genre_name = 'Literary Fiction'),
    390,
    'Tom Stechschulte'
);

INSERT INTO Audiobooks
(title, publication_year, publisher_id, genre_id,
 duration_minutes, narrator)
VALUES (
    'And Then There Were None Audiobook',
    2015,
    (SELECT publisher_id FROM Publishers
     WHERE publisher_name = 'HarperCollins'),
    (SELECT genre_id FROM Genres
     WHERE genre_name = 'Mystery'),
    390,
    'Dan Stevens'
);


/* =========================================================
   8. CDS
   ========================================================= */

INSERT INTO CDs
(title, artist, release_year, genre_id)
VALUES (
    'Abbey Road',
    'The Beatles',
    1969,
    (SELECT genre_id FROM Genres WHERE genre_name = 'Rock')
);

INSERT INTO CDs
(title, artist, release_year, genre_id)
VALUES (
    'The Dark Side of the Moon',
    'Pink Floyd',
    1973,
    (SELECT genre_id FROM Genres WHERE genre_name = 'Rock')
);

INSERT INTO CDs
(title, artist, release_year, genre_id)
VALUES (
    'Rumours',
    'Fleetwood Mac',
    1977,
    (SELECT genre_id FROM Genres WHERE genre_name = 'Rock')
);

INSERT INTO CDs
(title, artist, release_year, genre_id)
VALUES (
    'Led Zeppelin IV',
    'Led Zeppelin',
    1971,
    (SELECT genre_id FROM Genres WHERE genre_name = 'Rock')
);

INSERT INTO CDs
(title, artist, release_year, genre_id)
VALUES (
    'Born to Run',
    'Bruce Springsteen',
    1975,
    (SELECT genre_id FROM Genres WHERE genre_name = 'Rock')
);

INSERT INTO CDs
(title, artist, release_year, genre_id)
VALUES (
    'Kind of Blue',
    'Miles Davis',
    1959,
    (SELECT genre_id FROM Genres WHERE genre_name = 'Jazz')
);

INSERT INTO CDs
(title, artist, release_year, genre_id)
VALUES (
    'A Love Supreme',
    'John Coltrane',
    1965,
    (SELECT genre_id FROM Genres WHERE genre_name = 'Jazz')
);

INSERT INTO CDs
(title, artist, release_year, genre_id)
VALUES (
    'Time Out',
    'Dave Brubeck Quartet',
    1959,
    (SELECT genre_id FROM Genres WHERE genre_name = 'Jazz')
);

INSERT INTO CDs
(title, artist, release_year, genre_id)
VALUES (
    'Thriller',
    'Michael Jackson',
    1982,
    (SELECT genre_id FROM Genres WHERE genre_name = 'Pop')
);

INSERT INTO CDs
(title, artist, release_year, genre_id)
VALUES (
    'Purple Rain',
    'Prince',
    1984,
    (SELECT genre_id FROM Genres WHERE genre_name = 'Pop')
);

INSERT INTO CDs
(title, artist, release_year, genre_id)
VALUES (
    'Like a Prayer',
    'Madonna',
    1989,
    (SELECT genre_id FROM Genres WHERE genre_name = 'Pop')
);

INSERT INTO CDs
(title, artist, release_year, genre_id)
VALUES (
    'Nevermind',
    'Nirvana',
    1991,
    (SELECT genre_id FROM Genres WHERE genre_name = 'Rock')
);


/* =========================================================
   9. MAGAZINES
   ========================================================= */

INSERT INTO Magazines
(title, issue_number, publication_date, publisher_id)
VALUES (
    'Science Monthly',
    '2026-10',
    DATE '2026-10-01',
    (SELECT publisher_id FROM Publishers
     WHERE publisher_name = 'Macmillan')
);

INSERT INTO Magazines
(title, issue_number, publication_date, publisher_id)
VALUES (
    'Modern History',
    '2026-09',
    DATE '2026-09-01',
    (SELECT publisher_id FROM Publishers
     WHERE publisher_name = 'HarperCollins')
);

INSERT INTO Magazines
(title, issue_number, publication_date, publisher_id)
VALUES (
    'Technology Review',
    '2026-08',
    DATE '2026-08-01',
    (SELECT publisher_id FROM Publishers
     WHERE publisher_name = 'Simon & Schuster')
);

INSERT INTO Magazines
(title, issue_number, publication_date, publisher_id)
VALUES (
    'World History',
    '2026-10',
    DATE '2026-10-05',
    (SELECT publisher_id FROM Publishers
     WHERE publisher_name = 'Oxford University Press')
);

INSERT INTO Magazines
(title, issue_number, publication_date, publisher_id)
VALUES (
    'Literary Review',
    '2026-10',
    DATE '2026-10-08',
    (SELECT publisher_id FROM Publishers
     WHERE publisher_name = 'Penguin Random House')
);

INSERT INTO Magazines
(title, issue_number, publication_date, publisher_id)
VALUES (
    'Popular Science',
    '2026-11',
    DATE '2026-10-15',
    (SELECT publisher_id FROM Publishers
     WHERE publisher_name = 'Hachette Book Group')
);


/* =========================================================
   10. LIBRARY ITEMS
   These represent copies actually owned by the library.
   ========================================================= */

/* ---------- BOOK COPIES ---------- */

INSERT INTO LibraryItems
(item_type, book_id, status)
VALUES (
    'BOOK',
    (SELECT book_id FROM Books WHERE title = 'Dune'),
    'AVAILABLE'
);

INSERT INTO LibraryItems
(item_type, book_id, status)
VALUES (
    'BOOK',
    (SELECT book_id FROM Books WHERE title = 'Dune'),
    'CHECKED_OUT'
);

INSERT INTO LibraryItems
(item_type, book_id, status)
VALUES (
    'BOOK',
    (SELECT book_id FROM Books WHERE title = '1984'),
    'CHECKED_OUT'
);

INSERT INTO LibraryItems
(item_type, book_id, status)
VALUES (
    'BOOK',
    (SELECT book_id FROM Books WHERE title = 'The Hobbit'),
    'AVAILABLE'
);

INSERT INTO LibraryItems
(item_type, book_id, status)
VALUES (
    'BOOK',
    (SELECT book_id FROM Books WHERE title = 'Foundation'),
    'AVAILABLE'
);

INSERT INTO LibraryItems
(item_type, book_id, status)
VALUES (
    'BOOK',
    (SELECT book_id FROM Books WHERE title = '2001: A Space Odyssey'),
    'AVAILABLE'
);

INSERT INTO LibraryItems
(item_type, book_id, status)
VALUES (
    'BOOK',
    (SELECT book_id FROM Books WHERE title = 'The Shining'),
    'CHECKED_OUT'
);

INSERT INTO LibraryItems
(item_type, book_id, status)
VALUES (
    'BOOK',
    (SELECT book_id FROM Books WHERE title = 'Murder on the Orient Express'),
    'AVAILABLE'
);

INSERT INTO LibraryItems
(item_type, book_id, status)
VALUES (
    'BOOK',
    (SELECT book_id FROM Books WHERE title = 'The Old Man and the Sea'),
    'AVAILABLE'
);

INSERT INTO LibraryItems
(item_type, book_id, status)
VALUES (
    'BOOK',
    (SELECT book_id FROM Books WHERE title = 'Frankenstein'),
    'DAMAGED'
);

INSERT INTO LibraryItems
(item_type, book_id, status)
VALUES (
    'BOOK',
    (SELECT book_id FROM Books WHERE title = 'Fahrenheit 451'),
    'AVAILABLE'
);

INSERT INTO LibraryItems
(item_type, book_id, status)
VALUES (
    'BOOK',
    (SELECT book_id FROM Books WHERE title = 'Brave New World'),
    'CHECKED_OUT'
);

INSERT INTO LibraryItems
(item_type, book_id, status)
VALUES (
    'BOOK',
    (SELECT book_id FROM Books WHERE title = 'The Road'),
    'AVAILABLE'
);

INSERT INTO LibraryItems
(item_type, book_id, status)
VALUES (
    'BOOK',
    (SELECT book_id FROM Books WHERE title = 'The Fellowship of the Ring'),
    'AVAILABLE'
);

INSERT INTO LibraryItems
(item_type, book_id, status)
VALUES (
    'BOOK',
    (SELECT book_id FROM Books WHERE title = 'The Two Towers'),
    'AVAILABLE'
);

INSERT INTO LibraryItems
(item_type, book_id, status)
VALUES (
    'BOOK',
    (SELECT book_id FROM Books WHERE title = 'The Return of the King'),
    'AVAILABLE'
);

INSERT INTO LibraryItems
(item_type, book_id, status)
VALUES (
    'BOOK',
    (SELECT book_id FROM Books WHERE title = 'I, Robot'),
    'CHECKED_OUT'
);

INSERT INTO LibraryItems
(item_type, book_id, status)
VALUES (
    'BOOK',
    (SELECT book_id FROM Books WHERE title = 'Childhood''s End'),
    'AVAILABLE'
);

INSERT INTO LibraryItems
(item_type, book_id, status)
VALUES (
    'BOOK',
    (SELECT book_id FROM Books WHERE title = 'And Then There Were None'),
    'AVAILABLE'
);

INSERT INTO LibraryItems
(item_type, book_id, status)
VALUES (
    'BOOK',
    (SELECT book_id FROM Books WHERE title = 'The Stand'),
    'MAINTENANCE'
);

INSERT INTO LibraryItems
(item_type, book_id, status)
VALUES (
    'BOOK',
    (SELECT book_id FROM Books WHERE title = 'A Farewell to Arms'),
    'AVAILABLE'
);


/* ---------- AUDIOBOOK COPIES ---------- */

INSERT INTO LibraryItems
(item_type, audiobook_id, status)
SELECT 'AUDIOBOOK', audiobook_id, 'AVAILABLE'
FROM Audiobooks
WHERE title = 'Dune Audiobook';

INSERT INTO LibraryItems
(item_type, audiobook_id, status)
SELECT 'AUDIOBOOK', audiobook_id, 'CHECKED_OUT'
FROM Audiobooks
WHERE title = '1984 Audiobook';

INSERT INTO LibraryItems
(item_type, audiobook_id, status)
SELECT 'AUDIOBOOK', audiobook_id, 'AVAILABLE'
FROM Audiobooks
WHERE title = 'The Hobbit Audiobook';

INSERT INTO LibraryItems
(item_type, audiobook_id, status)
SELECT 'AUDIOBOOK', audiobook_id, 'AVAILABLE'
FROM Audiobooks
WHERE title = 'The Fellowship of the Ring Audiobook';

INSERT INTO LibraryItems
(item_type, audiobook_id, status)
SELECT 'AUDIOBOOK', audiobook_id, 'AVAILABLE'
FROM Audiobooks
WHERE title = 'The Shining Audiobook';

INSERT INTO LibraryItems
(item_type, audiobook_id, status)
SELECT 'AUDIOBOOK', audiobook_id, 'AVAILABLE'
FROM Audiobooks
WHERE title = 'Fahrenheit 451 Audiobook';

INSERT INTO LibraryItems
(item_type, audiobook_id, status)
SELECT 'AUDIOBOOK', audiobook_id, 'AVAILABLE'
FROM Audiobooks
WHERE title = 'The Road Audiobook';

INSERT INTO LibraryItems
(item_type, audiobook_id, status)
SELECT 'AUDIOBOOK', audiobook_id, 'AVAILABLE'
FROM Audiobooks
WHERE title = 'And Then There Were None Audiobook';


/* ---------- CD COPIES ---------- */

INSERT INTO LibraryItems
(item_type, cd_id, status)
SELECT 'CD', cd_id, 'AVAILABLE'
FROM CDs
WHERE title = 'Abbey Road';

INSERT INTO LibraryItems
(item_type, cd_id, status)
SELECT 'CD', cd_id, 'CHECKED_OUT'
FROM CDs
WHERE title = 'The Dark Side of the Moon';

INSERT INTO LibraryItems
(item_type, cd_id, status)
SELECT 'CD', cd_id, 'AVAILABLE'
FROM CDs
WHERE title = 'Rumours';

INSERT INTO LibraryItems
(item_type, cd_id, status)
SELECT 'CD', cd_id, 'AVAILABLE'
FROM CDs
WHERE title = 'Led Zeppelin IV';

INSERT INTO LibraryItems
(item_type, cd_id, status)
SELECT 'CD', cd_id, 'AVAILABLE'
FROM CDs
WHERE title = 'Born to Run';

INSERT INTO LibraryItems
(item_type, cd_id, status)
SELECT 'CD', cd_id, 'AVAILABLE'
FROM CDs
WHERE title = 'Kind of Blue';

INSERT INTO LibraryItems
(item_type, cd_id, status)
SELECT 'CD', cd_id, 'AVAILABLE'
FROM CDs
WHERE title = 'A Love Supreme';

INSERT INTO LibraryItems
(item_type, cd_id, status)
SELECT 'CD', cd_id, 'AVAILABLE'
FROM CDs
WHERE title = 'Time Out';

INSERT INTO LibraryItems
(item_type, cd_id, status)
SELECT 'CD', cd_id, 'CHECKED_OUT'
FROM CDs
WHERE title = 'Thriller';

INSERT INTO LibraryItems
(item_type, cd_id, status)
SELECT 'CD', cd_id, 'AVAILABLE'
FROM CDs
WHERE title = 'Purple Rain';

INSERT INTO LibraryItems
(item_type, cd_id, status)
SELECT 'CD', cd_id, 'AVAILABLE'
FROM CDs
WHERE title = 'Like a Prayer';

INSERT INTO LibraryItems
(item_type, cd_id, status)
SELECT 'CD', cd_id, 'AVAILABLE'
FROM CDs
WHERE title = 'Nevermind';


/* ---------- MAGAZINE COPIES ---------- */

INSERT INTO LibraryItems
(item_type, magazine_id, status)
SELECT 'MAGAZINE', magazine_id, 'AVAILABLE'
FROM Magazines
WHERE title = 'Science Monthly';

INSERT INTO LibraryItems
(item_type, magazine_id, status)
SELECT 'MAGAZINE', magazine_id, 'CHECKED_OUT'
FROM Magazines
WHERE title = 'Modern History';

INSERT INTO LibraryItems
(item_type, magazine_id, status)
SELECT 'MAGAZINE', magazine_id, 'AVAILABLE'
FROM Magazines
WHERE title = 'Technology Review';

INSERT INTO LibraryItems
(item_type, magazine_id, status)
SELECT 'MAGAZINE', magazine_id, 'AVAILABLE'
FROM Magazines
WHERE title = 'World History';

INSERT INTO LibraryItems
(item_type, magazine_id, status)
SELECT 'MAGAZINE', magazine_id, 'AVAILABLE'
FROM Magazines
WHERE title = 'Literary Review';

INSERT INTO LibraryItems
(item_type, magazine_id, status)
SELECT 'MAGAZINE', magazine_id, 'AVAILABLE'
FROM Magazines
WHERE title = 'Popular Science';


/* =========================================================
   11. CHECKOUTS
   Includes both overdue and current checkouts.
   ========================================================= */

/* Ryan has overdue Dune */

INSERT INTO Checkouts
(member_id, item_id, checkout_date, due_date, return_date, renewal_count)
VALUES (
    (SELECT member_id
     FROM Members
     WHERE email = 'ryan.young@example.com'),

    (
        SELECT MIN(li.item_id)
        FROM LibraryItems li
        JOIN Books b
            ON li.book_id = b.book_id
        WHERE b.title = 'Dune'
          AND li.status = 'CHECKED_OUT'
    ),

    DATE '2026-09-20',
    DATE '2026-10-04',
    NULL,
    1
);


/* Sarah has 1984 */

INSERT INTO Checkouts
(member_id, item_id, checkout_date, due_date, return_date, renewal_count)
VALUES (
    (SELECT member_id
     FROM Members
     WHERE email = 'sarah.miller@example.com'),

    (
        SELECT li.item_id
        FROM LibraryItems li
        JOIN Books b
            ON li.book_id = b.book_id
        WHERE b.title = '1984'
          AND li.status = 'CHECKED_OUT'
    ),

    DATE '2026-10-10',
    DATE '2026-10-24',
    NULL,
    0
);


/* Emily has The Shining overdue */

INSERT INTO Checkouts
(member_id, item_id, checkout_date, due_date, return_date, renewal_count)
VALUES (
    (SELECT member_id
     FROM Members
     WHERE email = 'emily.davis@example.com'),

    (
        SELECT li.item_id
        FROM LibraryItems li
        JOIN Books b
            ON li.book_id = b.book_id
        WHERE b.title = 'The Shining'
          AND li.status = 'CHECKED_OUT'
    ),

    DATE '2026-09-15',
    DATE '2026-09-29',
    NULL,
    0
);


/* Amanda has Brave New World */

INSERT INTO Checkouts
(member_id, item_id, checkout_date, due_date, return_date, renewal_count)
VALUES (
    (SELECT member_id
     FROM Members
     WHERE email = 'amanda.clark@example.com'),

    (
        SELECT li.item_id
        FROM LibraryItems li
        JOIN Books b
            ON li.book_id = b.book_id
        WHERE b.title = 'Brave New World'
          AND li.status = 'CHECKED_OUT'
    ),

    DATE '2026-10-12',
    DATE '2026-10-26',
    NULL,
    0
);


/* Daniel has I, Robot overdue */

INSERT INTO Checkouts
(member_id, item_id, checkout_date, due_date, return_date, renewal_count)
VALUES (
    (SELECT member_id
     FROM Members
     WHERE email = 'daniel.martinez@example.com'),

    (
        SELECT li.item_id
        FROM LibraryItems li
        JOIN Books b
            ON li.book_id = b.book_id
        WHERE b.title = 'I, Robot'
          AND li.status = 'CHECKED_OUT'
    ),

    DATE '2026-09-25',
    DATE '2026-10-09',
    NULL,
    0
);


/* Jennifer has 1984 Audiobook */

INSERT INTO Checkouts
(member_id, item_id, checkout_date, due_date, return_date, renewal_count)
VALUES (
    (SELECT member_id
     FROM Members
     WHERE email = 'jennifer.taylor@example.com'),

    (
        SELECT li.item_id
        FROM LibraryItems li
        JOIN Audiobooks a
            ON li.audiobook_id = a.audiobook_id
        WHERE a.title = '1984 Audiobook'
          AND li.status = 'CHECKED_OUT'
    ),

    DATE '2026-10-09',
    DATE '2026-10-23',
    NULL,
    0
);


/* James has Dark Side of the Moon overdue */

INSERT INTO Checkouts
(member_id, item_id, checkout_date, due_date, return_date, renewal_count)
VALUES (
    (SELECT member_id
     FROM Members
     WHERE email = 'james.wilson@example.com'),

    (
        SELECT li.item_id
        FROM LibraryItems li
        JOIN CDs c
            ON li.cd_id = c.cd_id
        WHERE c.title = 'The Dark Side of the Moon'
          AND li.status = 'CHECKED_OUT'
    ),

    DATE '2026-09-20',
    DATE '2026-10-04',
    NULL,
    0
);


/* Laura has Thriller */

INSERT INTO Checkouts
(member_id, item_id, checkout_date, due_date, return_date, renewal_count)
VALUES (
    (SELECT member_id
     FROM Members
     WHERE email = 'laura.thomas@example.com'),

    (
        SELECT li.item_id
        FROM LibraryItems li
        JOIN CDs c
            ON li.cd_id = c.cd_id
        WHERE c.title = 'Thriller'
          AND li.status = 'CHECKED_OUT'
    ),

    DATE '2026-10-10',
    DATE '2026-10-24',
    NULL,
    0
);


/* Christopher has Modern History overdue */

INSERT INTO Checkouts
(member_id, item_id, checkout_date, due_date, return_date, renewal_count)
VALUES (
    (SELECT member_id
     FROM Members
     WHERE email = 'chris.anderson@example.com'),

    (
        SELECT li.item_id
        FROM LibraryItems li
        JOIN Magazines m
            ON li.magazine_id = m.magazine_id
        WHERE m.title = 'Modern History'
          AND li.status = 'CHECKED_OUT'
    ),

    DATE '2026-09-10',
    DATE '2026-09-24',
    NULL,
    0
);


/* =========================================================
   12. FINES
   ========================================================= */

INSERT INTO Fines
(checkout_id, amount, paid_status, date_assessed, date_paid)
SELECT
    c.checkout_id,
    12.50,
    'UNPAID',
    DATE '2026-10-05',
    NULL
FROM Checkouts c
JOIN Members m
    ON c.member_id = m.member_id
WHERE m.email = 'ryan.young@example.com';


INSERT INTO Fines
(checkout_id, amount, paid_status, date_assessed, date_paid)
SELECT
    c.checkout_id,
    8.00,
    'UNPAID',
    DATE '2026-10-01',
    NULL
FROM Checkouts c
JOIN Members m
    ON c.member_id = m.member_id
WHERE m.email = 'emily.davis@example.com';


INSERT INTO Fines
(checkout_id, amount, paid_status, date_assessed, date_paid)
SELECT
    c.checkout_id,
    4.50,
    'PAID',
    DATE '2026-10-10',
    DATE '2026-10-12'
FROM Checkouts c
JOIN Members m
    ON c.member_id = m.member_id
WHERE m.email = 'daniel.martinez@example.com';


INSERT INTO Fines
(checkout_id, amount, paid_status, date_assessed, date_paid)
SELECT
    c.checkout_id,
    6.00,
    'UNPAID',
    DATE '2026-10-05',
    NULL
FROM Checkouts c
JOIN Members m
    ON c.member_id = m.member_id
WHERE m.email = 'james.wilson@example.com';


/* =========================================================
   SAVE EVERYTHING
   ========================================================= */

COMMIT;