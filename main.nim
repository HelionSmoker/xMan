import
  tables,
  "preferences.nim"

# const ANS = [["n", "no", "No"], ["y", "yes", "Yes"]]     # ???

proc createExProfile(ex_name: string) =
  exPrefDB[ex_name] = GLOBAL_PREF
  stdout.write("Exercise unit [", GLOBAL_PREF[ex_unit], "]: ")
  var ex_unit = stdin.readLine()
  if ex_unit != "": exPrefDB[ex_name].ex_unit = ex_unit

var datesDB = {
  "2022.06.13": [
    ("Pulldown", @[
      12, 120,
      12, 120,
      10, 120,
      8, 120]),
    ("Ab crunch", @[
      12, 120,
      12, 120,
      10, 120,
      8, 120])
  ].toOrderedTable()
}.toTable()

datesDB["2022.06.20"] = [("Suqats", @[20, 20, 12, 30, 12, 40, 12,
    50])].toOrderedTable()
echo datesDB

var allIsOk: bool # TODO: change name
while allIsOk == false:

  stdout.write("Exercise name: ")
  var ex_name = stdin.readLine()

  if not exPrefDB.hasKey(ex_name):
    stdout.write("Create profile for this exercise? [y]es (n)o: ")
    if stdin.readLine() == "": createExProfile()
    else: continue



  allIsOk = true



# stdout.write("Detailed form? [n]o (y)es: ")
# let isDetailedForm = if stdin.readLine() in ANS[1]: true else: false

# stdout.write("# Sets: ")
# let NUM_SETS = stdin.readLine()

# if isDetailedForm:
#   for i in 1..NUM_SETS.parseInt():
#     stdout.write("[1mSet ", i, "[0m\n# Units: ")
#     # stdout.write("\tUnits [reps] | Weight [kg]\nSet ", i, " @ 23]")
# let NUM_UNITS = stdin.readLine()

# echo EX_NAME, ' ', NUM_SETS, ' ', NUM_UNITS
# let name = stdin.readLine()
# stdout.write("# Units [reps]: ")
# stdout.write("Weight [kg]: ")

# stdout.write("Provide more details [no] (y)es: ")

# let bicepCurl = Exercise("Bicep Curl", sets: 4, reps: 10, weight: 15, restTime: 30)

# Time-based exercises

# import strutils

# const INTERVALS = ['h', 'm', 's']
# proc strToInter(str: string): array[3, int] =
#   ## Given a string containing a duration, parse the string and
#   ## return that duration in hours, minutes and seconds.
#   var numStr = ""
#   var i = 0

#   while i < len(str):
#     case str[i]
#     of '0'..'9': numStr.add(str[i])
#     of INTERVALS:
#       # Only the first char of the interval is relevant. We set it in the correct
#       # position and (if duplicate) we add it.
#       if numStr != "": result[INTERVALS.find(str[i])] += parseInt(numStr)
#       numStr = ""
#     else: discard
#     inc(i)

# doAssert strToInter("2sec 21 sec 3s 5 minutes 3h") == [3, 5, 26]
# doAssert strToInter("5h 3 sec 5 min") == [5, 5, 3]

# proc interToStr(inter: array[3, int]): string =
#   for i in 0..2:
#     if inter[i] != 0: result.add($inter[i] & INTERVALS[i] & ' ')
#   result = result.strip()

# doAssert interToStr([5, 7, 3]) == "5h 7m 3s"
# doAssert interToStr([0, 19, 0]) == "19m"

# proc fmtInter(inter: array[3, float], decimals: Natural): array[3, string] =
#   let rawResult = [
#     inter[0] + inter[1] / 60,
#     inter[0] * 60 + inter[1] + inter[2] / 60,
#     inter[0] * 3600 + inter[1] * 60 + inter[2]]

#   for i in 0..2: result[i] = rawResult[i].formatBiggestFloat(ffDecimal, 2)


# echo interToStr(strToInter("5h 3 sec 5 min"))
# assert fmtInter(strToInter("1h 30min 5 seconds"), 2) == ["1.50", "90.08", "5405.00"]
# assert fmtInter(strToInter("1min 30 seconds"), 2) == ["0.02", "1.50", "90.00"]
