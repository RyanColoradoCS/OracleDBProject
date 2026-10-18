from flask import Flask, render_template, request
from db import get_connection

app = Flask(__name__)

@app.route("/")
def home():
    return render_template("index.html")

@app.route("/members")
def members():

    last_name = request.args.get("last_name")
    sort = request.args.get("sort", "az")

    connection = get_connection()
    cursor = connection.cursor()

    sql = """
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
    """

    params = {}

    if last_name:
        sql += """
            AND UPPER(last_name) LIKE UPPER(:last_name)
        """

        params["last_name"] = "%" + last_name + "%"

    if sort == "za":
        sql += " ORDER BY last_name DESC"
    else:
        sql += " ORDER BY last_name ASC"

    cursor.execute(sql, params)

    rows = cursor.fetchall()

    cursor.close()
    connection.close()

    return render_template(
        "members.html",
        members=rows
    )

@app.route("/books")
def books():
    sort = request.args.get("sort", "title_az")

    connection = get_connection()
    cursor = connection.cursor()

    sql = """
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
    """

    if sort == "title_za":
        sql += " ORDER BY b.title DESC"
    elif sort == "year_new":
        sql += " ORDER BY b.publication_year DESC"
    elif sort == "year_old":
        sql += " ORDER BY b.publication_year ASC"
    else:
        sql += " ORDER BY b.title ASC"

    cursor.execute(sql)
    rows = cursor.fetchall()

    cursor.close()
    connection.close()

    return render_template("books.html", books=rows)

@app.route("/genres")
def genres():
    selected_genre = request.args.get("genre_id")

    connection = get_connection()
    cursor = connection.cursor()

    cursor.execute("""
        SELECT genre_id, genre_name
        FROM Genres
        ORDER BY genre_name
    """)

    genres = cursor.fetchall()

    items = []

    if selected_genre:
        cursor.execute("""
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
        """, genre_id=selected_genre)

        items = cursor.fetchall()

    cursor.close()
    connection.close()

    return render_template(
        "genres.html",
        genres=genres,
        items=items,
        selected_genre=selected_genre
    )

@app.route("/magazines")
def magazines():
    connection = get_connection()
    cursor = connection.cursor()

    cursor.execute("""
        SELECT
            m.magazine_id,
            m.title,
            m.issue_number,
            m.publication_date,
            p.publisher_name
        FROM Magazines m
        LEFT JOIN Publishers p
            ON m.publisher_id = p.publisher_id
        ORDER BY m.publication_date DESC
    """)

    rows = cursor.fetchall()

    cursor.close()
    connection.close()

    return render_template("magazines.html", magazines=rows)

@app.route("/music")
def music():
    genre_id = request.args.get("genre_id")

    connection = get_connection()
    cursor = connection.cursor()

    cursor.execute("""
        SELECT genre_id, genre_name
        FROM Genres
        ORDER BY genre_name
    """)

    genres = cursor.fetchall()

    sql = """
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
    """

    params = {}

    if genre_id:
        sql += " AND c.genre_id = :genre_id"
        params["genre_id"] = genre_id

    sql += " ORDER BY c.artist, c.title"

    cursor.execute(sql, params)

    cds = cursor.fetchall()

    cursor.close()
    connection.close()

    return render_template(
        "music.html",
        cds=cds,
        genres=genres
    )

@app.route("/overdue")
def overdue():
    connection = get_connection()
    cursor = connection.cursor()

    cursor.execute("""
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
    """)

    rows = cursor.fetchall()

    cursor.close()
    connection.close()

    return render_template("overdue.html", overdue=rows)

@app.route("/overduemembers")
def overdue_members():
    connection = get_connection()
    cursor = connection.cursor()

    cursor.execute("""
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
    """)

    rows = cursor.fetchall()

    cursor.close()
    connection.close()

    return render_template(
        "overduemembers.html",
        members=rows
    )

if __name__ == "__main__":
    app.run(debug=True)