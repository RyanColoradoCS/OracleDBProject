from flask import Flask, render_template, request
from db import get_connection
import oracledb

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
    # WHERE 1 = 1 is always true and makes it easier to dynamically append additional filters with AND.
    # It does not change the results by itself.

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
    # Get the selected sort option from the URL
    # default to title A-Z if none is provided.
    sort = request.args.get("sort", "title_az")

    # data base connection
    connection = get_connection()
    cursor = connection.cursor()

    sql = """
        SELECT
            m.magazine_id,
            m.title,
            m.issue_number,
            m.publication_date,
            p.publisher_name
        FROM Magazines m
        LEFT JOIN Publishers p
            ON m.publisher_id = p.publisher_id
    """

    if sort == "title_za":
        sql += " ORDER BY m.title DESC"
    elif sort == "date_new":
        sql += " ORDER BY m.publication_date DESC"
    elif sort == "date_old":
        sql += " ORDER BY m.publication_date ASC"
    elif sort == "publisher_az":
        sql += " ORDER BY p.publisher_name ASC"
    elif sort == "publisher_za":
        sql += " ORDER BY p.publisher_name DESC"
    else:
        sql += " ORDER BY m.title ASC"
    
    cursor.execute(sql)
    rows = cursor.fetchall()
    
    cursor.close()
    connection.close()

    return render_template("magazines.html", magazines=rows)
    # matches HTML loop {% for magazine in magazines %}

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

@app.route("/addmembers", methods=["GET", "POST"])
def addmember():

    if request.method == "POST":
        '''
        .get("first_name", "") Looks up the key "first_name". If the field is missing, 
        it returns the default "" instead of raising a KeyError..strip()Removes any 
        leading and trailing whitespace from the value.
        '''
        # Get the values submitted from the HTML form, clean up whitespace
        first_name = request.form.get("first_name", "").strip()
        last_name = request.form.get("last_name", "").strip()
        email = request.form.get("email", "").strip()
        phone = request.form.get("phone", "").strip()
        membership_status = request.form.get("membership_status", "ACTIVE")

        # Validate the submitted values
        if (
            not first_name
            or not last_name
            or not email
            or membership_status not in ("ACTIVE", "INACTIVE", "SUSPENDED")
        ):
            return render_template(
                "memberresult.html",
                success=False,
                error="Invalid member information."
            ), 400
        # 400 is a Bad Request error (HTTP status code)

        connection = None
        cursor = None

        try:
            # Connect to Oracle, call function in db.py
            connection = get_connection()
            cursor = connection.cursor()

            # Insert the new member
            sql = """
                INSERT INTO Members ( first_name, last_name, email, phone, membership_status)
                VALUES (:first_name, :last_name, :email, :phone, :membership_status)
            """
            cursor.execute(
                sql,
                {
                    "first_name": first_name,
                    "last_name": last_name,
                    "email": email,
                    "phone": phone or None,
                    "membership_status": membership_status
                }
            )
            # Save the changes to the Oracle DB
            connection.commit()

            return render_template(
                "memberresult.html",
                success=True,
                first_name=first_name,
                last_name=last_name
            )

        except Exception as e:
            if connection:
                connection.rollback()

            app.logger.exception("Failed to add member")

            return render_template(
                "memberresult.html",
                success=False,
                error="Unable to add member."
                # error=str(e)
            ), 500

        finally:
            if cursor:
                cursor.close()

            if connection:
                connection.close()

    return render_template("addmembers.html")

# @app.route("/deletemembers")
@app.route("/deletemembers", methods=["GET", "POST"])
def deletemember():

    connection = None
    cursor = None

    try:
        connection = get_connection()
        cursor = connection.cursor()

        if request.method == "POST":

            member_id = request.form.get("member_id", type=int)

            if member_id is None:
                return render_template(
                    "memberresultdelete.html",
                    success=False,
                    error="Please select a valid member."
                ), 400

            # Find the member before deleting using SQL select by member id
            cursor.execute("""
                SELECT first_name, last_name
                FROM Members
                WHERE member_id = :member_id
            """, {"member_id": member_id})
            # Dictionary that maps the placeholder name to the actual Python value
            # In this case, ":member_id" in the SQL query is mapped to the Python variable "member_id"

            # Fetch the member details from the database based on the member_id
            member = cursor.fetchone()

            # Check if the member exists in the database
            if member is None:
                return render_template(
                    "memberresultdelete.html",
                    success=False,
                    error="Member not found."
                ), 404

            cursor.execute("""
                DELETE FROM Members
                WHERE member_id = :member_id
            """, {"member_id": member_id})

            if cursor.rowcount == 0:
                connection.rollback()

                return render_template(
                    "memberresultdelete.html",
                    success=False,
                    error="Member was not deleted."
                ), 404

            connection.commit()

            return render_template(
                "memberresultdelete.html",
                success=True,
                first_name=member[0],
                last_name=member[1]
            )

        # This gets all the members from the database for the dropdown (if not a post request)
        cursor.execute("""
            SELECT
                member_id,
                first_name,
                last_name,
                email
            FROM Members
            ORDER BY last_name, first_name
        """)

        members = cursor.fetchall()

        return render_template(
            "deletemembers.html",
            members=members
        )

    except oracledb.IntegrityError:
        if connection:
            connection.rollback()

        app.logger.exception("Oracle constraint prevented member deletion")

        return render_template(
            "memberresultdelete.html",
            success=False,
            error="This member cannot be deleted because related library records exist."
        ), 409

    except Exception:
        if connection:
            connection.rollback()

        app.logger.exception("Failed to delete member")

        return render_template(
            "memberresultdelete.html",
            success=False,
            error="Unable to delete member."
        ), 500

    # Close the database connection and cursor
    finally:
        if cursor:
            cursor.close()

        if connection:
            connection.close()
            




@app.route("/memberresult", methods=["GET", "POST"])
def memberresult():
    return render_template("memberresult.html")

@app.route("/updatemembers")
def updatemembers():
    # Connect to Oracle
    connection = get_connection()
    cursor = connection.cursor()

    # Retrieve members for the dropdown
    cursor.execute("""
        SELECT
            member_id,
            first_name,
            last_name,
            email
        FROM Members
        ORDER BY last_name, first_name
    """)

    members = cursor.fetchall()

    cursor.close()
    connection.close()

    return render_template("updatemembers.html", members=members)

if __name__ == "__main__":
    app.run(debug=True)