import tables

type ExPref = object
  exUnit, weightUnit: string
  preset: seq[int]

const GLOBAL_PREF* = ExPref(
  exUnit: "rep",
  weightUnit: "kg")

var exPrefDB* = {
  "Pulldown": ExPref(
    weightUnit: "lb",
    preset: @[
      12, 120,
      12, 120,
      10, 120,
      8, 120])
}.toTable()

exPrefDB["Bicep curls"] = x

