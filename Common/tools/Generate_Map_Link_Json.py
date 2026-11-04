"""Converts Door_Destinations.csv and Interactive_Actions.csv into JSON for Godot.

Run manually, outside Godot, whenever either CSV changes:
    python Generate_Map_Link_Json.py
"""
import csv
import json
from pathlib import Path

DATA_DIRECTORY = Path(__file__).resolve().parent.parent / "Data" / "Map"

# (csv file, json file, key that holds the row list)
TABLES = [
    ("Door_Destinations.csv", "Door_Destinations.json", "Doors"),
    ("Interactive_Actions.csv", "Interactive_Actions.json", "Interactives"),
]
NUMERIC_COLUMNS = {"Spawn_X", "Spawn_Y"}


def convert_row(row):
    return {
        column: float(value) if column in NUMERIC_COLUMNS else value
        for column, value in row.items()
    }


def convert_table(csv_name, json_name, list_key):
    with open(DATA_DIRECTORY / csv_name, newline="") as csv_file:
        rows = [convert_row(row) for row in csv.DictReader(csv_file)]
    with open(DATA_DIRECTORY / json_name, "w") as json_file:
        json.dump({list_key: rows}, json_file, indent=4)
    print("Wrote " + str(len(rows)) + " rows to " + json_name)


def main():
    for csv_name, json_name, list_key in TABLES:
        convert_table(csv_name, json_name, list_key)


if __name__ == "__main__":
    main()
