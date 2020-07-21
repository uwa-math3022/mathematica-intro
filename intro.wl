(* ::Package:: *)

(* ::Title:: *)
(*Introduction to Mathematica*)


(* ::Section:: *)
(*Resources*)


(*
  Press F1 for help (unless you're on a Raspberry Pi, in which case bad luck).
  If you highlight a built-in function and press F1,
  it will take you straight to the documentation page.
*)


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
(*Clear all variables*)


ClearAll["Global`*"]


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


(* Compare *)
sin[Pi]
Sin[Pi]


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
f[2]
f[100]


(* ::Subsubsection:: *)
(*Difference between Set (equals) and SetDelayed (colon equals)*)


(*
  Set (equals) evaluates the RHS immediately.
  Notice how 'alreadyDefinedVariable' on the RHS below
  is NOT green like 'alreadyDefinedVariable' the LHS:
*)
alreadyDefinedVariable = 3;
f[alreadyDefinedVariable_] = alreadyDefinedVariable^2


(* This gives unexpected behaviour: *)
f[2]
f[100]


(*
  SetDelayed (colon equals) doesn't evaluate the RHS until the function is called.
  Notice how 'alreadyDefinedVariable' on the RHS below
  IS green like 'alreadyDefinedVariable' the LHS
  (it's part of the same local scope):
*)
alreadyDefinedVariable = 3;
f[alreadyDefinedVariable_] := alreadyDefinedVariable^2


(* That's better: *)
f[2]
f[100]


(* ::Subsection:: *)
(*Comparing values (==)*)


(* ::Subsubsection:: *)
(*Equal (double equals): compare two values*)
(*Do NOT confuse with single equals (assigns a value)!*)


2 + 2 == 4
2 + 2 == 5


(*
  If you use single equals by mistake, an error occurs
  when Mathematica tries to assign the value 4 to the expression '2 + 2':
*)
2 + 2 = 4


(* ::Section:: *)
(*Calculating stuff*)


(* ::Subsection:: *)
(*Arithmetic*)


(* ::Subsubsection:: *)
(*Addition (plus)*)


3 + 4
111 + 999
123456789 + 32109876


(* ::Subsubsection:: *)
(*Subtraction (hyphen)*)


3 - 4
111 - 999
123456789 - 32109876


(* ::Subsubsection:: *)
(*Multiplication (asterisk OR space)*)


(* The front end will display a grey times symbol if you just use a space. *)
3 * 4
111 999
123456789 32109876


(* ::Subsubsection:: *)
(*Division (slash)*)


3 / 4
111 / 999
123456789 / 32109876


(* ::Subsubsection:: *)
(*Power (caret)*)


3 ^ 4
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


(* ::Subsection:: *)
(*Use N to convert to approximate form*)


N[Sqrt[2]]
N[Exp[3]]
N[Log[3]]
N[Cos[Pi]]
N[Sin[0]]
N[Cosh[0]]
N[Sinh[1]]


(* ::Subsection:: *)
(*Round brackets mean multiplication, NOT function application*)


Sin(Pi)  (* whoops: this is the constant 'Pi' multiplied by the built-in function 'Sin' *)
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


(* A thousand digits of pi *)
N[Pi, 1000]


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


sSolution = DSolveValue[{x''[t] == a, x[0] == 0, x'[0] == u}, x[t], t];
Expand[sSolution]


(* ::Subsection:: *)
(*Normal equation solving*)


(* ::Subsubsection:: *)
(*Quadratic*)


Solve[a x^2 + b x + c == 0, x]


(* ::Subsubsection:: *)
(*Systems*)


Solve[{2 x + 8 y == 0, x^2 - 3 y^2 == 1}, {x, y}]


(* ::Subsubsection:: *)
(*Solve is meant for exact/symbolic coefficients. Don't use Solve for approximate coefficients!*)


(* With approximate coordinates, Mathematica will give a warning *)
Solve[{2.2 x + 8 y == 0, x^2 - 3 y^2 == 1}, {x, y}]


(* ::Subsubsection:: *)
(*For approximate coefficients use numerical root finding instead*)


xInitialGuess = 1;
yInitialGuess = 0;
FindRoot[{2.2 x + 8 y == 0, x^2 - 3 y^2 == 1}, {{x, xInitialGuess}, {y, yInitialGuess}}]


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
(*Options are key driven, specified using rules (hyphen right-angle-bracket)*)


Plot[{Sin[x], 1 - x}, {x, 0, 2 Pi}
  , PlotLegends -> "Expressions"
  , PlotStyle -> {Directive[Red, Dashed], Black}
  , PlotRange -> {-2, 2}
]


(* ::Subsection:: *)
(*Plot a function of two variables*)


Plot3D[Sin[x] Sin[y], {x, 0, 2 Pi}, {y, 0, 2 Pi}]


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
(*Use Sum*)


(* ::Subsubsection:: *)
(*Add some integers*)


Sum[n, {n, 1, 100}]


(* ::Subsubsection:: *)
(*Make an expression with steps of 2*)


Sum[term[n], {n, 1, 10, 2}]


(* ::Subsubsection:: *)
(*Mathematica is smart*)


Sum[1 / n^2, {n, 1, Infinity}]


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


(* ::Subsection:: *)
(*A matrix is simply a list of lists*)


mat = {{1, 2}, {3, 4}}


(* ::Subsection:: *)
(*Pretty formatting (but don't do operations with the formatted version)*)


MatrixForm[mat]


(* ::Subsection:: *)
(*Built-in functions*)


(* Determinant *)
Det[mat]


Eigenvalues[mat]


Eigenvectors[mat]


Inverse[mat]


(* ::Subsection:: *)
(*Matrix multiplication (dot)*)


(* ::Subsubsection:: *)
(*Dot product*)


{a1, a2, a3, a4} . {b1, b2, b3, b4}


(* ::Subsubsection:: *)
(*Matrix multiplication*)


mm = Table[a[i, j], {i, 3}, {j, 3}];
vv = {x, y, z};


MatrixForm[mm]


matrixProduct = mm . vv


MatrixForm[matrixProduct]


(* ::Section:: *)
(*Advanced stuff*)


(* ::Subsection:: *)
(*Everything is an expression*)


(*
  Mathematica tries to be as general as possible.
  As we have seen above, you an do algebra on strings and graphics.
  Everything is an "expression" with the following representation:
    f[x, y, ...]
  The 'f' part is called the 'Head'.
*)


(* ::Subsubsection:: *)
(*Use FullForm to see the internal representation of an expression*)


FullForm[x + y + z]
FullForm[a b]
FullForm[x ^ n]
FullForm[1 -> 2]
FullForm[expr1 == expr2]
FullForm[{x, y, z}]


FullForm[a x^2 + b x + c]
(*
  Alternatively, you can see how an expression is built up by either
  (a) repeatedly clicking an expression, or
  (b) pressing [Ctrl + .]
  both of which extend the selection according to how the expression is structured.
*)


(* ::Subsubsection:: *)
(*Use Head to see the 'Head' part of the expression*)


Head[x + y + z]
Head[a b]
Head[x ^ n]
Head[1 -> 2]
Head[expr1 == expr2]
Head[{x, y, z}]


(* ::Subsubsection:: *)
(*Everything has a Head*)


Head[1]
Head[1.2]
Head[3 + 4 I]
Head["Boaty McBoatface"]


Head[x]
Head[Head]


(* ::Subsection:: *)
(*Distributing functions*)


(* ::Subsubsection:: *)
(*Apply (@@): replace the head by a function*)


Apply[newFun, oldFun[a, b, c, d]]


Apply[Plus, {a, b, c, d}]


(* Shorthand *)
Plus @@ {a, b, c, d}


(* ::Subsubsection:: *)
(*Map (/@): apply a function to elements at the first level*)


Map[fun, {a, b, c, d}]


(* Shorthand *)
fun /@ {a, b, c, d}


(* ::Subsubsection:: *)
(*Through: distribute operators inside a head*)


Through[grouping[fun1, fun2, fun3, fun4][x]]


Through[{fun1, fun2, fun3, fun4}[x]]


(* ::Subsection:: *)
(*Alternate notations for applying functions*)


(* ::Subsubsection:: *)
(*Prefix form (square brackets)*)


fun[x]


(* ::Subsubsection:: *)
(*Postfix form (double slash)*)


x // fun


(*
  This is useful for post-processing.
  E.g. suppose you have a large exact expression,
  and after a while you want to display its numerical value.
  Rather than wrapping it inside, like N[...],
  simply append // N to it:
*)
(1 + Sqrt[2]) (1 + Sqrt[3]) (1 + Sqrt[4]) / Exp[3] // N


(* ::Subsubsection:: *)
(*Infix form for multiple arguments (tildes)*)


x1 ~ fun ~ x2


(* ::Subsection:: *)
(*Patterns I: basics*)


expressionList = {a, b, "ccc", 1, 2, 3.5, fun[4], fun[5], aaa[aaa], 3[3], 3 + Sqrt[5]}


(* ::Subsubsection:: *)
(*Match a specific expression*)


Cases[expressionList, 2]


(* ::Subsubsection:: *)
(*Blank (underscore) matches anything*)


Cases[expressionList, _]


(* ::Subsubsection:: *)
(*Match expressions of the form x[y]*)


Cases[expressionList, _[_]]


(* ::Subsubsection:: *)
(*Match expressions of the form x[y] where x equals y*)


Cases[expressionList, x_[y_] /; x == y]


(* ::Subsubsection:: *)
(*Match expressions with a specific Head*)


Cases[expressionList, _Integer]
Cases[expressionList, _String]


(* ::Subsection:: *)
(*Patterns II: sequences*)


listOfLists = {
  {1},
  {1, 2, 3},
  {4, 5, "xx", "yyy"},
  {-99, -999, "aaa", Cosh[1]},
  {"This is a string."},
  {}
};


(* ::Subsubsection:: *)
(*Lists containing 1 expression: use Blank (underscore)*)


Cases[listOfLists, {_}]


(* ::Subsubsection:: *)
(*Lists containing 1 or more expressions: use BlankSequence (double underscore)*)


Cases[listOfLists, {__}]


(* ::Subsubsection:: *)
(*Lists containing 0 or more expressions: use BlankNullSequence triple underscore)*)


Cases[listOfLists, {___}]


(* ::Subsubsection:: *)
(*Lists containing 0 or more integers*)


Cases[listOfLists, {___Integer}]


(* ::Subsubsection:: *)
(*Lists containing 0 or more integers, followed by 1 or more strings*)


Cases[listOfLists, {___Integer, __String}]


(* ::Subsection:: *)
(*ReplaceAll (slash dot)*)


expressionList = {a, b, "ccc", 1, 2, 3.5, fun[4], fun[5], aaa[aaa], 3[3], 3 + Sqrt[5]}


(* ::Subsubsection:: *)
(*Apply a list of replacement rules*)


expressionList /. {fun -> "FUNNY"}


(* ::Subsubsection:: *)
(*Replace expressions of the form g[s] with g[s^2]*)


expressionList /. {g_[s_] -> g[s^2]}


(*
  Notice how s on the RHS is not green (not set to any value yet).
  This is because Rule (->) evaluates the RHS immediately.
  The above won't work as intended if s is already defined:
*)
s = 100;
expressionList /. {g_[s_] -> g[s^2]}


(*
  Use RuleDelayed (:>) instead of Rule (->) to locally scope s.
  RHS is not evaluated until the match is found.
  Notice how s on the RHS is now also green:
*)
s = 100;
expressionList /. {g_[s_] :> g[s^2]}
