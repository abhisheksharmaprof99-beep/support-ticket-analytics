"""Load the cleaned ticket data into a SQLite database."""
import sqlite3
from pathlib import Path

import pandas as pd

ROOT = Path(__file__).resolve().parent.parent
CSV_PATH = ROOT / "data" / "processed" / "tickets_clean.csv"
DB_PATH = ROOT / "data" / "processed" / "tickets.db"


def main() -> None:
    df = pd.read_csv(CSV_PATH)
    with sqlite3.connect(DB_PATH) as conn:
        df.to_sql("tickets", conn, if_exists="replace", index=False)
        count = conn.execute("SELECT COUNT(*) FROM tickets").fetchone()[0]
    print(f"Loaded {count} rows into {DB_PATH.name}")


if __name__ == "__main__":
    main()