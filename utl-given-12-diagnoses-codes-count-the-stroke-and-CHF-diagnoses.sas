Given 12 diagnoses codes count the stroke and CHF diagnoses

INPUT
=====

Stroke and CHF diagnoses codes (probably not but does not matter)

 ('I11','I20','I21','I22','I24','I25','I46','I47','I48','I49') or diags[i]=:'ROO1'


WORK.HAVE total obs=14  (Patients with codes)
                                               | RULES
 ID  DIAG1     DIAG2     DIAG3   ...   DIAG12  |
                                               |
  1 I82.4Z2    I11       I48.92  ...   R94.31  | 111 and 148 are in thec codes so count=2
  2 I82.4Z2    I10       I48.92        R94.31  |
  3 I67.82     I11.0     I50.23        R53.1   |
...

EXAMPLE OUTPUT
--------------

  ID    CNT    DIAGNS

   1     1     I48.92
   1     2     I11     Total=2

   2     1     I48.92
   2     2     I11.9   Total=2

   3     1     I11.0
   3     2     I48.2
   3     3     I25.10
   3     4     I49.3   Total=2


PROCESS
=======

data want(keep=id cnt diagns);
  retain id cnt 0;
  set have;
  id=_n_;
  array diags[12] $8 diag1-diag12;
  do i=1 to 12;
     if substr(diags[i],1,3) in
        ('I11','I20','I21','I22','I24','I25','I46','I47','I48','I49') or diags[i]=:'ROO1' then do
        diagns=diags[i];
        cnt=cnt+1;
        output;
     end;
  end;
  cnt=0;
run;quit;

*                _              _       _
 _ __ ___   __ _| | _____    __| | __ _| |_ __ _
| '_ ` _ \ / _` | |/ / _ \  / _` |/ _` | __/ _` |
| | | | | | (_| |   <  __/ | (_| | (_| | || (_| |
|_| |_| |_|\__,_|_|\_\___|  \__,_|\__,_|\__\__,_|

;


data have;
  input (diag1-diag12) ($);
cards4;
I82.4Z2 I10 I48.92 I45.6 I11.9 I34.0 I07.1 I37.1 R06.4 R06.02 R00.0 R94.31
I82.4Z2 I10 I48.92 I45.6 I11.9 I34.0 I07.1 I37.1 R06.4 R06.02 R00.0 R94.31
I67.82 I11.0 I50.23 I27.2 I48.2 I25.10 E11.9 I44.2 I70.0 R06.02 I49.3 R53.1
I48.92 I63.9 E11.9 I10 I48.91 E11.43 R94.31 I51.7 R06.02 I87.2 I12.0 E11.22
E11.649 I34.0 I10 I51.7 I05.9 E10.9 E11.22 I42.9 I13.0 I50.9 I25.10 I12.9
I71.2 I10 R94.31 R00.2 I47.2 I51.7 I34.0 I07.1 I37.1 I35.8 I49.9 I11.0
I71.2 I10 R94.31 R00.2 I47.2 I51.7 I34.0 I07.1 I37.1 I35.8 I49.9 I11.0
E11.65 I12.0 I25.10 I50.43 I42.9 I27.2 I50.33 I48.2 R94.31 E11.9 I13.2 I50.20
I63.9 I10 E11.9 I48.91 I07.1 I34.0 I27.2 I48.0 R09.81 R06.02 R00.0 R53.1
I63.9 I10 E11.9 I48.91 I07.1 I34.0 I27.2 I48.0 R09.81 R06.02 R00.0 R53.1
I26.99 R06.02 R53.1 R94.31 I13.0 I50.30 I69.351 E11.40 R53.2 I95.9 E11.22 I50.32
E11.65 I12.0 I25.10 I50.43 I42.9 I27.2 I50.33 I48.2 R94.31 E11.9 I13.2 I50.20
I26.99 R06.02 R53.1 R94.31 I13.0 I50.30 I69.351 E11.40 R53.2 I95.9 E11.22 I50.32
E11.65 I12.0 I25.10 I50.43 I42.9 I27.2 I50.33 I48.2 R94.31 E11.9 I13.2 I50.20
;;;;
run;quit;




