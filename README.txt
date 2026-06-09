World Cup 2026 Match Viewer

This is a simple Flask web application for viewing FIFA World Cup 2026 group stage matches.

The app uses a PostgreSQL database with teams, venues, and matches. Users can view matches, filter by group, search by team, and sort by match number, group, date, city, or region.

The admin page allows manual score updates and score resets. Score input is validated with regex in the format 1-1, 2-0, 0-0.

Files:
- app.py: Flask application
- requirements.txt: Python dependencies
- schema.sql: Creates the database tables
- data.sql: Inserts teams, venues, and group stage matches
- templates/index.html: Main match viewer page
- templates/admin.html: Admin score update page
- ER-Diagram_VM.png: Database E/R diagram

Setup:
1. Install dependencies:
   pip install -r requirements.txt

2. Create a PostgreSQL database named:
   WorldCup

3. Run the SQL files in this order:
   schema.sql
   data.sql

4. In app.py, replace YOUR_PASSWORD with your local PostgreSQL password.

5. Start the app:
   python app.py

6. Open:
   http://127.0.0.1:5000

Admin page:
   http://127.0.0.1:5000/admin


AI Declaration

AI was used for project planning, Debugging and with HTML/CSS layout.



