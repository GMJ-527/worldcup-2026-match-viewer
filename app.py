from flask import Flask, render_template, request, redirect, url_for
import psycopg2
import re

app = Flask(__name__)


def get_connection():
    return psycopg2.connect(
        host="localhost",
        database="WorldCup",
        user="postgres",
        password="YOUR_PASSWORD",
        port="5432"
    )


def get_matches(selected_group=None, selected_team=None, sort_by="date"):
    conn = get_connection()
    cur = conn.cursor()

    query = """
        SELECT
            m.match_id,
            home.country_name AS home_team,
            away.country_name AS away_team,
            home.group_name AS group_name,
            m.match_date,
            m.match_time,
            v.city_name,
            v.region,
            m.stage,
            m.home_score,
            m.away_score,
            CASE
                WHEN m.home_score IS NULL AND m.away_score IS NULL THEN 'Upcoming'
                ELSE 'Finished'
            END AS match_status
        FROM Match m
        JOIN Team home ON m.home_team_id = home.team_id
        JOIN Team away ON m.away_team_id = away.team_id
        JOIN Venue v ON m.venue_id = v.venue_id
        WHERE 1=1
    """

    params = []

    if selected_group:
        query += " AND home.group_name = %s"
        params.append(selected_group)

    if selected_team:
        query += " AND (home.country_name ILIKE %s OR away.country_name ILIKE %s)"
        params.append(f"%{selected_team}%")
        params.append(f"%{selected_team}%")

    sort_options = {
        "match": "m.match_id ASC",
        "group": "home.group_name ASC, m.match_date ASC, m.match_time ASC",
        "date": "m.match_date ASC, m.match_time ASC",
        "city": "v.city_name ASC, m.match_date ASC, m.match_time ASC",
        "region": "v.region ASC, v.city_name ASC, m.match_date ASC"
    }

    order_by = sort_options.get(sort_by, sort_options["date"])
    query += f" ORDER BY {order_by};"

    cur.execute(query, params)
    matches = cur.fetchall()

    cur.execute("SELECT DISTINCT group_name FROM Team ORDER BY group_name;")
    groups = cur.fetchall()

    cur.close()
    conn.close()

    return matches, groups


@app.route("/")
def index():
    selected_group = request.args.get("group")
    selected_team = request.args.get("team")
    sort_by = request.args.get("sort_by", "date")

    matches, groups = get_matches(selected_group, selected_team, sort_by)

    return render_template(
        "index.html",
        matches=matches,
        groups=groups,
        selected_group=selected_group,
        selected_team=selected_team,
        sort_by=sort_by
    )


@app.route("/admin")
def admin():
    message = request.args.get("message")
    matches, groups = get_matches(sort_by="match")

    return render_template(
        "admin.html",
        matches=matches,
        groups=groups,
        message=message
    )


@app.route("/update_score", methods=["POST"])
def update_score():
    match_id = request.form.get("match_id")
    score = request.form.get("score")

    # Regex validation: score must look like 2-1, 0-0, 10-2, etc.
    score_pattern = r"^\d{1,2}-\d{1,2}$"

    if not re.match(score_pattern, score):
        return redirect(url_for(
            "admin",
            message="Invalid score format. Use format like 2-1."
        ))

    home_score, away_score = score.split("-")

    conn = get_connection()
    cur = conn.cursor()

    cur.execute("""
        UPDATE Match
        SET home_score = %s,
            away_score = %s
        WHERE match_id = %s;
    """, (int(home_score), int(away_score), int(match_id)))

    conn.commit()
    cur.close()
    conn.close()

    return redirect(url_for(
        "admin",
        message=f"Score updated for match {match_id}."
    ))


@app.route("/reset_individual_score", methods=["POST"])
def reset_individual_score():
    match_id = request.form.get("match_id")
    side = request.form.get("side")

    conn = get_connection()
    cur = conn.cursor()

    if side == "home":
        cur.execute("""
            UPDATE Match
            SET home_score = NULL
            WHERE match_id = %s;
        """, (int(match_id),))
        message = f"Home score reset for match {match_id}."

    elif side == "away":
        cur.execute("""
            UPDATE Match
            SET away_score = NULL
            WHERE match_id = %s;
        """, (int(match_id),))
        message = f"Away score reset for match {match_id}."

    else:
        message = "Invalid reset option."

    conn.commit()
    cur.close()
    conn.close()

    return redirect(url_for(
        "admin",
        message=message
    ))


@app.route("/reset_match_score", methods=["POST"])
def reset_match_score():
    match_id = request.form.get("match_id")

    conn = get_connection()
    cur = conn.cursor()

    cur.execute("""
        UPDATE Match
        SET home_score = NULL,
            away_score = NULL
        WHERE match_id = %s;
    """, (int(match_id),))

    conn.commit()
    cur.close()
    conn.close()

    return redirect(url_for(
        "admin",
        message=f"Both scores reset for match {match_id}."
    ))


@app.route("/reset_scores", methods=["POST"])
def reset_scores():
    conn = get_connection()
    cur = conn.cursor()

    cur.execute("""
        UPDATE Match
        SET home_score = NULL,
            away_score = NULL;
    """)

    conn.commit()
    cur.close()
    conn.close()

    return redirect(url_for(
        "admin",
        message="All scores have been reset."
    ))


if __name__ == "__main__":
    app.run(debug=True)
