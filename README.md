# OracleDBProject
Oracle Database Website using Azure VM and Flask

1. Member Search and Sorting
SELECT
    member_id,
    first_name,
    last_name,
    email,
    phone,
    join_date,
    membership_status
FROM Members
WHERE 1 = 1
When a last name is entered, the following condition is dynamically added:
AND UPPER(last_name) LIKE UPPER(:last_name)
The results can then be sorted dynamically:
ORDER BY last_name ASC
or:
ORDER BY last_name DESC
Overview:
This query displays library members and allows a user to perform a case-insensitive partial search by last name. It uses a bind variable for the search value and allows the results to be sorted alphabetically A-Z or Z-A. WHERE 1 = 1 is used so additional search conditions can easily be appended dynamically.

2. Book Search and Sorting
SELECT
    b.book_id,
    b.title,
    b.isbn,
    b.publication_year,
    p.publisher_name,
    g.genre_name
FROM Books b
LEFT JOIN Publishers p
    ON b.publisher_id = p.publisher_id
LEFT JOIN Genres g
    ON b.genre_id = g.genre_id
The query dynamically adds one of the following:
ORDER BY b.title ASC

ORDER BY b.title DESC

ORDER BY b.publication_year DESC

ORDER BY b.publication_year ASC
Overview:
This query retrieves books while joining the Publishers and Genres tables so that descriptive publisher and genre names can be displayed instead of only foreign key IDs. Users can sort the results by title or publication year.

3. Genre List
SELECT
    genre_id,
    genre_name
FROM Genres
ORDER BY genre_name
Overview:
This query retrieves all available genres alphabetically. The results are used to populate genre selection controls in the web application.

4. Search Library Materials by Genre
SELECT 'BOOK', b.title, b.publication_year
FROM Books b
WHERE b.genre_id = :genre_id

UNION ALL

SELECT 'AUDIOBOOK', a.title, a.publication_year
FROM Audiobooks a
WHERE a.genre_id = :genre_id

UNION ALL

SELECT 'CD', c.title, c.release_year
FROM CDs c
WHERE c.genre_id = :genre_id

ORDER BY 2
Overview:
This query searches three different media tables for items belonging to a selected genre. UNION ALL combines books, audiobooks, and CDs into a single result set. A literal value such as 'BOOK' or 'CD' identifies what type of library material each result represents. A bind variable is used for the selected genre.

5. Magazine Search and Sorting
SELECT
    m.magazine_id,
    m.title,
    m.issue_number,
    m.publication_date,
    p.publisher_name
FROM Magazines m
LEFT JOIN Publishers p
    ON m.publisher_id = p.publisher_id
The query dynamically adds one of the following:
ORDER BY m.title ASC

ORDER BY m.title DESC

ORDER BY m.publication_date DESC

ORDER BY m.publication_date ASC

ORDER BY p.publisher_name ASC

ORDER BY p.publisher_name DESC
Overview:
This query retrieves magazines and joins them to their publishers. The user can dynamically sort the results by title, publication date, or publisher name in ascending or descending order.

6. Music/CD Search by Genre
SELECT
    c.cd_id,
    c.title,
    c.artist,
    c.release_year,
    g.genre_name
FROM CDs c
LEFT JOIN Genres g
    ON c.genre_id = g.genre_id
WHERE 1 = 1
When a genre is selected, this condition is added:
AND c.genre_id = :genre_id
The final results are sorted with:
ORDER BY c.artist, c.title
Overview:
This query displays CDs along with their genre names. Users can optionally filter the results by genre using a bind variable. The results are sorted first by artist and then by title.

7. Overdue Library Items
SELECT
    c.checkout_id,
    m.first_name,
    m.last_name,
    li.item_type,
    CASE
        WHEN li.item_type = 'BOOK' THEN b.title
        WHEN li.item_type = 'AUDIOBOOK' THEN a.title
        WHEN li.item_type = 'CD' THEN cd.title
        WHEN li.item_type = 'MAGAZINE' THEN mag.title
    END AS item_title,
    c.checkout_date,
    c.due_date
FROM Checkouts c

JOIN Members m
    ON c.member_id = m.member_id

JOIN LibraryItems li
    ON c.item_id = li.item_id

LEFT JOIN Books b
    ON li.book_id = b.book_id

LEFT JOIN Audiobooks a
    ON li.audiobook_id = a.audiobook_id

LEFT JOIN CDs cd
    ON li.cd_id = cd.cd_id

LEFT JOIN Magazines mag
    ON li.magazine_id = mag.magazine_id

WHERE c.return_date IS NULL
  AND c.due_date < SYSDATE

ORDER BY c.due_date
Overview:
This query identifies all currently overdue library items. It joins checkouts to members and physical library items, and then uses several LEFT JOIN operations to locate the correct title depending on whether the item is a book, audiobook, CD, or magazine. A CASE expression selects the appropriate title. SYSDATE is used to determine whether the due date has passed.

8. Members With Overdue Items
SELECT
    m.member_id,
    m.first_name,
    m.last_name,
    m.email,
    COUNT(c.checkout_id) AS overdue_count,
    MIN(c.due_date) AS oldest_due_date
FROM Members m

JOIN Checkouts c
    ON m.member_id = c.member_id

WHERE c.return_date IS NULL
  AND c.due_date < SYSDATE

GROUP BY
    m.member_id,
    m.first_name,
    m.last_name,
    m.email

ORDER BY overdue_count DESC,
         m.last_name
Overview:
This is an aggregate report that identifies members who currently have overdue items. COUNT() calculates how many overdue checkouts each member has, while MIN() determines their oldest outstanding due date. GROUP BY creates one result row per member, and the results are ordered by the number of overdue items.

SQL Concepts Demonstrated
Across these searches, the application currently demonstrates:
Basic SELECT queries
WHERE filtering
Dynamic search conditions
Bind variables
LIKE
UPPER()
INNER JOIN
LEFT JOIN
Multiple-table joins
UNION ALL
CASE expressions
SYSDATE
COUNT()
MIN()
GROUP BY
Dynamic ORDER BY
Ascending and descending sorting
Searching across multiple related tables


