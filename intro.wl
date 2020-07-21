(* ::Package:: *)

(* ::Title:: *)
(*Introduction to Mathematica*)


(* ::Section:: *)
(*Resources*)


(*
  Mathematica StackExchange:
  "What are the most common pitfalls awaiting new users?"
  <https://mathematica.stackexchange.com/q/18393>
*)


(*
  Use Mathematica in the browser (can't save anything though):
  <https://develop.open.wolframcloud.com/app/view/newNotebook?ext=nb>
*)


(* ::Section:: *)
(*Basics*)


(* ::Subsection:: *)
(*Evaluating a cell*)


(*
  Code goes inside input cells. To evaluate an input cell:
  1. Put the cursor into the cell
  2. Press [Shift + Enter] or press [Numpad Enter].
  Try this with the cell below:
*)


1 + 1


(*
  An output cell will containing the result
  will appear below the input cell.
  Pressing [Enter] instead of [Shift + Enter]
  will insert a line break instead of evaluating the cell.
*)


(* ::Subsection:: *)
(*Variables*)


(* ::Subsubsection:: *)
(*... must start with a letter and contain only letters and digits (NO underscores)*)


(* OK *)
var1
myVariable


(* Not OK: parsed as the number 1 times the variable `var` *)
1var


(* ::Subsubsection:: *)
(*... are blue when not set, and black when set*)


(* Currently blue *)
myVariable


(* Set it to some value: it turns black *)
myVariable = 4


(* Unset it: it turns blue again *)


myVariable =.


(* ::Subsubsection:: *)
(*... are case-sensitive. In particular, built-in functions start with a capital letter.*)
(*Best practice: start your own variables with a lower-case letter.*)


(* A user variable, not set to anything (blue) *)
sin


(* The built-in sine function (black, since it's already defined) *)
Sin


(* These capital letters are all built-in functions. Don't use them as variables! *)
C
D
E
I
K
N
O


(* ::Subsection:: *)
(*Setting variables (=, :=)*)


(* ::Subsubsection:: *)
(*Set (single equals): assign a value*)
(*Do NOT confuse with double equals (checks for equality)!*)


myVariable = 3
someString = "blah blah"


(* ::Subsubsection:: *)
(*Use semicolon to suppress output*)


suppressed = 10;


(* ::Subsubsection:: *)
(*SetDelayed (colon equals): assign a value without evaluating yet*)


(*
  Define a function.
  The underscore after the x is pattern object, called a 'Blank'.
*)
f[x_] := x^2


(* Call it: *)
f[3]


(* ::Subsection:: *)
(*Comparing values (==)*)


(* ::Subsubsection:: *)
(*Equal (double equals): compare two values*)
(*Do NOT confuse with single equals (assigns a value)!*)


2 + 2 == 4
2 + 2 == 5


(*
  If you use single equals by mistake, an error occurs:
*)
2 + 2 = 4



