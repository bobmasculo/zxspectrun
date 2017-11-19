umVars EQU 19

   CALL AllocateVars

Line10:                                ; GO SUB 520
Line20:                                ; GO SUB 410
Line30:                                ; LET f=19
   LD   DE,4864
   CALL StackShortInt                  ; Stack Signed Word (19)

   LD   DE,(Var_f)                     ; Address the var in VARS area
   CALL UpdateNumVar


Line30_1:                              ; LET g=4
   LD   DE,1024
   CALL StackShortInt                  ; Stack Signed Word (4)

   LD   DE,(Var_g)                     ; Address the var in VARS area
   CALL UpdateNumVar


Line30_2:                              ; LET n1=10+INT (RND*7)
   LD   DE,2560
   CALL StackShortInt                  ; Stack Signed Word (10)

   CALL RNDReplacement                 ; Call the new RND Function.

   LD   DE,1792
   CALL StackShortInt                  ; Stack Signed Word (7)

   CALL GetTwoStackedNumbers
   CALL $30CA                          ; [ROM] Call the Multiplication routine.
   CALL ReclaimStackItem

   CALL GetStackedNumber
   CALL $36AF                          ; [ROM] Call the INT routine.

   CALL GetTwoStackedNumbers
   CALL $3014                          ; [ROM] Call the Addition routine.
   CALL ReclaimStackItem

   LD   DE,(Var_n1)                    ; Address the var in VARS area
   CALL UpdateNumVar


Line30_3:                              ; LET n2=27-n1
   LD   DE,6912
   CALL StackShortInt                  ; Stack Signed Word (27)

   LD   HL,(Var_n1)                    ; Address the var in VARS area
   CALL StackNumericVar

   CALL GetTwoStackedNumbers
   CALL $300F                          ; [ROM] Call the Subtraction routine.
   CALL ReclaimStackItem

   LD   DE,(Var_n2)                    ; Address the var in VARS area
   CALL UpdateNumVar


Line30_4:                              ; LET n3=21
   LD   DE,5376
   CALL StackShortInt                  ; Stack Signed Word (21)

   LD   DE,(Var_n3)                    ; Address the var in VARS area
   CALL UpdateNumVar


Line30_5:                              ; LET n4=0
   LD   DE,0
   CALL StackShortInt                  ; Stack Signed Word (0)

   LD   DE,(Var_n4)                    ; Address the var in VARS area
   CALL UpdateNumVar


Line30_6:                              ; LET q=0
   LD   DE,0
   CALL StackShortInt                  ; Stack Signed Word (0)

   LD   DE,(Var_q)                     ; Address the var in VARS area
   CALL UpdateNumVar


Line30_7:                              ; PRINT AT f,g;"‘";AT f-1,g;""
Line40:                                ; REM ***adpa
Line50:                                ; IF ATTR (f,g+1)=6 OR ATTR (f,g-1)=6 THEN GO TO 310
   JP Line54

Line60:                                ; LET k$=INKEY$
   LD   DE,(Var_k_str)                 ; Address the var in VARS area
   LD   BC,Var_k_str
   PUSH BC
   CALL UpdateStrVar


Line70:                                ; IF k$="o" AND g>1 THEN LET g=g-1
   LD   HL,(Var_g)                     ; Address the var in VARS area
   CALL StackNumericVar

   LD   DE,256
   CALL StackShortInt                  ; Stack Signed Word (1)

   CALL GetTwoStackedNumbers
   CALL $300F                          ; [ROM] Call the Subtraction routine.
   CALL ReclaimStackItem

   LD   DE,(Var_g)                     ; Address the var in VARS area
   CALL UpdateNumVar


Line70_1:                              ; PRINT AT f,g;"™ ";AT f-1,g;"˜ "
Line70_2:                              ; BEEP .008,10
Line80:                                ; IF k$="p" AND g<31 THEN PRINT AT f,g;" –";AT f-1,g;" •"
Line80_1:                              ; LET g=g+1
   LD   HL,(Var_g)                     ; Address the var in VARS area
   CALL StackNumericVar

   LD   DE,256
   CALL StackShortInt                  ; Stack Signed Word (1)

   CALL GetTwoStackedNumbers
   CALL $3014                          ; [ROM] Call the Addition routine.
   CALL ReclaimStackItem

   LD   DE,(Var_g)                     ; Address the var in VARS area
   CALL UpdateNumVar


Line80_2:                              ; BEEP .008,10
Line90:                                ; IF k$="q" AND ATTR (f-3,g)=5 THEN PRINT AT f,g;" ";AT f-1,g;" "
Line90_1:                              ; LET f=f-4
   LD   HL,(Var_f)                     ; Address the var in VARS area
   CALL StackNumericVar

   LD   DE,1024
   CALL StackShortInt                  ; Stack Signed Word (4)

   CALL GetTwoStackedNumbers
   CALL $300F                          ; [ROM] Call the Subtraction routine.
   CALL ReclaimStackItem

   LD   DE,(Var_f)                     ; Address the var in VARS area
   CALL UpdateNumVar


Line90_2:                              ; PRINT AT f,g;"‘";AT f-1,g;""
Line90_3:                              ; BEEP .008,20
Line90_4:                              ; IF f=3 THEN LET f=4
   LD   DE,1024
   CALL StackShortInt                  ; Stack Signed Word (4)

   LD   DE,(Var_f)                     ; Address the var in VARS area
   CALL UpdateNumVar


Line90_5:                              ; PRINT AT f,g;"‘";AT f-1,g;"";AT f-2,g;" "
Line100:                               ; IF k$="a" AND ATTR (f+1,g)=5 THEN PRINT AT f,g;" ";AT f-1,g;" "
Line100_1:                             ; LET f=f+4
   LD   HL,(Var_f)                     ; Address the var in VARS area
   CALL StackNumericVar

   LD   DE,1024
   CALL StackShortInt                  ; Stack Signed Word (4)

   CALL GetTwoStackedNumbers
   CALL $3014                          ; [ROM] Call the Addition routine.
   CALL ReclaimStackItem

   LD   DE,(Var_f)                     ; Address the var in VARS area
   CALL UpdateNumVar


Line100_2:                             ; PRINT AT f,g;"‘";AT f-1,g;""
Line100_3:                             ; BEEP .008,30
Line100_4:                             ; IF f=8 THEN LET f=7
   LD   DE,1792
   CALL StackShortInt                  ; Stack Signed Word (7)

   LD   DE,(Var_f)                     ; Address the var in VARS area
   CALL UpdateNumVar


Line110:                               ; IF k$=" " AND ATTR (f-2,g)<>4 THEN PRINT AT f,g;" "
Line110_1:                             ; LET f=f-1
   LD   HL,(Var_f)                     ; Address the var in VARS area
   CALL StackNumericVar

   LD   DE,256
   CALL StackShortInt                  ; Stack Signed Word (1)

   CALL GetTwoStackedNumbers
   CALL $300F                          ; [ROM] Call the Subtraction routine.
   CALL ReclaimStackItem

   LD   DE,(Var_f)                     ; Address the var in VARS area
   CALL UpdateNumVar


Line110_2:                             ; PRINT AT f,g;"‘";AT f-1,g;""
Line110_3:                             ; BEEP .008,20
Line110_4:                             ; FOR i=1 TO 2
   LD   DE,256                         ; STEP not present - assume 1.
   CALL StackShortInt

   LD   DE,512
   CALL StackShortInt                  ; Stack Signed Word (2)

   LD   DE,256
   CALL StackShortInt                  ; Stack Signed Word (1)

   LD   DE,(Var_i)                     ; Address the var in VARS area
   LD   BC,Line110_5                   ; Store the address of the next line
   CALL UpdateFORVar


Line110_5:                             ; GO SUB 150
Line110_6:                             ; NEXT i
   LD   HL,(Var_i)                     ; Address the var in VARS area
   CALL DoNext                         ; And sort out the loop where necessary.


Line110_7:                             ; LET f=f+1
   LD   HL,(Var_f)                     ; Address the var in VARS area
   CALL StackNumericVar

   LD   DE,256
   CALL StackShortInt                  ; Stack Signed Word (1)

   CALL GetTwoStackedNumbers
   CALL $3014                          ; [ROM] Call the Addition routine.
   CALL ReclaimStackItem

   LD   DE,(Var_f)                     ; Address the var in VARS area
   CALL UpdateNumVar


Line110_8:                             ; PRINT AT f-2,g;" "
Line110_9:                             ; PRINT AT f,g;"‘";AT f-1,g;""
Line120:                               ; IF ATTR (f+1,g)=0 THEN PRINT AT f+1,g;"£";AT f,g;"¤";AT f-1,g;" "
Line120_1:                             ; GO TO 350
   JP Line94

Line125:                               ; IF ATTR (f-2,g)=3 THEN PRINT AT f-2,g; INK 7;" "
Line125_1:                             ; LET q=q+1
   LD   HL,(Var_q)                     ; Address the var in VARS area
   CALL StackNumericVar

   LD   DE,256
   CALL StackShortInt                  ; Stack Signed Word (1)

   CALL GetTwoStackedNumbers
   CALL $3014                          ; [ROM] Call the Addition routine.
   CALL ReclaimStackItem

   LD   DE,(Var_q)                     ; Address the var in VARS area
   CALL UpdateNumVar


Line125_2:                             ; LET score=score+100
   LD   HL,(Var_score)                 ; Address the var in VARS area
   CALL StackNumericVar

   LD   DE,25600
   CALL StackShortInt                  ; Stack Signed Word (100)

   CALL GetTwoStackedNumbers
   CALL $3014                          ; [ROM] Call the Addition routine.
   CALL ReclaimStackItem

   LD   DE,(Var_score)                 ; Address the var in VARS area
   CALL UpdateNumVar


Line125_3:                             ; FOR n=1 TO 6
   LD   DE,256                         ; STEP not present - assume 1.
   CALL StackShortInt

   LD   DE,1536
   CALL StackShortInt                  ; Stack Signed Word (6)

   LD   DE,256
   CALL StackShortInt                  ; Stack Signed Word (1)

   LD   DE,(Var_n)                     ; Address the var in VARS area
   LD   BC,Line125_4                   ; Store the address of the next line
   CALL UpdateFORVar


Line125_4:                             ; BEEP 0.025,5*n
Line125_5:                             ; NEXT n
   LD   HL,(Var_n)                     ; Address the var in VARS area
   CALL DoNext                         ; And sort out the loop where necessary.


Line130:                               ; LET i=0
   LD   DE,0
   CALL StackShortInt                  ; Stack Signed Word (0)

   LD   DE,(Var_i)                     ; Address the var in VARS area
   CALL UpdateNumVar


Line140:                               ; REM ***snakes
Line150:                               ; IF ATTR (f,g)=2 THEN GO TO 350
   JP Line94

Line160:                               ; IF ATTR (f+1,g)=2 THEN LET score=score+50
   LD   HL,(Var_score)                 ; Address the var in VARS area
   CALL StackNumericVar

   LD   DE,12800
   CALL StackShortInt                  ; Stack Signed Word (50)

   CALL GetTwoStackedNumbers
   CALL $3014                          ; [ROM] Call the Addition routine.
   CALL ReclaimStackItem

   LD   DE,(Var_score)                 ; Address the var in VARS area
   CALL UpdateNumVar


Line160_1:                             ; FOR n=1 TO 3
   LD   DE,256                         ; STEP not present - assume 1.
   CALL StackShortInt

   LD   DE,768
   CALL StackShortInt                  ; Stack Signed Word (3)

   LD   DE,256
   CALL StackShortInt                  ; Stack Signed Word (1)

   LD   DE,(Var_n)                     ; Address the var in VARS area
   LD   BC,Line160_2                   ; Store the address of the next line
   CALL UpdateFORVar


Line160_2:                             ; BEEP 0.05,5*n
Line160_3:                             ; NEXT n
   LD   HL,(Var_n)                     ; Address the var in VARS area
   CALL DoNext                         ; And sort out the loop where necessary.


Line170:                               ; IF n1>0 THEN PRINT INK 2; PAPER 0;AT 7,n1;" —"
Line170_1:                             ; LET n1=n1+1
   LD   HL,(Var_n1)                    ; Address the var in VARS area
   CALL StackNumericVar

   LD   DE,256
   CALL StackShortInt                  ; Stack Signed Word (1)

   CALL GetTwoStackedNumbers
   CALL $3014                          ; [ROM] Call the Addition routine.
   CALL ReclaimStackItem

   LD   DE,(Var_n1)                    ; Address the var in VARS area
   CALL UpdateNumVar


Line180:                               ; IF n1=29 THEN LET n2=n1
   LD   HL,(Var_n1)                    ; Address the var in VARS area
   CALL StackNumericVar

   LD   DE,(Var_n2)                    ; Address the var in VARS area
   CALL UpdateNumVar


Line180_1:                             ; PRINT AT 7,n1;"  "
Line180_2:                             ; LET n1=0
   LD   DE,0
   CALL StackShortInt                  ; Stack Signed Word (0)

   LD   DE,(Var_n1)                    ; Address the var in VARS area
   CALL UpdateNumVar


Line190:                               ; IF n2>0 THEN PRINT INK 2; PAPER 0;AT 11,n2;"’ "
Line190_1:                             ; LET n2=n2-1
   LD   HL,(Var_n2)                    ; Address the var in VARS area
   CALL StackNumericVar

   LD   DE,256
   CALL StackShortInt                  ; Stack Signed Word (1)

   CALL GetTwoStackedNumbers
   CALL $300F                          ; [ROM] Call the Subtraction routine.
   CALL ReclaimStackItem

   LD   DE,(Var_n2)                    ; Address the var in VARS area
   CALL UpdateNumVar


Line200:                               ; IF n2=1 AND n2>0 THEN LET n3=n2
   LD   HL,(Var_n2)                    ; Address the var in VARS area
   CALL StackNumericVar

   LD   DE,(Var_n3)                    ; Address the var in VARS area
   CALL UpdateNumVar


Line200_1:                             ; PRINT AT 11,n2;"  "
Line200_2:                             ; LET n2=0
   LD   DE,0
   CALL StackShortInt                  ; Stack Signed Word (0)

   LD   DE,(Var_n2)                    ; Address the var in VARS area
   CALL UpdateNumVar


Line210:                               ; IF n3>0 THEN PRINT INK 2; PAPER 0;AT 15,n3;" —"
Line210_1:                             ; LET n3=n3+1
   LD   HL,(Var_n3)                    ; Address the var in VARS area
   CALL StackNumericVar

   LD   DE,256
   CALL StackShortInt                  ; Stack Signed Word (1)

   CALL GetTwoStackedNumbers
   CALL $3014                          ; [ROM] Call the Addition routine.
   CALL ReclaimStackItem

   LD   DE,(Var_n3)                    ; Address the var in VARS area
   CALL UpdateNumVar


Line220:                               ; IF n3=29 THEN LET n4=n3
   LD   HL,(Var_n3)                    ; Address the var in VARS area
   CALL StackNumericVar

   LD   DE,(Var_n4)                    ; Address the var in VARS area
   CALL UpdateNumVar


Line220_1:                             ; PRINT AT 15,n3;"  "
Line220_2:                             ; LET n3=0
   LD   DE,0
   CALL StackShortInt                  ; Stack Signed Word (0)

   LD   DE,(Var_n3)                    ; Address the var in VARS area
   CALL UpdateNumVar


Line230:                               ; IF n4>0 THEN PRINT INK 2; PAPER 0;AT 19,n4;"’ "
Line230_1:                             ; LET n4=n4-1
   LD   HL,(Var_n4)                    ; Address the var in VARS area
   CALL StackNumericVar

   LD   DE,256
   CALL StackShortInt                  ; Stack Signed Word (1)

   CALL GetTwoStackedNumbers
   CALL $300F                          ; [ROM] Call the Subtraction routine.
   CALL ReclaimStackItem

   LD   DE,(Var_n4)                    ; Address the var in VARS area
   CALL UpdateNumVar


Line240:                               ; IF n4=1 AND n4>0 THEN LET n1=1
   LD   DE,256
   CALL StackShortInt                  ; Stack Signed Word (1)

   LD   DE,(Var_n1)                    ; Address the var in VARS area
   CALL UpdateNumVar


Line240_1:                             ; PRINT AT 19,n4;"  "
Line240_2:                             ; LET n4=0
   LD   DE,0
   CALL StackShortInt                  ; Stack Signed Word (0)

   LD   DE,(Var_n4)                    ; Address the var in VARS area
   CALL UpdateNumVar


Line250:                               ; IF i>0 THEN RETURN
Line260:                               ; IF ATTR (f,g)=2 THEN GO TO 350
   JP Line94

Line270:                               ; REM ***marcadores
Line280:                               ; PRINT INK 6;AT 0,6;score
Line290:                               ; GO TO 50
   JP Line50

Line300:                               ; REM ***resgatatorresmo
Line310:                               ; FOR n=1 TO 2*q
   LD   DE,256                         ; STEP not present - assume 1.
   CALL StackShortInt

   LD   DE,512
   CALL StackShortInt                  ; Stack Signed Word (2)

   LD   HL,(Var_q)                     ; Address the var in VARS area
   CALL StackNumericVar

   CALL GetTwoStackedNumbers
   CALL $30CA                          ; [ROM] Call the Multiplication routine.
   CALL ReclaimStackItem

   LD   DE,256
   CALL StackShortInt                  ; Stack Signed Word (1)

   LD   DE,(Var_n)                     ; Address the var in VARS area
   LD   BC,Line310_1                   ; Store the address of the next line
   CALL UpdateFORVar


Line310_1:                             ; PRINT INK 2; PAPER 0; OVER 1;AT 2,j+1;"ž"
Line310_2:                             ; BEEP 0.05,n
Line310_3:                             ; NEXT n
   LD   HL,(Var_n)                     ; Address the var in VARS area
   CALL DoNext                         ; And sort out the loop where necessary.


Line310_4:                             ; LET score=score+1000+(250*q)
   LD   HL,(Var_score)                 ; Address the var in VARS area
   CALL StackNumericVar

   LD   A,0
   LD   DE,59392
   LD   BC,3
   CALL $2AB6                          ; [ROM] STACK-STORE (1000)

   LD   DE,64000
   CALL StackShortInt                  ; Stack Signed Word (250)

   LD   HL,(Var_q)                     ; Address the var in VARS area
   CALL StackNumericVar

   CALL GetTwoStackedNumbers
   CALL $30CA                          ; [ROM] Call the Multiplication routine.
   CALL ReclaimStackItem

   CALL GetTwoStackedNumbers
   CALL $3014                          ; [ROM] Call the Addition routine.
   CALL ReclaimStackItem

   CALL GetTwoStackedNumbers
   CALL $3014                          ; [ROM] Call the Addition routine.
   CALL ReclaimStackItem

   LD   DE,(Var_score)                 ; Address the var in VARS area
   CALL UpdateNumVar


Line310_5:                             ; LET l=l+1
   LD   HL,(Var_l)                     ; Address the var in VARS area
   CALL StackNumericVar

   LD   DE,256
   CALL StackShortInt                  ; Stack Signed Word (1)

   CALL GetTwoStackedNumbers
   CALL $3014                          ; [ROM] Call the Addition routine.
   CALL ReclaimStackItem

   LD   DE,(Var_l)                     ; Address the var in VARS area
   CALL UpdateNumVar


Line320:                               ; IF l>10 THEN LET l=1
   LD   DE,256
   CALL StackShortInt                  ; Stack Signed Word (1)

   LD   DE,(Var_l)                     ; Address the var in VARS area
   CALL UpdateNumVar


Line330:                               ; GO TO 20
   JP Line20

Line340:                               ; REM ***umavidamenos
Line350:                               ; FOR n=2 TO 8
   LD   DE,256                         ; STEP not present - assume 1.
   CALL StackShortInt

   LD   DE,2048
   CALL StackShortInt                  ; Stack Signed Word (8)

   LD   DE,512
   CALL StackShortInt                  ; Stack Signed Word (2)

   LD   DE,(Var_n)                     ; Address the var in VARS area
   LD   BC,Line350_1                   ; Store the address of the next line
   CALL UpdateFORVar


Line350_1:                             ; BEEP .05,30+n
Line350_2:                             ; NEXT n
   LD   HL,(Var_n)                     ; Address the var in VARS area
   CALL DoNext                         ; And sort out the loop where necessary.


Line350_3:                             ; LET h=h-1
   LD   HL,(Var_h)                     ; Address the var in VARS area
   CALL StackNumericVar

   LD   DE,256
   CALL StackShortInt                  ; Stack Signed Word (1)

   CALL GetTwoStackedNumbers
   CALL $300F                          ; [ROM] Call the Subtraction routine.
   CALL ReclaimStackItem

   LD   DE,(Var_h)                     ; Address the var in VARS area
   CALL UpdateNumVar


Line350_4:                             ; IF h<0 THEN GO TO 380
   JP Line124

Line360:                               ; GO TO 20
   JP Line20

Line370:                               ; REM ***gameover
Line380:                               ; PRINT AT 10,10;" GAME OVER "
Line380_1:                             ; FOR n=30 TO -20 STEP -1
   LD   A,0
   LD   DE,65535
   LD   BC,255
   CALL $2AB6                          ; [ROM] STACK-STORE (-1)

   LD   A,0
   LD   DE,60671
   LD   BC,255
   CALL $2AB6                          ; [ROM] STACK-STORE (-20)

   LD   DE,7680
   CALL StackShortInt                  ; Stack Signed Word (30)

   LD   DE,(Var_n)                     ; Address the var in VARS area
   LD   BC,Line380_2                   ; Store the address of the next line
   CALL UpdateFORVar


Line380_2:                             ; BEEP .01,20
Line380_3:                             ; BEEP .008,n+30
Line380_4:                             ; NEXT n
   LD   HL,(Var_n)                     ; Address the var in VARS area
   CALL DoNext                         ; And sort out the loop where necessary.


Line390:                               ; CLS
Line390_1:                             ; GO TO 10
   JP Line10

Line400:                               ; REM ***level
Line410:                               ; INK 7
Line410_1:                             ; PAPER 0
Line410_2:                             ; BORDER 0
   LD   DE,0
   CALL StackShortInt                  ; Stack Signed Word (0)

   CALL $2DA2                          ; [ROM] Unstack to BC
   OUT  ($FE),A                        ; Set BORDER colour


Line410_3:                             ; CLS
Line420:                               ; PRINT INK 0; PAPER 0;AT 5,0;c$;AT 8,0;c$;AT 12,0;c$;AT 16,0;c$;AT 20,0;c$
Line430:                               ; PRINT INK 4; PAPER 0;AT 5,2;s$;AT 8,0;s$;AT 12,3;s$;AT 16,0;s$;AT 20,3;s$
Line435:                               ; FOR n=1 TO 5
   LD   DE,256                         ; STEP not present - assume 1.
   CALL StackShortInt

   LD   DE,1280
   CALL StackShortInt                  ; Stack Signed Word (5)

   LD   DE,256
   CALL StackShortInt                  ; Stack Signed Word (1)

   LD   DE,(Var_n)                     ; Address the var in VARS area
   LD   BC,Line435_1                   ; Store the address of the next line
   CALL UpdateFORVar


Line435_1:                             ; PRINT INK 3; PAPER 0;AT 9,RND*24+4;"Ÿ";AT 13,RND*24+4;"Ÿ";AT 17,RND*24+4;"Ÿ"
Line435_2:                             ; NEXT n
   LD   HL,(Var_n)                     ; Address the var in VARS area
   CALL DoNext                         ; And sort out the loop where necessary.


Line440:                               ; LET j=RND*24+4
   CALL RNDReplacement                 ; Call the new RND Function.

   LD   DE,6144
   CALL StackShortInt                  ; Stack Signed Word (24)

   CALL GetTwoStackedNumbers
   CALL $30CA                          ; [ROM] Call the Multiplication routine.
   CALL ReclaimStackItem

   LD   DE,1024
   CALL StackShortInt                  ; Stack Signed Word (4)

   CALL GetTwoStackedNumbers
   CALL $3014                          ; [ROM] Call the Addition routine.
   CALL ReclaimStackItem

   LD   DE,(Var_j)                     ; Address the var in VARS area
   CALL UpdateNumVar


Line440_1:                             ; PRINT INK 6; PAPER 0;AT 3,j;" “ ";AT 4,j;" ” "
Line450:                               ; LET r=RND*23+4
   CALL RNDReplacement                 ; Call the new RND Function.

   LD   DE,5888
   CALL StackShortInt                  ; Stack Signed Word (23)

   CALL GetTwoStackedNumbers
   CALL $30CA                          ; [ROM] Call the Multiplication routine.
   CALL ReclaimStackItem

   LD   DE,1024
   CALL StackShortInt                  ; Stack Signed Word (4)

   CALL GetTwoStackedNumbers
   CALL $3014                          ; [ROM] Call the Addition routine.
   CALL ReclaimStackItem

   LD   DE,(Var_r)                     ; Address the var in VARS area
   CALL UpdateNumVar


Line450_1:                             ; PRINT INK 5; PAPER 0;AT 4,r;" ";AT 5,r;"¡";AT 6,r;" "
Line460:                               ; LET r=RND*23+4
   CALL RNDReplacement                 ; Call the new RND Function.

   LD   DE,5888
   CALL StackShortInt                  ; Stack Signed Word (23)

   CALL GetTwoStackedNumbers
   CALL $30CA                          ; [ROM] Call the Multiplication routine.
   CALL ReclaimStackItem

   LD   DE,1024
   CALL StackShortInt                  ; Stack Signed Word (4)

   CALL GetTwoStackedNumbers
   CALL $3014                          ; [ROM] Call the Addition routine.
   CALL ReclaimStackItem

   LD   DE,(Var_r)                     ; Address the var in VARS area
   CALL UpdateNumVar


Line460_1:                             ; PRINT INK 5; PAPER 0;AT 8,r;"¡";AT 9,r;" ";AT 10,r;" "
Line470:                               ; LET r=RND*23+4
   CALL RNDReplacement                 ; Call the new RND Function.

   LD   DE,5888
   CALL StackShortInt                  ; Stack Signed Word (23)

   CALL GetTwoStackedNumbers
   CALL $30CA                          ; [ROM] Call the Multiplication routine.
   CALL ReclaimStackItem

   LD   DE,1024
   CALL StackShortInt                  ; Stack Signed Word (4)

   CALL GetTwoStackedNumbers
   CALL $3014                          ; [ROM] Call the Addition routine.
   CALL ReclaimStackItem

   LD   DE,(Var_r)                     ; Address the var in VARS area
   CALL UpdateNumVar


Line470_1:                             ; PRINT INK 5; PAPER 0;AT 12,r;"¡";AT 13,r;" ";AT 14,r;" "
Line480:                               ; LET r=RND*23+4
   CALL RNDReplacement                 ; Call the new RND Function.

   LD   DE,5888
   CALL StackShortInt                  ; Stack Signed Word (23)

   CALL GetTwoStackedNumbers
   CALL $30CA                          ; [ROM] Call the Multiplication routine.
   CALL ReclaimStackItem

   LD   DE,1024
   CALL StackShortInt                  ; Stack Signed Word (4)

   CALL GetTwoStackedNumbers
   CALL $3014                          ; [ROM] Call the Addition routine.
   CALL ReclaimStackItem

   LD   DE,(Var_r)                     ; Address the var in VARS area
   CALL UpdateNumVar


Line480_1:                             ; PRINT INK 5; PAPER 0;AT 16,r;"¡";AT 17,r;" ";AT 18,r;" "
Line490:                               ; PRINT INK 6;AT 0,0;"SCORE:";score;AT 0,15;"LIVES:";h;AT 0,24;"LEVEL:";l
Line500:                               ; RETURN
Line510:                               ; REM datos
Line520:                               ; RESTORE 540
Line520_1:                             ; FOR n=0 TO 167
   LD   DE,256                         ; STEP not present - assume 1.
   CALL StackShortInt

   LD   DE,42752
   CALL StackShortInt                  ; Stack Signed Word (167)

   LD   DE,0
   CALL StackShortInt                  ; Stack Signed Word (0)

   LD   DE,(Var_n)                     ; Address the var in VARS area
   LD   BC,Line520_2                   ; Store the address of the next line
   CALL UpdateFORVar


Line520_2:                             ; READ d
Line520_3:                             ; POKE USR "a"+n,d
   LD   HL,String1
   CALL StackStringVar                 ; Stack String Const ("")

   LD   HL,(Var_n)                     ; Address the var in VARS area
   CALL StackNumericVar

   CALL $359C                          ; [ROM] Perform the Addition.

   CALL $1E80                          ; [ROM] POKE Command


Line520_4:                             ; NEXT n
   LD   HL,(Var_n)                     ; Address the var in VARS area
   CALL DoNext                         ; And sort out the loop where necessary.


Line530:                               ; LET pts=1000
   LD   A,0
   LD   DE,59392
   LD   BC,3
   CALL $2AB6                          ; [ROM] STACK-STORE (1000)

   LD   DE,(Var_pts)                   ; Address the var in VARS area
   CALL UpdateNumVar


Line530_1:                             ; LET z=0
   LD   DE,0
   CALL StackShortInt                  ; Stack Signed Word (0)

   LD   DE,(Var_z)                     ; Address the var in VARS area
   CALL UpdateNumVar


Line530_2:                             ; LET score=0
   LD   DE,0
   CALL StackShortInt                  ; Stack Signed Word (0)

   LD   DE,(Var_score)                 ; Address the var in VARS area
   CALL UpdateNumVar


Line530_3:                             ; LET h=2
   LD   DE,512
   CALL StackShortInt                  ; Stack Signed Word (2)

   LD   DE,(Var_h)                     ; Address the var in VARS area
   CALL UpdateNumVar


Line530_4:                             ; LET l=1
   LD   DE,256
   CALL StackShortInt                  ; Stack Signed Word (1)

   LD   DE,(Var_l)                     ; Address the var in VARS area
   CALL UpdateNumVar


Line530_5:                             ; LET s$="›šššššššššššššššššššœ"
   LD   HL,String6
   CALL StackStringVar                 ; Stack String Const (" –")

   LD   DE,(Var_s_str)                 ; Address the var in VARS area
   LD   BC,Var_s_str
   PUSH BC
   CALL UpdateStrVar


Line530_6:                             ; LET c$="                                "
   LD   HL,String6
   CALL StackStringVar                 ; Stack String Const (" –")

   LD   DE,(Var_c_str)                 ; Address the var in VARS area
   LD   BC,Var_c_str
   PUSH BC
   CALL UpdateStrVar


Line540:                               ; DATA 0,60,126,189,102,189,24,126
Line550:                               ; DATA 189,153,60,126,102,66,195,0
Line560:                               ; DATA 112,220,126,3,30,120,195,126
Line570:                               ; DATA 0,28,54,70,46,22,26,60
Line580:                               ; DATA 120,120,24,60,60,126,126,36
Line590:                               ; DATA 0,56,84,190,92,168,24,60
Line600:                               ; DATA 52,91,88,60,28,26,114,67
Line610:                               ; DATA 14,59,126,192,120,30,195,126
Line620:                               ; DATA 0,28,42,125,58,21,24,60
Line630:                               ; DATA 44,218,26,60,56,88,78,194
Line640:                               ; DATA 255,16,96,12,4,7,96,255
Line650:                               ; DATA 127,144,160,140,128,135,224,127
Line660:                               ; DATA 254,17,65,9,1,71,97,254
Line670:                               ; DATA 255,64,6,24,0,0,96,255
Line680:                               ; DATA 36,126,223,255,126,60,24,0
Line690:                               ; DATA 36,90,36,36,90,44,8,8
Line700:                               ; DATA 16,8,16,8,16,8,16,8
Line710:                               ; DATA 255,72,17,8,144,8,16,255
Line720:                               ; DATA 255,16,96,12,4,7,96,255
Line730:                               ; DATA 126,153,189,189,165,189,213,171
Line740:                               ; DATA 129,66,66,102,126,60,24,60
Line750:                               ; REM ***intro
Line760:                               ; PAPER 0
Line760_1:                             ; INK 7
Line760_2:                             ; BORDER 0
   LD   DE,0
   CALL StackShortInt                  ; Stack Signed Word (0)

   CALL $2DA2                          ; [ROM] Unstack to BC
   OUT  ($FE),A                        ; Set BORDER colour


Line760_3:                             ; CLS
Line760_4:                             ; PRINT "                                "
Line760_5:                             ; PRINT "                                "
Line760_6:                             ; PRINT INK 4;"        *Atoa na ADAPA*         "
Line760_7:                             ; PRINT "                                "
Line760_8:                             ; PRINT INK 3;"       Save o Torresmo da       "
Line760_9:                             ; PRINT INK 3;"          evil ADAPA           "
Line760_10:                            ; PRINT "                                "
Line760_11:                            ; PRINT "            Q : UP              "
Line760_12:                            ; PRINT "            A : DOWN            "
Line760_13:                            ; PRINT "            O : LEFT            "
Line760_14:                            ; PRINT "            P : RIGHT           "
Line760_15:                            ; PRINT "        SPACE : JUMP            "
Line760_16:                            ; PRINT "                                "
Line760_17:                            ; PRINT "                                "
Line760_18:                            ; PRINT INK 5;"           by R Martincic          "
Line760_19:                            ; PRINT INK 5;"        for ZX Spectrum         "
Line760_20:                            ; PRINT INK 5;"        BASIC JAM  2017         "
Line760_21:                            ; PRINT "                                "
Line760_22:                            ; PRINT "                                "
Line760_23:                            ; PRINT FLASH 1;"    Press any key to START      "
Line770:                               ; PAUSE 0
   LD   DE,0
   CALL StackShortInt                  ; Stack Signed Word (0)

   CALL $1F3A                          ; [ROM] PAUSE Command


Line780:                               ; RETURN
   RET                                 ; END OF PROGRAM

DoNext:
   LD      ($5C68),HL                  ; Set MEM to point to the three 5-byte values
                                       ; value, limit, step.
   RST  28H                            ;; FP-CALC      add step and re-store
   DEFB $E0                            ;; get-mem-0    v.
   DEFB $E2                            ;; get-mem-2    v,s.
   DEFB $0F                            ;; addition     v+s.
   DEFB $C0                            ;; st-mem-0     v+s.
   DEFB $02                            ;; delete       .
   DEFB $38                            ;; end-calc

   CALL $1DDA                          ; [ROM] routine NEXT-LOOP tests against limit.
   RET  C                              ; return if no more iterations possible.

   LD   HL,($5C68)                     ; find start of variable contents from MEM.
   LD   DE,$F                          ; add 3*5 to
   ADD  HL,DE                          ; address the looping address
   LD   E,(HL)
   INC  HL
   LD   D,(HL)
   EX   DE,HL
   JP   (HL)                           ; and go there

UpdateFORVar:
   PUSH BC
   CALL UpdateNumVar                   ; UnStack the STEP
   CALL UpdateNumVar                   ; and the LIMIT
   CALL UpdateNumVar                   ; and the START, or CURRENT Value
   POP  BC
   EX   DE,HL
   LD   (HL),C                         ; so now just store the address
   INC  HL                             ; of the line to jump to when we loop
   LD   (HL),B
   RET

StackStringVar:
   LD   C,(HL)
   INC  HL
   LD   B,(HL)
   INC  HL
   PUSH HL                             ; Store the start of the string
   PUSH BC

   RST  30h                            ; Reserve BC Spaces at [WORKSP]
   POP  BC
   CALL $2AB6                          ; [ROM] STACK-STORE (String)

   POP  HL                             ; Restore the address of the source string
   LDIR                                ; and copy the source to [WORKSP]

   RET

StackNumericVar:
   LD   A,(HL)
   INC  HL
   LD   E,(HL)
   INC  HL
   LD   D,(HL)
   INC  HL
   LD   C,(HL)
   INC  HL
   LD   B,(HL)
   CALL $2AB6                          ; [ROM] STACK-STORE (Variable)
   RET

UpdateNumVar:
   LD   HL,($5C65)                     ; Address STKEND
   LD   BC,$FFFB                       ; Prepare to step back 5 bytes
   ADD  HL,BC                          ; Address the last item on the stack
   LDI                                 ; Copy 5 bytes
   LDI
   LDI
   LDI
   LDI
   CALL ReclaimStackItem
   RET

UpdateStrVar:
   POP  BC                             ; Save the return address
   POP  IX                             ; Save the address of the Jump table entry that will be affected
   PUSH BC                             ; Restack the return address
   PUSH DE                             ; Store the VARS Address for later

   CALL $2BF1                          ; [ROM] Get the string parameters from the calculator stack

   POP  HL                             ; And get the address of the VARS space back.
   PUSH BC                             ; Store the length of the stacked var
   LD   E,(HL)                         ; Grab the current Var Length into DE, and...
   LD   (HL),C                         ; ...Update the variable length marker
   INC  HL
   LD   D,(HL)
   LD   (HL),B
   INC  HL                             ; HL now points at the start of the string
   PUSH HL                             ; and we'll need it later, so store it.

   PUSH BC
   LD   B,D                            ; Prepare to reclaim the old string - length to BC
   LD   C,E
   CALL $19E8                          ; [ROM] routine RECLAIM-2 to reclaim the old string.
   POP  BC
   INC  IX
   INC  IX                             ; This variables jump table entry does not need updating,
                                       ; But all subsequent vars do.
   EX   DE, HL                         ; Now Test - is the new string smaller than the old?
   AND  A
   SBC  HL, BC
   EX   DE, HL
   JR   NC, UpdateVarStringLarger      ; If it isnt then just carry on

   PUSH BC                             ; Store BC before it gets modified
   CALL UpdateJumpTableDec             ; Otherwise, jump into the next routine early to invert BC
   POP  BC                             ; and Restore BC for the actual MAKE-ROOM process
   JP   UpdateStrVarCont

UpdateVarStringLarger:
   CALL UpdateJumpTableAdd

UpdateStrVarCont:
   POP  HL

   CALL $1655                          ; [ROM] routine MAKE-ROOM creates BC spaces for new string
   LD   DE,($5C61)                     ; Get WORKSP into DE - the start of the string

   INC  HL                             ; advance to first new location.
   EX   DE,HL
   POP  BC                             ; Set up for LDIR - BC is length, DE is destination
   LDIR                                ; and HL is the source string to copy from

   CALL CleanWorkspace                 ; and... tidy up.
   RET

UpdateJumpTableDec:                    ; Adjust BC to move Backwards in memory
   LD   A,B
   CPL
   LD   B,A
   LD   A,C
   CPL
   LD   C,A
   INC  BC
UpdateJumpTableAdd:
   LD   A,$FF
   LD   L,(IX+0)                       ; Get the location from the table
   LD   H,(IX+1)
   CP   H                              ; Test with A (Is it $FF?)
   RET  Z                              ; Bail out if so
   ADD  HL,BC                          ; Otherwise, add the offset, and
   LD   (IX+0),L                       ; Update the table.
   LD   (IX+1),H
   INC  IX
   INC  IX
   JP   UpdateJumpTableAdd             ; Go back and do the next one

GetStackedNumber:
   LD   HL,($5C65)                     ; HL = STKEND
   LD   BC,$FFFB                       ; Numbers are (-)5 Bytes
   ADD  HL,BC                          ; (HL) = Last Number
   RET

GetTwoStackedNumbers:
   LD   HL,($5C65)                     ; HL = STKEND
   LD   BC,$FFFB                       ; Numbers are (-)5 Bytes
   ADD  HL,BC                          ; (HL) = Last Number
   LD   D,H
   LD   E,L                            ; (DE) = Last Number
   ADD  HL,BC                          ; (HL) = First Number
   RET

ReclaimStackItem:
   LD   HL,($5C65)                     ; Address STKEND
   LD   BC,$FFFB                       ; Prepare to reclaim 5 Bytes
   ADD  HL,BC                          ; Move (HL) Back 5 bytes to reclaim old value
   LD   ($5C65),HL                     ; Update STKEND to reflect the change
   RET

StackShortInt:
   XOR  A
   LD   B,A
   LD   C,A
   CALL $2AB6                          ; [ROM] STACK-STORE
   RET

RNDReplacement:
   LD   BC,($5C76)                     ; fetch system variable SEED
   CALL $2D2B                          ; routine STACK-BC places on calculator stack
   RST  28H                            ;; FP-CALC            ;s.
   DEFB $A1                            ;; stk-one            ;s,1.
   DEFB $0F                            ;; addition           ;s+1.
   DEFB $34                            ;; stk-data           ;
   DEFB $37                            ;; Exponent: $87,
                                       ;; Bytes: 1
   DEFB $16                            ;; (+00,+00,+00)      ;s+1,75.
   DEFB $04                            ;; multiply           ;(s+1)*75 = v
   DEFB $34                            ;; stk-data           ;v.
   DEFB $80                            ;; Bytes: 3
   DEFB $41                            ;; Exponent $91
   DEFB $00,$00,$80                    ;; (+00)              ;v,65537.
   DEFB $32                            ;; n-mod-m            ;remainder, result.
   DEFB $02                            ;; delete             ;remainder.
   DEFB $A1                            ;; stk-one            ;remainder, 1.
   DEFB $03                            ;; subtract           ;remainder - 1. = rnd
   DEFB $31                            ;; duplicate          ;rnd,rnd.
   DEFB $38                            ;; end-calc

   CALL $2DA2                          ; routine FP-TO-BC
   LD   ($5C76),BC                     ; store in SEED for next starting point.
   LD   A,(HL)                         ; fetch exponent
   AND  A                              ; is it zero ?
   RET  Z                              ; exit if so.

   SUB  $10                            ; reduce exponent by 2^16
   LD   (HL),A                         ; place back
   RET

CleanWorkspace:
   LD   HL,($5C63)                     ; Fetch STKBOT
   LD   DE,($5C61)                     ; Fetch start of Workspace
   CALL $19E5                          ; [ROM] Reclaim the Workspace
   RET

AllocateVars:
   LD   BC,($5CB2)
   LD   DE,($5C4B)
   LD   HL,($5C59)
   DEC  HL
   CALL $19E5                          ; Clear any current variables

   LD   IX,Var_f                       ; set IX up to point at the jump table
   LD   BC,155                         ; Allocate space for Variables
   LD   HL,($5C59)                     ; fetch E_LINE to HL.
   DEC  HL                             ; point to location before, the variables
                                       ; end-marker.
   CALL $1655                          ; routine MAKE-ROOM creates BC spaces
                                       ; for name and numeric value.
   INC  HL                             ; advance to first new location.

   EX   DE,HL                          ; set DE=Start of space in VARS area
   LD   HL,VarNames                    ; set HL to the first var in the table
   LD   A,NumVars
VarLoop:
   LD   C,(HL)
   INC  HL
   LD   B,(HL)                         ; BC now holds the length of the vars data
   INC  HL
   PUSH BC                             ; preserve length of vars data
   LD   C,(HL)
   INC  HL
   LD   B,(HL)                         ; BC now holds the length of the var name
   INC  HL                             ; HL now points to the var name
   LDIR                                ; Copy var name to VARS area,
                                       ; advancing DE to point to the vars value and,
                                       ; advancing HL to point to the Filler Bytes (0s) in "VarNames" table
   LD   (IX+0),E                       ; Store pointer to vars value in jump table
   LD   (IX+1),D
   INC   IX
   INC   IX
   POP   BC                            ; BC = length of vars data (from "VarNames")
   LDIR                                ; Copy the filler bytes.
                                       ; DE now points to the next var,
                                       ; HL points to the next var in "VarNames" table
   DEC  A
   JR   NZ,VarLoop
   RET

VarNames:                              ; Here follows the Variable Names Table

   DEFB 5,0,1,0
   DEFB 102                            ; f
   DEFB 0,0,0,0,0                      ; Initial filler bytes
   DEFB 5,0,1,0
   DEFB 103                            ; g
   DEFB 0,0,0,0,0                      ; Initial filler bytes
   DEFB 5,0,2,0
   DEFB 174,"1"+$80                    ; n1
   DEFB 0,0,0,0,0                      ; Initial filler bytes
   DEFB 5,0,2,0
   DEFB 174,"2"+$80                    ; n2
   DEFB 0,0,0,0,0                      ; Initial filler bytes
   DEFB 5,0,2,0
   DEFB 174,"3"+$80                    ; n3
   DEFB 0,0,0,0,0                      ; Initial filler bytes
   DEFB 5,0,2,0
   DEFB 174,"4"+$80                    ; n4
   DEFB 0,0,0,0,0                      ; Initial filler bytes
   DEFB 5,0,1,0
   DEFB 113                            ; q
   DEFB 0,0,0,0,0                      ; Initial filler bytes
   DEFB 18,0,1,0
   DEFB 105                            ; i
   DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; Initial filler bytes
   DEFB 5,0,5,0
   DEFB 179,"cor","e"+$80              ; score
   DEFB 0,0,0,0,0                      ; Initial filler bytes
   DEFB 18,0,1,0
   DEFB 110                            ; n
   DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ; Initial filler bytes
   DEFB 5,0,1,0
   DEFB 108                            ; l
   DEFB 0,0,0,0,0                      ; Initial filler bytes
   DEFB 5,0,1,0
   DEFB 104                            ; h
   DEFB 0,0,0,0,0                      ; Initial filler bytes
   DEFB 5,0,1,0
   DEFB 106                            ; j
   DEFB 0,0,0,0,0                      ; Initial filler bytes
   DEFB 5,0,1,0
   DEFB 114                            ; r
   DEFB 0,0,0,0,0                      ; Initial filler bytes
   DEFB 5,0,3,0
   DEFB 176,"t","s"+$80                ; pts
   DEFB 0,0,0,0,0                      ; Initial filler bytes
   DEFB 5,0,1,0
   DEFB 122                            ; z
   DEFB 0,0,0,0,0                      ; Initial filler bytes
   DEFB 2,0,1,0
   DEFB 75                             ; k_str
   DEFB 0,0                            ; Initial filler bytes
   DEFB 2,0,1,0
   DEFB 83                             ; s_str
   DEFB 0,0                            ; Initial filler bytes
   DEFB 2,0,1,0
   DEFB 67                             ; c_str
   DEFB 0,0                            ; Initial filler bytes

                                       ; Here follows the Variables jump table
Var_f:
   DEFB 0,0
Var_g:
   DEFB 0,0
Var_n1:
   DEFB 0,0
Var_n2:
   DEFB 0,0
Var_n3:
   DEFB 0,0
Var_n4:
   DEFB 0,0
Var_q:
   DEFB 0,0
Var_i:
   DEFB 0,0
Var_score:
   DEFB 0,0
Var_n:
   DEFB 0,0
Var_l:
   DEFB 0,0
Var_h:
   DEFB 0,0
Var_j:
   DEFB 0,0
Var_r:
   DEFB 0,0
Var_pts:
   DEFB 0,0
Var_z:
   DEFB 0,0
Var_k_str:
   DEFB 0,0
Var_s_str:
   DEFB 0,0
Var_c_str:
   DEFB 0,0
EndOfVars:
   DEFB 255,255

                                       ; String Constants Follow

String0:
   DEFB 1,0,"‘"
String1:
   DEFB 1,0,""
String2:
   DEFB 1,0,"o"
String3:
   DEFB 2,0,"™ "
String4:
   DEFB 2,0,"˜ "
String5:
   DEFB 1,0,"p"
String6:
   DEFB 2,0," –"
String7:
   DEFB 2,0," •"
String8:
   DEFB 1,0,"q"
String9:
   DEFB 1,0," "
String10:
   DEFB 1,0," "
String11:
   DEFB 1,0,"‘"
String12:
   DEFB 1,0,""
String13:
   DEFB 1,0,"‘"
String14:
   DEFB 1,0,""
String15:
   DEFB 1,0," "
String16:
   DEFB 1,0,"a"
String17:
   DEFB 1,0," "
String18:
   DEFB 1,0," "
String19:
   DEFB 1,0,"‘"
String20:
   DEFB 1,0,""
String21:
   DEFB 1,0," "
String22:
   DEFB 1,0," "
String23:
   DEFB 1,0,"‘"
String24:
   DEFB 1,0,""
String25:
   DEFB 1,0," "
String26:
   DEFB 1,0,"‘"
String27:
   DEFB 1,0,""
String28:
   DEFB 1,0,"£"
String29:
   DEFB 1,0,"¤"
String30:
   DEFB 1,0," "
String31:
   DEFB 1,0," "
String32:
   DEFB 2,0," —"
String33:
   DEFB 2,0,"  "
String34:
   DEFB 2,0,"’ "
String35:
   DEFB 2,0,"  "
String36:
   DEFB 2,0," —"
String37:
   DEFB 2,0,"  "
String38:
   DEFB 2,0,"’ "
String39:
   DEFB 2,0,"  "
String40:
   DEFB 1,0,"ž"
String41:
   DEFB 11,0," GAME OVER "
String42:
   DEFB 1,0,"Ÿ"
String43:
   DEFB 1,0,"Ÿ"
String44:
   DEFB 1,0,"Ÿ"
String45:
   DEFB 3,0," “ "
String46:
   DEFB 3,0," ” "
String47:
   DEFB 1,0," "
String48:
   DEFB 1,0,"¡"
String49:
   DEFB 1,0," "
String50:
   DEFB 1,0,"¡"
String51:
   DEFB 1,0," "
String52:
   DEFB 1,0," "
String53:
   DEFB 1,0,"¡"
String54:
   DEFB 1,0," "
String55:
   DEFB 1,0," "
String56:
   DEFB 1,0,"¡"
String57:
   DEFB 1,0," "
String58:
   DEFB 1,0," "
String59:
   DEFB 6,0,"SCORE:"
String60:
   DEFB 6,0,"LIVES:"
String61:
   DEFB 6,0,"LEVEL:"
String62:
   DEFB 1,0,"a"
String63:
   DEFB 28,0,"›šššššššššššššššššššœ"
String64:
   DEFB 32,0,"                                "
String65:
   DEFB 32,0,"                                "
String66:
   DEFB 32,0,"                                "
String67:
   DEFB 32,0,"        *Atoa na ADAPA*         "
String68:
   DEFB 32,0,"                                "
String69:
   DEFB 32,0,"       Save o Torresmo da       "
String70:
   DEFB 31,0,"          evil ADAPA           "
String71:
   DEFB 32,0,"                                "
String72:
   DEFB 32,0,"            Q : UP              "
String73:
   DEFB 32,0,"            A : DOWN            "
String74:
   DEFB 32,0,"            O : LEFT            "
String75:
   DEFB 32,0,"            P : RIGHT           "
String76:
   DEFB 32,0,"        SPACE : JUMP            "
String77:
   DEFB 32,0,"                                "
String78:
   DEFB 32,0,"                                "
String79:
   DEFB 35,0,"           by R Martincic          "
String80:
   DEFB 32,0,"        for ZX Spectrum         "
String81:
   DEFB 32,0,"        BASIC JAM  2017         "
String82:
   DEFB 32,0,"                                "
String83:
   DEFB 32,0,"                                "
String84:
   DEFB 32,0,"    Press any key to START    