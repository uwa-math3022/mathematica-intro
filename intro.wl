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


E (* Base of natural exponential *)
Pi (* Circumference divided by diameter *)
I (* Imaginary unit *)
Infinity (* Positive infinity *)
ComplexInfinity (* Infinity in the complex plane with indeterminate argument *)


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


(* ::Subsection:: *)
(*Built-in goodies*)


(* ::Subsubsection:: *)
(*Expand*)


Expand[(1 + x)^6]


(* ::Subsubsection:: *)
(*Factorise*)


Factor[x^16 - 1]


(* ::Subsubsection:: *)
(*Partial fractions*)


Apart[1 / ((x^3 - 3 x) x^5)]


(* ::Subsubsection:: *)
(*Use FullSimplify when Mathematica is lazy*)


(x + 1)^3 == x^3 + 3 x^2 + 3 x + 1


FullSimplify[(x + 1)^3 == x^3 + 3 x^2 + 3 x + 1]


(* ::Subsubsection:: *)
(*Sometimes you need to tell Mathematica some assumptions*)


FullSimplify[Sqrt[x^2]]


FullSimplify[Sqrt[x^2], Assumptions -> x > 0]


(* ::Subsection:: *)
(*Calculus*)


(* ::Subsubsection:: *)
(*Differentiation*)


D[x^2, x]


D[Sin[x] ^ 100, x]


(* D takes partial derivatives *)
D[x y, x]
D[u v, x]


(* Use Dt for total derivatives *)
Dt[x y, x]
Dt[u v, x]


(* ::Subsubsection:: *)
(*Integration*)


(* Indefinite *)
Integrate[2 x^2 - x^1000, x]
Integrate[1/x, x]
Integrate[Sqrt[9 - Sqrt[x]], x]


(* Definite *)
Integrate[1/x, {x, 1, 2}]
Integrate[r^2 Sin[theta], {r, 0, rMax}, {theta, 0, Pi}, {phi, 0, 2 Pi}]


(* ::Subsubsection:: *)
(*Limits*)


Limit[Sin[x] / x, x -> 0]
Limit[Sin[x] / x, x -> Infinity]


Limit[(x^(1 + n) - 1) / (1 + n), n -> -1]


(* ::Subsubsection:: *)
(*Differential equations (remember to use double equals)*)


(* No initial conditions *)
DSolve[y''[x] + 4 y'[x] + 3 y[x] == 27 x^2, y[x], x]


DSolve[x^2 (1 + y''[x]) == y[x], y[x], x]


(* Initial conditions *)
DSolve[{y''[x] + 4 y'[x] + 3 y[x] == 27 x^2, y[0] == 1, y'[0] == 3}, y[x], x]


(* ::Subsubsection:: *)
(*Use DSolveValue to get the function rather than a rule list*)


DSolveValue[{y''[x] + 4 y'[x] + 3 y[x] == 27 x^2, y[0] == 1, y'[0] == 3}, y[x], x]


(* ::Section:: *)
(*Plotting stuff*)


(* ::Subsection:: *)
(*Plot a function*)


Plot[x^2 (1 - x), {x, 0, 1}]


(* ::Subsection:: *)
(*Plot multiple functions*)


(* Put the functions inside a list (curly brackets) *)
Plot[{Sin[x], 1 - x}, {x, 0, 2 Pi}]


(* ::Subsection:: *)
(*Options are key driven, specified using rules (->)*)


Plot[{Sin[x], 1 - x}, {x, 0, 2 Pi}
  , PlotLegends -> "Expressions"
  , PlotStyle -> {Directive[Red, Dashed], Black}
  , PlotRange -> {-2, 2}
]


(* ::Subsection:: *)
(*Plot a function of two variables*)


Plot3D[Sin[x] Cos[y], {x, 0, 2 Pi}, {y, 0, 2 Pi}]


(* ::Section:: *)
(*Don't use loops*)


(* ::Subsection:: *)
(*Use Table*)


(* ::Subsubsection:: *)
(*List some squares*)


Table[n ^ 2, {n, 1, 10}]


(* ::Subsubsection:: *)
(*Use step size 2*)


Table[n ^ 2, {n, 1, 10, 2}]


(* ::Subsubsection:: *)
(*Iterate over a list*)


list = {2, "blah", 3 + 4 I};
Table[n^2, {n, list}]


(* ::Subsection:: *)
(*Most operations are vectorised by default*)


(* ::Subsubsection:: *)
(*Vector with a scalar*)


{a, b, c} + 2
{a, b, c} * 2
{a, b, c} ^ 2


(* ::Subsubsection:: *)
(*Vector with a vector of the same length*)


{a, b, c} + {1, 2, 3}
{a, b, c} * {1, 2, 3}
{a, b, c} ^ {1, 2, 3}


(* ::Subsubsection:: *)
(*Compatible dimensions*)


{a, b, c} + {{1, 2, 3, 4}, {5}, {6, 7}}


(* Whoops! *)
{1, 2} + {3, 4, 5}


(* ::Subsection:: *)
(*Many built-in functions have the Listable attribute (automatic threading over lists)*)


Sqrt[{1, 2, 3, {4, 5}}]


list = Range[0, 1, 0.1]
Exp[list]


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
