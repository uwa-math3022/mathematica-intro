#!/usr/bin/env wolframscript
(* ::Package:: *)

(*
  Convert "intro.wl" to "intro.nb".
  The problem with a direct "Save As" is that .wl cells are "Code" cells,
  which are initialisation cells (and trigger the "evaluate all
  initialisation cells" prompt, which is annoying).
  To avoid this, we do the following:
  1. Save "intro.wl" to "intro.nb"
  2. Convert "Code" cells to "Normal" cells
  3. Overwrite "intro.nb"
*)
Module[
  {
    currentDirectoryFileName,
    wlName, wlNotebook,
    nbName, nbNotebook, nbNotebookRaw,
    dummyForTrailingCommas
  },
  currentDirectoryFileName[name_] :=
    FileNameJoin @ {NotebookDirectory[], name};
  wlName = currentDirectoryFileName["intro.wl"];
  nbName = currentDirectoryFileName["intro.nb"];
  (* 1. Save "intro.wl" to "intro.nb" *)
  wlNotebook = NotebookOpen[wlName];
  NotebookSave[wlNotebook, nbName, Interactive -> True];
  NotebookClose[wlNotebook];
  (*
    NOTE: NotebookSave doesn't quite work from ".wl" files.
    Manually choose the file type ".nb" and press Save.
  *)
  (* 2. Convert "Code" cells to "Normal" cells *)
  nbNotebook = NotebookOpen[nbName];
  nbNotebookRaw = NotebookGet[nbNotebook];
  NotebookClose[nbNotebook];
  nbNotebookRaw =
    nbNotebookRaw /. Cell[content__, "Code"] :> Cell[content, "Input"];
  (* 3. Overwrite "intro.nb" *)
  NotebookSave[nbNotebookRaw, nbName];
  nbNotebook = NotebookOpen[nbName];
  NotebookClose[nbNotebook];
]
