#%T##########################################################################
##
#W  io.tst
#Y  Copyright (C) 2014
##
##  Licensing information can be found in the README file of this package.
##
#############################################################################
##
gap> START_TEST("Digraphs package: io.tst");
gap> LoadPackage("digraphs", false);;

#
gap> DIGRAPHS_StartTest();

#T# DigraphFromGraph6String amd Graph6String
gap> DigraphFromGraph6String("?");
<digraph with 0 vertices, 0 edges>
gap> DigraphFromGraph6String("E?A?");
<digraph with 6 vertices, 2 edges>
gap> DigraphFromGraph6String("@");
<digraph with 1 vertex, 0 edges>
gap> gr := Digraph(300, [1, 2], [2, 1]);
<digraph with 300 vertices, 2 edges>
gap> str := Graph6String(gr);;
gap> DigraphFromGraph6String(str) = gr;
true
gap> gr := Digraph([[2], [1, 4], [5], [2], [3]]);
<digraph with 5 vertices, 6 edges>
gap> str := Graph6String(gr);
"DaG"
gap> DigraphFromGraph6String(str);
<digraph with 5 vertices, 6 edges>
gap>  l := ["BW", "C]", "DQw", "ECO_", "FCZUo", "GCZenS", "HCQTndn",
> "H?qcyxf"];;
gap> List(l, x -> DigraphFromGraph6String(x));
[ <digraph with 3 vertices, 4 edges>, <digraph with 4 vertices, 8 edges>, 
  <digraph with 5 vertices, 10 edges>, <digraph with 6 vertices, 6 edges>, 
  <digraph with 7 vertices, 20 edges>, <digraph with 8 vertices, 30 edges>, 
  <digraph with 9 vertices, 38 edges>, <digraph with 9 vertices, 34 edges> ]

# ReadDigraphs
gap> str := Concatenation(DIGRAPHS_Dir(), "/data/graph5.g6.gz");;
gap> list := ReadDigraphs(str);;
gap> Size(list);
34

#T# DigraphFromSparse6String and Sparse6String
gap> DigraphFromSparse6String(Concatenation(":[___dCfEcdFjCIideLhIfJ",
>                                           "kLgkQge`RSbPTaOTbMNaS`QY"));
<digraph with 28 vertices, 84 edges>
gap> DigraphFromSparse6String(":I`ACWqHKhhccTF");
<digraph with 10 vertices, 30 edges>
gap> DigraphFromSparse6String(":U___gFecGdHcEdFcFdE`GHbILaJKbNaM`RS");
<digraph with 22 vertices, 66 edges>
gap> DigraphFromSparse6String(":U___fEcdcdIeHfGcFdE`GHbILaJKbNaM`RS");
<digraph with 22 vertices, 66 edges>
gap> DigraphFromSparse6String(":U___fEcdGcdeJfIcFdEbLNaKM`H`GbIRaJQ");
<digraph with 22 vertices, 66 edges>
gap> gr := Digraph([[2], [1, 4], [5], [2], [3]]);
<digraph with 5 vertices, 6 edges>
gap> str := Sparse6String(gr);
":Dapj"
gap> DigraphFromSparse6String(str);
<digraph with 5 vertices, 6 edges>
gap> gr := Digraph(231, [1, 1, 3, 4], [3, 4, 1, 1]);
<digraph with 231 vertices, 4 edges>
gap> str := Sparse6String(gr);
":~?Bf_O?_F"
gap> DigraphFromSparse6String(str);
<digraph with 231 vertices, 4 edges>
gap> gr := Digraph(rec(nrvertices := 2 ^ 17, source := [1, 1, 3, 4, 10, 100],
> range := [3, 4, 1, 1, 100, 10]));
<digraph with 131072 vertices, 6 edges>
gap> str := Sparse6String(gr);
":~_??_?A???_??_@b??H"
gap> DigraphFromSparse6String(str);
<digraph with 131072 vertices, 6 edges>

#T# DigraphFromDigraph6String and Digraph6String
gap> gr := Digraph([[5], [1, 2, 5], [1], [2], [4]]);
<digraph with 5 vertices, 7 edges>
gap> str := Digraph6String(gr);
"+DWg?[?"
gap> DigraphFromDigraph6String(str);
<digraph with 5 vertices, 7 edges>
gap> gr := Digraph(231, [1 .. 100], [1 .. 100] * 0 + 200);
<digraph with 231 vertices, 100 edges>
gap> str := Digraph6String(gr);;
gap> DigraphFromDigraph6String(str);
<digraph with 231 vertices, 100 edges>

#T# DigraphFromDiSparse6String and DiSparse6String
gap> gr := Digraph([[1, 4], [2, 3, 4], [2, 4], [2]]);
<digraph with 4 vertices, 8 edges>
gap> str := DiSparse6String(gr);
".CgXoHe@J"
gap> DigraphFromDiSparse6String(str) = gr;
true
gap> gr := Digraph(rec(nrvertices := 1617, source := [1 .. 100],
> range := Concatenation([1 .. 50], [1 .. 50] * 0 + 51)));
<digraph with 1617 vertices, 100 edges>
gap> str := DiSparse6String(gr);;
gap> DigraphFromDiSparse6String(str) = gr;
true
gap> gr := Digraph(rec(nrvertices := 2 ^ 17, source := [1 .. 100],
> range := Concatenation([50 .. 98], [-1050 .. -1000] * - 1)));
<digraph with 131072 vertices, 100 edges>
gap> str := DiSparse6String(gr);;
gap> DigraphFromDiSparse6String(str) = gr;
true
gap> gr := Digraph([[1, 1, 4], [2, 3, 4], [2, 4], [2]]);
<multidigraph with 4 vertices, 9 edges>
gap> str := DiSparse6String(gr);
".CgXo?eWCn"
gap> gr = DigraphFromDiSparse6String(str);
true
gap> gr := Digraph(rec(nrvertices := 7890, source := [1 .. 100] * 0 + 1000,
> range := [1 .. 100] * 0 + 2000));
<multidigraph with 7890 vertices, 100 edges>
gap> str := DiSparse6String(gr);;
gap> gr = DigraphFromDiSparse6String(str);
true

#T# WriteDigraphs and ReadDigraphs
gap> gr := [];;
gap> gr[1] := Digraph(2 ^ 16, [1, 1, 3, 4, 7, 10, 100],
> [3, 4, 1, 1, 3, 100, 10]);
<digraph with 65536 vertices, 7 edges>
gap> gr[2] := Digraph(1000,
> [1 .. 1000],
> Concatenation([2 .. 1000], [1]));
<digraph with 1000 vertices, 1000 edges>
gap> gr[3] := Digraph([[1, 1, 4], [2, 3, 4], [2, 4], [2], [1, 3, 3, 5]]);
<multidigraph with 5 vertices, 13 edges>
gap> filename := Concatenation(DIGRAPHS_Dir(), "/tst/out/test.ds6");;
gap> WriteDigraphs(filename, gr);
gap> ReadDigraphs(filename);
[ <digraph with 65536 vertices, 7 edges>, 
  <digraph with 1000 vertices, 1000 edges>, 
  <multidigraph with 5 vertices, 13 edges> ]
gap> gr[1] := Digraph([[5], [1, 2, 5], [1], [2], [4]]);
<digraph with 5 vertices, 7 edges>
gap> gr[2] := Digraph(rec(nrvertices := 105, source := [1 .. 100],
> range := [1 .. 100] * 0 + 52));
<digraph with 105 vertices, 100 edges>
gap> gr[3] := EmptyDigraph(0);
<digraph with 0 vertices, 0 edges>
gap> gr[4] := Digraph([[6, 7], [6, 9], [1, 3, 4, 5, 8, 9],
> [1, 2, 3, 4, 5, 6, 7, 10], [1, 5, 6, 7, 10], [2, 4, 5, 9, 10],
> [3, 4, 5, 6, 7, 8, 9, 10], [1, 3, 5, 7, 8, 9], [1, 2, 5], [1, 2]]);
<digraph with 10 vertices, 47 edges>
gap> filename := Concatenation(DIGRAPHS_Dir(), "/tst/out/test.d6");;
gap> WriteDigraphs(filename, gr);
gap> ReadDigraphs(filename);
[ <digraph with 5 vertices, 7 edges>, <digraph with 105 vertices, 100 edges>, 
  <digraph with 0 vertices, 0 edges>, <digraph with 10 vertices, 47 edges> ]
gap> filename := Concatenation(DIGRAPHS_Dir(), "/tst/out/test.txt");;
gap> WriteDigraphs(filename, gr);
gap> ReadDigraphs(filename); # Note that some edges in gr[2] are lost
[ <digraph with 5 vertices, 7 edges>, <digraph with 100 vertices, 100 edges>, 
  <digraph with 0 vertices, 0 edges>, <digraph with 10 vertices, 47 edges> ]
gap> gr := [];;
gap> gr[1] := Digraph(30, [1, 2], [2, 1]);
<digraph with 30 vertices, 2 edges>
gap> gr[2] := Digraph([[2], [1, 4], [5], [2], [3]]);
<digraph with 5 vertices, 6 edges>
gap> gr[3] := Digraph([[2], [1]]);
<digraph with 2 vertices, 2 edges>
gap> filename := Concatenation(DIGRAPHS_Dir(), "/tst/out/test.g6");;
gap> WriteDigraphs(filename, gr);
gap> rdgr := ReadDigraphs(filename);;
gap> gr = rdgr;
true
gap> gr[3] := Digraph([[1, 2], [1, 2]]);
<digraph with 2 vertices, 4 edges>
gap> filename := Concatenation(DIGRAPHS_Dir(), "/tst/out/test.s6");;
gap> WriteDigraphs(filename, gr);
gap> rdgr := ReadDigraphs(filename);;
gap> gr = rdgr;
true

#T# WritePlainTextDigraph and ReadPlainTextDigraph
gap> gr := Digraph([[1, 2], [2, 3], []]);
<digraph with 3 vertices, 4 edges>
gap> filename := Concatenation(DIGRAPHS_Dir(), "/tst/out/plain.txt");;
gap> WritePlainTextDigraph(1, 2, 3, 4);
Error, Digraphs: WritePlainTextDigraph: usage,
WritePlainTextDigraph(filename, digraph, delimiter, offset),
gap> WritePlainTextDigraph(".", gr, ",", -2);
Error, Digraphs: WritePlainTextDigraph:
can not open file .,
gap> WritePlainTextDigraph(filename, gr, ',', -3);
gap> WritePlainTextDigraph(filename, gr, ",", -1);
gap> ReadPlainTextDigraph(1, 2, 3, 4);
Error, Digraphs: ReadPlainTextDigraph: usage,
ReadPlainTextDigraph(filename, delimiter, offset, ignore),
gap> ReadPlainTextDigraph(filename, ",", 1, ['i', 'd']);
<digraph with 3 vertices, 4 edges>
gap> ReadPlainTextDigraph(filename, ',', 1, 'i');
<digraph with 3 vertices, 4 edges>
gap> last = gr;
true

#E#
gap> STOP_TEST("Digraphs package: io.tst");