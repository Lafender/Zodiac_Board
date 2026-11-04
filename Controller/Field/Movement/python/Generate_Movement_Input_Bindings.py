"""Converts Movement_Input_Bindings.csv into Movement_Input_Bindings.json.

Run manually, outside Godot, whenever the CSV changes:
    python Generate_Movement_Input_Bindings.py
"""
import csv
import json
from pathlib import Path

DATA_DIRECTORY = Path(__file__).resolve().parent.parent / "Data" / "Movement"
CSV_PATH = DATA_DIRECTORY / "Movement_Input_Bindings.csv"
JSON_PATH = DATA_DIRECTORY / "Movement_Input_Bindings.json"

# Godot 3 constants: KEY_* are scancodes, JOY_AXIS_0/1 are the left thumbstick X/Y.
CODE_LOOKUP = {
    "KEY_W": 87,
    "KEY_A": 65,
    "KEY_S": 83,
    "KEY_D": 68,
    "JOY_AXIS_0": 0,
    "JOY_AXIS_1": 1,
}
VALID_EVENT_TYPES = {"Key", "Joy_Axis"}


def build_binding(row):
    if row["Event_Type"] not in VALID_EVENT_TYPES:
        raise ValueError("Unknown Event_Type: " + row["Event_Type"])
    if row["Code_Name"] not in CODE_LOOKUP:
        raise ValueError("Unknown Code_Name: " + row["Code_Name"])
    return {
        "Action_Name": row["Action_Name"],
        "Event_Type": row["Event_Type"],
        "Code": CODE_LOOKUP[row["Code_Name"]],
        "Axis_Value": float(row["Axis_Value"]),
        "Dead_Zone": float(row["Dead_Zone"]),
    }


def main():
    with open(CSV_PATH, newline="") as csv_file:
        bindings = [build_binding(row) for row in csv.DictReader(csv_file)]
    with open(JSON_PATH, "w") as json_file:
        json.dump({"Bindings": bindings}, json_file, indent=4)
    print("Wrote " + str(len(bindings)) + " bindings to " + str(JSON_PATH))


if __name__ == "__main__":
    main()
