@echo off

REM Generate and display predicate tree for supplied root predicate id using supplied connection string
REM usage: ShowTree <RootId> <ConnectionString>
REM e.g: ShowTree 489501F4-F170-48A6-9FE1-180165A37F1B "Data Source=localhost;Initial Catalog=GraphVizDebugging;Integrated Security=True"

TreeVisualiser\bin\Debug\TreeVisualiser.exe %* | dot -Tpng > out.png
start out.png
