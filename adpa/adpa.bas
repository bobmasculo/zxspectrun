10 GO SUB 520
20 GO SUB 410
30 LET f=19: LET g=4: LET n1=10+INT (RND*7): LET n2=27-n1: LET n3=21: LET n4=0: LET q=0: PRINT AT f,g;"\b";AT f-1,g;"\a"
40 REM *** ADPA
50 IF ATTR (f,g+1)=6 OR ATTR (f,g-1)=6 THEN GO TO 310
60 LET k$=INKEY$
70 IF k$="o" AND g>1 THEN LET g=g-1: PRINT AT f,g;"\j ";AT f-1,g;"\i ": BEEP .008,10
80 IF k$="p" AND g<31 THEN PRINT AT f,g;" \g";AT f-1,g;" \f": LET g=g+1: BEEP .008,10
90 IF k$="q" AND ATTR (f-3,g)=5 THEN PRINT AT f,g;" ";AT f-1,g;" ": LET f=f-4: PRINT AT f,g;"\b";AT f-1,g;"\a": BEEP .008,20: IF f=3 THEN LET f=4: PRINT AT f,g;"\b";AT f-1,g;"\a";AT f-2,g;" "
100 IF k$="a" AND ATTR (f+1,g)=5 THEN PRINT AT f,g;" ";AT f-1,g;" ": LET f=f+4: PRINT AT f,g;"\b";AT f-1,g;"\a": BEEP .008,30: IF f=8 THEN LET f=7
110 IF k$=" " AND ATTR (f-2,g)<>4 THEN PRINT AT f,g;" ": LET f=f-1: PRINT AT f,g;"\b";AT f-1,g;"\a": BEEP .008,20: FOR i=1 TO 2: GO SUB 150: NEXT i: LET f=f+1: PRINT AT f-2,g;" ": PRINT AT f,g;"\b";AT f-1,g;"\a"
120 IF ATTR (f+1,g)=0 THEN PRINT AT f+1,g;"\t";AT f,g;"\u";AT f-1,g;" ": GO TO 350
125 IF ATTR (f-2,g)=3 THEN PRINT AT f-2,g; INK 7;" ": LET q=q+1: LET score=score+100: FOR n=1 TO 6: BEEP 0.025,5*n: NEXT n
130 LET i=0
140 REM *** snakes
150 IF ATTR (f,g)=2 THEN GO TO 350
160 IF ATTR (f+1,g)=2 THEN LET score=score+50: FOR n=1 TO 3: BEEP 0.05,5*n: NEXT n
170 IF n1>0 THEN PRINT INK 2; PAPER 0;AT 7,n1;" \h": LET n1=n1+1
180 IF n1=29 THEN LET n2=n1: PRINT AT 7,n1;"  ": LET n1=0
190 IF n2>0 THEN PRINT INK 2; PAPER 0;AT 11,n2;"\c ": LET n2=n2-1
200 IF n2=1 AND n2>0 THEN LET n3=n2: PRINT AT 11,n2;"  ": LET n2=0
210 IF n3>0 THEN PRINT INK 2; PAPER 0;AT 15,n3;" \h": LET n3=n3+1
220 IF n3=29 THEN LET n4=n3: PRINT AT 15,n3;"  ": LET n3=0
230 IF n4>0 THEN PRINT INK 2; PAPER 0;AT 19,n4;"\c ": LET n4=n4-1
240 IF n4=1 AND n4>0 THEN LET n1=1: PRINT AT 19,n4;"  ": LET n4=0
250 IF i>0 THEN RETURN 
260 IF ATTR (f,g)=2 THEN GO TO 350
270 REM *** Marcadores
280 PRINT INK 6;AT 0,6;score
290 GO TO 50
300 REM *** Resgata torresmo
310 FOR n=1 TO 2*q: PRINT INK 2; PAPER 0; OVER 1;AT 2,j+1;"\o": BEEP 0.05,n: NEXT n: LET score=score+1000+(250*q): LET l=l+1
320 IF l>10 THEN LET l=1
330 GO TO 20
340 REM *** Uma vida menos
350 FOR n=2 TO 8: BEEP .05,30+n: NEXT n: LET h=h-1: IF h<0 THEN GO TO 380
360 GO TO 20
370 REM *** Game Over
380 PRINT AT 10,10;" GAME OVER ": FOR n=30 TO -20 STEP -1: BEEP .01,20: BEEP .008,n+30: NEXT n
390 CLS : GO TO 10
400 REM *** LEVEL
410 INK 7: PAPER 0: BORDER 0: CLS 
420 PRINT INK 0; PAPER 0;AT 5,0;c$;AT 8,0;c$;AT 12,0;c$;AT 16,0;c$;AT 20,0;c$
430 PRINT INK 4; PAPER 0;AT 5,2;s$;AT 8,0;s$;AT 12,3;s$;AT 16,0;s$;AT 20,3;s$
435 FOR n=1 TO 5: PRINT INK 3; PAPER 0;AT 9,RND*24+4;"\p";AT 13,RND*24+4;"\p";AT 17,RND*24+4;"\p": NEXT n
440 LET j=RND*24+4: PRINT INK 6; PAPER 0;AT 3,j;" \d ";AT 4,j;" \e "
450 LET r=RND*23+4: PRINT INK 5; PAPER 0;AT 4,r;" ";AT 5,r;"\r";AT 6,r;"\q"
460 LET r=RND*23+4: PRINT INK 5; PAPER 0;AT 8,r;"\r";AT 9,r;"\q";AT 10,r;"\q"
470 LET r=RND*23+4: PRINT INK 5; PAPER 0;AT 12,r;"\r";AT 13,r;"\q";AT 14,r;"\q"
480 LET r=RND*23+4: PRINT INK 5; PAPER 0;AT 16,r;"\r";AT 17,r;"\q";AT 18,r;"\q"
490 PRINT INK 6;AT 0,0;"SCORE:";score;AT 0,15;"LIVES:";h;AT 0,24;"LEVEL:";l
500 RETURN 
510 REM DATOS
520 RESTORE 540: FOR n=0 TO 167: READ d: POKE USR "a"+n,d: NEXT n
530 LET pts=1000: LET z=0: LET score=0: LET h=2: LET l=1: LET s$="\l\k\n\k\n\k\k\k\k\k\n\k\k\k\n\k\k\n\k\k\k\k\n\k\k\n\k\m": LET c$="                                "
540 DATA 0,60,126,189,102,189,24,126
550 DATA 189,153,60,126,102,66,195,0
560 DATA 112,220,126,3,30,120,195,126
570 DATA 0,28,54,70,46,22,26,60
580 DATA 120,120,24,60,60,126,126,36
590 DATA 0,56,84,190,92,168,24,60
600 DATA 52,91,88,60,28,26,114,67
610 DATA 14,59,126,192,120,30,195,126
620 DATA 0,28,42,125,58,21,24,60
630 DATA 44,218,26,60,56,88,78,194
640 DATA 255,16,96,12,4,7,96,255
650 DATA 127,144,160,140,128,135,224,127
660 DATA 254,17,65,9,1,71,97,254
670 DATA 255,64,6,24,0,0,96,255
680 DATA 36,126,223,255,126,60,24,0
690 DATA 36,90,36,36,90,44,8,8
700 DATA 16,8,16,8,16,8,16,8
710 DATA 255,72,17,8,144,8,16,255
720 DATA 255,16,96,12,4,7,96,255
730 DATA 126,153,189,189,165,189,213,171
740 DATA 129,66,66,102,126,60,24,60
750 REM *** INTRO
760 PAPER 0: INK 7: BORDER 0: CLS : PRINT "                                ": PRINT "                                ": PRINT INK 4;"        *Atoa na ADAPA*         ": PRINT "                                ": PRINT INK 3;"       Save o Torresmo da       ": PRINT INK 3;"          evil ADAPA           ": PRINT "                                ": PRINT "            Q : UP              ": PRINT "            A : DOWN            ": PRINT "            O : LEFT            ": PRINT "            P : RIGHT           ": PRINT "        SPACE : JUMP            ": PRINT "                                ": PRINT "                                ": PRINT INK 5;"           by R Martincic          ": PRINT INK 5;"        for ZX Spectrum         ": PRINT INK 5;"        BASIC  2017         ": PRINT "                                ": PRINT "                                ": PRINT FLASH 1;"    Press any key to START      "
770 PAUSE 0
780 RETURN 
