import json
import re
import psycopg2

with open("task1_d.json", "r", encoding="utf-8") as f:
    text = f.read()

text = re.sub(r':(\w+)\s*=>', r'"\1":', text)
text = text.replace("=>", ":")

data = json.loads(text)

conn = psycopg2.connect(
    host="localhost",
    database="myDatabase",
    user="postgres",
    password="1234"
)
cur = conn.cursor()

for book in data:
    cur.execute("""
        INSERT INTO books (
            id, title, author, genre, publisher, year, price_raw
        ) VALUES (%s, %s, %s, %s, %s, %s, %s)
    """, (
        book["id"],
        book.get("title"),
        book.get("author"),
        book.get("genre"),
        book.get("publisher"),
        book.get("year"),
        book.get("price")
    ))

conn.commit()
cur.close()
conn.close()

print("DONE")
