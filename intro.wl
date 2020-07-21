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


(*
  These capital letters are all built-in functions/constants.
  Don't use them as variables!
*)
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


(* ::Section:: *)
(*Calculating stuff*)


(* ::Subsection:: *)
(*Arithmetic*)


(* ::Subsubsection:: *)
(*Addition (plus)*)


1 + 1
111 + 999
123456789 + 32109876


(* ::Subsubsection:: *)
(*Subtraction (hyphen)*)


1 - 1
111 - 999
123456789 - 32109876


(* ::Subsubsection:: *)
(*Multiplication (asterisk OR space)*)


(* The front end will display a grey times symbol if you just use a space. *)
1 * 1
111 999
123456789 32109876


(* ::Subsubsection:: *)
(*Division (slash)*)


1 / 1
111 / 999
123456789 / 32109876


(* ::Subsubsection:: *)
(*Power (caret)*)


1 ^ 1
2 ^ 100


(* ::Subsection:: *)
(*Use square brackets to apply a function*)


Sqrt[2]
Exp[3]
Log[3]
Cos[Pi]
Sin[0]
Cosh[0]
Sinh[1]


(* Use N to convert to approximate form *)
N[Sqrt[2]]
N[Exp[3]]
N[Log[3]]
N[Cos[Pi]]
N[Sin[0]]
N[Cosh[0]]
N[Sinh[1]]


(* Round brackets mean multiplication, NOT function application *)
Sin(Pi)    (* whoops: this is the constant 'Pi' multiplied by the built-in function 'Sin' *)
Sin[Pi]


(* ::Subsection:: *)
(*Exact input ==> Exact output*)
(*Approximate input ==> Approximate output*)


(* Exact vs approximate (1) *)
100 / 7
100 / 7.0


(* Exact vs approximate (2) *)
Sqrt[2]
Sqrt[2.]


(* Any approximate part will ruin the exactness of the whole expression *)
1 + Pi * Cos[111]
1. + Pi * Cos[111]


(* ::Subsection:: *)
(*Built-in constants (remember upper case first letter)*)


E
Pi
I
Infinity


E ^ (I * Pi) + 1


(* ::Subsection:: *)
(*Lists (curly brackets)*)


list = {"abc", -99, 50, 345.6789}


(* ::Subsubsection:: *)
(*Get the length*)


Length[list]


(* ::Subsubsection:: *)
(*Extract a part of a list (doubled square brackets)*)
(*NOTE: Mathematica uses 1-based indexing*)


list[[1]]
list[[2]]


(* Negative indices from the end *)
list[[-1]]


(* ::Section:: *)
(*Doing algebra*)


(* ::Subsection:: *)
(*Basic stuff*)


x^2 + x * x


(* Don't worry pure mathematicians, x == 0 is a removable singularity: *)
x / x
x^2 / x
x / Sqrt[x]


(* Mathematica isn't stupid, it can do calculus: *)
1 / 0
1 / Infinity
0 / 0
Infinity - Infinity
0 ^ 0


(* Mathematica can do algebra with anything, even strings and graphics: *)
3 + "Chuck Norris" ^ 4 / "Chuck Norris"


diskGraphic = Graphics[Disk[], ImageSize -> 100]
diskGraphic / diskGraphic


(* ::Section:: *)
(*Plotting stuff*)


(* ::Section:: *)
(*Don't use loops*)


(* ::Section:: *)
(*Matrix stuff*)


(* ::Section:: *)
(*Advanced stuff*)


(* ::Subsection:: *)
(*Everything is an expression*)


(* ::Subsection:: *)
(*Patterns*)


(* ::Subsection:: *)
(*Fibonacci sequence*)
