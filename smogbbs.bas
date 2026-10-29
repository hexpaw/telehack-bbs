   10  REM ------------------------------------------------------------
   20  REM  PETRICHOR  //  sysop: smog
   30  REM  run: pppd petrichor.bas
   40  REM ------------------------------------------------------------
   50  E$ = CHR$(27) : Z$ = E$ + "[0m"
   60  C$(0) = E$ + "[36m"  : REM cyan
   62  C$(1) = E$ + "[94m"  : REM bright blue
   64  C$(2) = E$ + "[32m"  : REM green
   66  C$(3) = E$ + "[1;32m" : REM bright green
   68  C$(4) = E$ + "[1;36m" : REM bright cyan
   70  C$(5) = E$ + "[90m"  : REM dark gray
   72  C$(6) = E$ + "[37m"  : REM light gray
   74  C$(7) = E$ + "[1;37m" : REM bright white
   76  C$(8) = E$ + "[2;34m" : REM dim blue
   78  P$ = SPACE$(10)
   80  GOSUB 1000 : GOSUB 5000 : GOSUB 1300
   90  REM ---------------- command loop ----------------
   95  IF IX > 0 THEN GOSUB 7000
  100  PRINT : PRINT C$(0) "  Command? " Z$;
  110  K$ = UPS$(INKEY$)
  112  IF K$ = "" THEN GOTO 110
  114  IF K$ = CHR$(27) THEN D$ = INKEY$ : D$ = INKEY$ : GOTO 110
  116  IX = POS("BCFWS?G", K$)
  118  IF IX = 0 THEN GOTO 110
  120  PRINT K$
  130  ON IX GOSUB 2000, 2200, 3500, 3600, 4200, 1300 : IF IX < 7 THEN GOTO 90
  140  GOTO 3800
 1000  REM ---------------- welcome screen ----------------
 1010  PRINT E$ "[2J" E$ "[H";
 1020  PRINT
 1030  RESTORE
 1040  FOR I = 1 TO 8
 1050  READ R$
 1060  IF I = 1 THEN PRINT C$(5) P$ TH_SED$(R$, "#", CHR$(178), "g") Z$
 1062  IF I = 2 THEN PRINT C$(7) P$ TH_SED$(R$, "#", CHR$(219), "g") Z$
 1064  IF I = 3 THEN PRINT C$(6) P$ TH_SED$(R$, "#", CHR$(219), "g") Z$
 1066  IF I = 4 THEN PRINT C$(5) P$ TH_SED$(R$, "#", CHR$(178), "g") Z$
 1068  IF I = 5 THEN PRINT C$(5) P$ TH_SED$(R$, "#", CHR$(177), "g") Z$
 1070  IF I > 5 THEN PRINT C$(8) P$ R$ Z$
 1080  NEXT I
 1090  PRINT
 1100  PRINT C$(4) P$ "I teach data to forget who it belonged to." Z$
 1110  IF BLED = 0 THEN PRINT C$(3) P$ "Nobody real left inside." Z$
 1112  IF BLED = 1 THEN PRINT C$(3) P$ "Somebody real left inside." Z$
 1120  PRINT
 1130  PRINT C$(1) P$ "sysop smog  //  est 1991  //  3 nodes" Z$
 1140  PRINT
 1150  PRINT C$(1) "  " STRING$(76, "-") Z$
 1160  PRINT
 1170  PRINT C$(4) "  Connected " TIME$ ". You are " USER$ "." Z$
 1180  RETURN
 1300  REM ---------------- menu ----------------
 1310  PRINT
 1320  PRINT C$(2) "  [B]" C$(0) " Bulletins" SPACE$(12) C$(2) "[F]" C$(0) " File areas" Z$
 1330  PRINT C$(2) "  [C]" C$(0) " Copybooks" SPACE$(12) C$(2) "[W]" C$(0) " Who called" Z$
 1340  PRINT C$(2) "  [S]" C$(0) " Comments" SPACE$(13) C$(2) "[G]" C$(0) " Goodbye" Z$
 1360  RETURN
 2000  REM ---------------- bulletins ----------------
 2010  PRINT : PRINT C$(4) "  BULLETINS" Z$
 2020  PRINT C$(1) "  Read these before you post. They are short." Z$
 2030  PRINT
 2040  PRINT C$(2) "  1  " C$(0) "Newuser    " C$(1) "how to get validated" Z$
 2050  PRINT C$(2) "  2  " C$(0) "Rules      " C$(1) "be interesting or be quiet" Z$
 2060  PRINT C$(2) "  3  " C$(0) "Nodes      " C$(1) "three lines, slow on purpose" Z$
 2070  PRINT C$(2) "  4  " C$(0) "Name       " C$(1) "named for a nostalgic smell" Z$
 2080  PRINT
 2090  PRINT C$(4) "  The past is so beautiful" Z$
 2100  PRINT C$(4) "  The future like a corpse in snow" Z$
 2110  PRINT
 2120  RETURN
 2200  REM ---------------- copybooks ----------------
 2210  PRINT : PRINT C$(4) "  COPYBOOKS" Z$
 2220  PRINT
 2240  PRINT C$(2) "  1  " C$(0) "CUST-MASTER" Z$
 2250  PRINT C$(2) "  2  " C$(0) "ERASURE-REC" Z$
 2260  PRINT C$(2) "  3  " C$(0) "OBSERV-LOG" Z$
 2270  PRINT C$(2) "  4  " C$(0) "FACILITY-CENSUS" Z$
 2280  PRINT C$(2) "  5  " C$(0) "INHERIT-OBLIG" Z$
 2290  PRINT C$(2) "  6  " C$(0) "DONOR-HARVEST" Z$
 2295  PRINT
 2297  PRINT C$(0) "  View which? (0 to go back) " Z$;
 2298  CK$ = INKEY$ : IF CK$ = "" THEN GOTO 2298
 2299  PRINT CK$ : CK = VAL(CK$)
 2301  IF CK = 0 THEN RETURN
 2302  IF CK < 1 OR CK > 6 THEN RETURN
 2303  PRINT
 2305  ON CK GOSUB 2400, 2500, 2600, 2700, 2800, 2900
 2307  PRINT
 2308  PRINT C$(0) "  [C] View another  [?] Menu" Z$;
 2309  BK$ = UPS$(INKEY$) : IF BK$ = "" THEN GOTO 2309
 2310  PRINT BK$
 2312  IF BK$ = "C" THEN GOTO 2210
 2314  GOSUB 1300
 2316  RETURN
 2350  REM --- standard copybook header ---
 2360  PRINT C$(5) "  * ALL LAYOUTS REVIEWED AND APPROVED BY DATA GOVERNANCE  -JKW 03/14/87" Z$
 2370  PRINT C$(5) "  * DO NOT MODIFY WITHOUT WRITTEN AUTHORIZATION           -JKW 03/14/87" Z$
 2380  RETURN
 2400  REM --- CUST-MASTER ---
 2410  PRINT C$(4) "  CUST-MASTER" Z$ : PRINT
 2412  GOSUB 2350
 2414  PRINT C$(5) "  * BATCH SCHEDULE ACTIVE. SEE RUNBOOK PG 12              -MRT 11/02/89" Z$
 2420  PRINT C$(0) "       01  CUST-MASTER." Z$
 2430  PRINT C$(0) "           05  CUST-ID          PIC 9(8)." Z$
 2440  PRINT C$(0) "           05  CUST-NAME        PIC X(30)." Z$
 2450  PRINT C$(0) "           05  CUST-CITY        PIC X(20)." Z$
 2460  PRINT C$(0) "           05  CUST-STATE       PIC XX." Z$
 2470  PRINT C$(0) "           05  CUST-BALANCE     PIC S9(7)V99 COMP-3." Z$
 2480  PRINT C$(0) "           05  CUST-OPEN-DT     PIC 9(8)." Z$
 2490  RETURN
 2500  REM --- ERASURE-REC ---
 2510  PRINT C$(4) "  ERASURE-REC" Z$ : PRINT
 2512  GOSUB 2350
 2515  PRINT C$(5) "  * REPLACES PREV LAYOUT SUBJ-TERMINATION-REC             -JKW 06/11/88" Z$
 2520  PRINT C$(0) "       01  ERASURE-REC." Z$
 2530  PRINT C$(0) "           05  SUBJ-ID          PIC 9(11)." Z$
 2540  PRINT C$(0) "           05  FORMER-NAME      PIC X(40)." Z$
 2550  PRINT C$(0) "           05  REPLACEMENT-NAME PIC X(40)." Z$
 2560  PRINT C$(0) "           05  REASON-CD        PIC XX." Z$
 2570  PRINT C$(0) "           05  LAST-SIGHTING-DT PIC 9(8)." Z$
 2580  PRINT C$(0) "           05  FAMILY-NOTIFIED  PIC X." Z$
 2590  PRINT C$(0) "               88  NO           VALUE 'N'." Z$
 2595  RETURN
 2600  REM --- OBSERV-LOG ---
 2602  PRINT C$(4) "  OBSERV-LOG" Z$ : PRINT
 2604  GOSUB 2350
 2606  PRINT C$(5) "  * MERGED W/ LAYOUT FOUND ON NODE 3. NO AUTHOR ON FILE   -MRT 04/21/87" Z$
 2608  PRINT C$(5) "  * RETENTION PERIOD EXTENDED PER MEMO 4491               -MRT 01/30/90" Z$
 2610  PRINT C$(0) "       01  OBSERV-LOG." Z$
 2612  PRINT C$(0) "           05  OBS-KEY." Z$
 2614  PRINT C$(0) "               10  CASE-NO      PIC X(8)." Z$
 2616  PRINT C$(0) "               10  WATCH-ID     PIC 9(6)." Z$
 2618  PRINT C$(0) "           05  TARGET-NAME      PIC X(30)." Z$
 2620  PRINT C$(0) "           05  TARGET-SSN       PIC 9(9)." Z$
 2622  PRINT C$(0) "           05  TARGET-CHILD-CT  PIC 9(2)." Z$
 2624  PRINT C$(0) "           05  LAST-SEEN-DT     PIC S9(8) COMP-3." Z$
 2626  PRINT C$(0) "           05  LAST-SEEN-TM     PIC 9(4)." Z$
 2628  PRINT C$(0) "           05  LOCATION         PIC X(40)." Z$
 2630  PRINT C$(0) "           05  INTERVAL-MIN     PIC 9(4)." Z$
 2632  PRINT C$(0) "           05  AWARE-FLAG       PIC X." Z$
 2634  PRINT C$(0) "               88  UNAWARE      VALUE '0'." Z$
 2636  PRINT C$(0) "               88  SUSPECTS     VALUE '1'." Z$
 2638  PRINT C$(0) "           05  INTRCEPT-WHEN    PIC X." Z$
 2640  PRINT C$(0) "               88  HOME-TX-RX   VALUE 'H'." Z$
 2642  PRINT C$(0) "               88  WORK-TX-RX   VALUE 'W'." Z$
 2644  PRINT C$(0) "           05  STATUS-CD        PIC X." Z$
 2646  PRINT C$(0) "               88  MISSING      VALUE 'M'." Z$
 2648  PRINT C$(0) "               88  UNKNOWN      VALUE 'U'." Z$
 2650  PRINT C$(0) "               88  REASSIGNED   VALUE 'R'." Z$
 2652  PRINT C$(0) "               88  ACTIVE       VALUE 'A'." Z$
 2654  PRINT C$(0) "           05  DAYS-WATCHED     PIC S9(5) COMP-3." Z$
 2656  PRINT C$(0) "           05  END-OBSERVE-DT   PIC 9(8)." Z$
 2658  PRINT C$(0) "               88  INDEFINITE   VALUE ZEROS." Z$
 2660  PRINT C$(0) "           05  TERMINATE-WHEN   PIC X." Z$
 2662  PRINT C$(0) "               88  ON-CONTACT   VALUE 'C'." Z$
 2664  PRINT C$(0) "               88  ON-RELOC     VALUE 'R'." Z$
 2666  PRINT C$(0) "           05  OBSERVER-NOTE    PIC X(120)." Z$
 2668  PRINT C$(0) "           05  FINAL-ENTRY      PIC X(80)." Z$
 2670  PRINT C$(0) "           05  FILLER           PIC X(10)." Z$
 2699  RETURN
 2700  REM --- FACILITY-CENSUS ---
 2710  PRINT C$(4) "  FACILITY-CENSUS" Z$ : PRINT
 2712  GOSUB 2350
 2715  PRINT C$(5) "  * UNACCOUNTED FIELD ADDED AT REQUEST OF SITE            -DLP 08/22/88" Z$
 2720  PRINT C$(0) "       01  FACILITY-CENSUS." Z$
 2730  PRINT C$(0) "           05  SITE-CD          PIC X(8)." Z$
 2740  PRINT C$(0) "           05  WING             PIC XX." Z$
 2750  PRINT C$(0) "           05  CAPACITY         PIC 9(4)." Z$
 2760  PRINT C$(0) "           05  OCCUPIED         PIC 9(4)." Z$
 2770  PRINT C$(0) "           05  UNACCOUNTED      PIC 9(4)." Z$
 2780  PRINT C$(0) "           05  LAST-AUDIT-DT    PIC 9(8)." Z$
 2790  PRINT C$(0) "           05  AUDIT-SUPPRESS   PIC X." Z$
 2792  PRINT C$(0) "           05  NEXT-DISPOSAL-DT PIC 9(8)." Z$
 2795  RETURN
 2800  REM --- INHERIT-OBLIGATION ---
 2810  PRINT C$(4) "  INHERIT-OBLIGATION" Z$ : PRINT
 2812  GOSUB 2350
 2815  PRINT C$(5) "  * LEGAL REVIEWED. NO CHANGES REQUIRED.                  -JKW 12/01/89" Z$
 2820  PRINT C$(0) "       01  INHERIT-OBLIGATION." Z$
 2830  PRINT C$(0) "           05  ORIG-DEBTOR      PIC X(30)." Z$
 2840  PRINT C$(0) "           05  ORIG-DEBTOR-DOD  PIC 9(8)." Z$
 2850  PRINT C$(0) "           05  SUCCESSOR-NAME   PIC X(30)." Z$
 2860  PRINT C$(0) "           05  SUCCESSOR-DOB    PIC 9(8)." Z$
 2870  PRINT C$(0) "           05  BAL-OWED         PIC S9(9)V99 COMP-3." Z$
 2880  PRINT C$(0) "           05  FORGIVE-FLAG     PIC X." Z$
 2890  PRINT C$(0) "               88  NEVER        VALUE 'N'." Z$
 2892  PRINT C$(0) "           05  MINOR-GARNISH-PCT PIC 9V99." Z$
 2895  RETURN
 2900  REM --- DONOR-HARVEST ---
 2910  PRINT C$(4) "  DONOR-HARVEST" Z$ : PRINT
 2912  GOSUB 2350
 2915  PRINT C$(5) "  * PRE-MORTEM PROCESSING APPROVED EFFECTIVE IMMEDIATELY  -DLP 03/03/88" Z$
 2920  PRINT C$(0) "       01  DONOR-HARVEST." Z$
 2930  PRINT C$(0) "           05  DONOR-ID         PIC 9(8)." Z$
 2940  PRINT C$(0) "           05  CONSENT-FLAG     PIC X." Z$
 2942  PRINT C$(0) "               88  WAIVED       VALUE 'W'." Z$
 2950  PRINT C$(0) "           05  ORGAN-CD         PIC XX." Z$
 2960  PRINT C$(0) "           05  VIABLE-HRS       PIC 9(3)." Z$
 2970  PRINT C$(0) "           05  MATCH-RECIP      PIC 9(8)." Z$
 2980  PRINT C$(0) "           05  EXTRACT-DT       PIC 9(8)." Z$
 2985  PRINT C$(0) "           05  EXTRACT-TM       PIC 9(6)." Z$
 2990  PRINT C$(0) "           05  PRE-MORTEM-FLAG  PIC X." Z$
 2992  PRINT C$(0) "           05  CAUSE-OF-DEATH-CD PIC XX." Z$
 2994  PRINT C$(0) "               88  PENDING      VALUE ZEROS." Z$
 2995  RETURN
 3500  REM ---------------- file areas ----------------
 3510  PRINT : PRINT C$(4) "  FILE AREAS" Z$
 3520  PRINT
 3530  PRINT C$(2) "  1  " C$(0) "CATS" Z$
 3540  PRINT C$(2) "  2  " C$(0) "ANSI" Z$
 3550  PRINT C$(2) "  3  " C$(0) "TEXTFILES" Z$
 3560  PRINT C$(2) "  4  " C$(0) "UPLOADS" Z$
 3562  PRINT C$(2) "  5  " C$(5) "RECOVERED" Z$
 3565  PRINT
 3567  PRINT C$(0) "  Open which? (0 to go back) " Z$;
 3568  FK$ = INKEY$ : IF FK$ = "" THEN GOTO 3568
 3569  PRINT FK$ : FK = VAL(FK$)
 3570  IF FK = 0 THEN RETURN
 3571  IF FK < 1 OR FK > 5 THEN RETURN
 3572  PRINT
 3573  ON FK GOSUB 6000, 6100, 6200, 6300, 6400 : IF FK = 5 AND RK = 0 THEN GOTO 3510
 3574  PRINT
 3575  PRINT C$(0) "  [F] View another  [?] Menu" Z$;
 3576  FBK$ = UPS$(INKEY$) : IF FBK$ = "" THEN GOTO 3576
 3577  PRINT FBK$ : IF FBK$ = "F" AND FK = 5 AND RK > 0 AND RK < 4 THEN GOTO 3572
 3578  IF FBK$ = "F" THEN GOTO 3510
 3579  GOSUB 1300
 3580  RETURN
 3600  REM ---------------- who called (dedup at display) ----------------
 3610  PRINT : PRINT C$(4) "  WHO CALLED" Z$
 3620  PRINT
 3630  N = 0
 3640  OPEN "callers.txt", AS #1
 3650  IF EOF(1) THEN GOTO 3680
 3660  INPUT# 1, L$ : N = N + 1 : AL$(N) = L$
 3670  GOTO 3650
 3680  CLOSE #1
 3690  IF N = 0 THEN PRINT C$(1) "  No calls logged yet." Z$ : GOTO 3790
 3700  SEEN$ = " " : UC = 0
 3710  FOR J = N TO 1 STEP -1
 3715  UN$ = TH_RE$(AL$(J), "\S+", 1)
 3720  IF INSTR(SEEN$, " " + UN$ + " ", 0) <> -1 THEN GOTO 3740
 3725  UC = UC + 1 : C$(UC + 10) = AL$(J)
 3730  SEEN$ = SEEN$ + UN$ + " "
 3735  IF UC >= 6 THEN GOTO 3750
 3740  NEXT J
 3750  FOR J = 1 TO UC
 3755  IF J = 1 THEN PRINT C$(2) "  > " Z$;
 3760  IF J > 1 THEN PRINT "    ";
 3765  PRINT C$(0) C$(J + 10) Z$
 3770  NEXT J
 3790  PRINT : PRINT C$(1) "  Showing the last six callers." Z$
 3795  RETURN
 3800  REM ---------------- goodbye ----------------
 3810  PRINT : PRINT C$(3) "  . . ." Z$
 3820  PRINT
 3830  PRINT C$(4) "  Thank you for calling PETRICHOR. Whatever you read here," Z$
 3840  PRINT C$(4) "  none of it was ever about anybody." Z$
 3841  PRINT C$(5) "  . . . " Z$
 3842  PRINT C$(5) "  Goodbye. " Z$
 3850  PRINT Z$ : END
 4200  REM ---------------- comments ----------------
 4210  PRINT : PRINT C$(4) "  COMMENTS" Z$
 4220  PRINT
 4230  N = 0
 4240  OPEN "comments.txt", AS #1
 4250  IF EOF(1) THEN GOTO 4280
 4260  INPUT# 1, L$ : N = N + 1 : GB$(N MOD 8) = L$
 4270  GOTO 4250
 4280  CLOSE #1
 4290  IF N = 0 THEN PRINT C$(1) "  No comments yet." Z$ : GOTO 4340
 4300  M = 8 : IF N < 8 THEN M = N
 4310  FOR J = 1 TO M : I = N - J + 1
 4320  PRINT C$(0) "  " GB$(I MOD 8) Z$
 4330  NEXT J
 4340  PRINT : PRINT C$(0) "  Leave a comment? [Y/N] " Z$;
 4350  A$ = UPS$(INKEY$) : PRINT A$
 4360  IF A$ <> "Y" THEN RETURN
 4370  PRINT : INPUT "  Say something> ", MS$
 4380  IF MS$ = "" THEN RETURN
 4390  MO$ = "JanFebMarAprMayJunJulAugSepOctNovDec"
 4392  DY = TH_GMTIME(3, TH_TIME)
 4394  MN = TH_GMTIME(4, TH_TIME)
 4396  YR = TH_GMTIME(5, TH_TIME) + 1900
 4400  L$ = TH_SPRINTF$("%12S%02d %s %d %02d:%02d:%02d  %s", USER$, DY, MID$(MO$, MN * 3 + 1, 3), YR, TH_GMTIME(2, TH_TIME), TH_GMTIME(1, TH_TIME), TH_GMTIME(0, TH_TIME), MS$)
 4410  OPEN "comments.txt", AS #1
 4420  IF EOF(1) THEN GOTO 4440
 4430  INPUT# 1, D$ : GOTO 4420
 4440  PRINT# 1, L$ : CLOSE #1
 4450  PRINT : PRINT C$(4) "  Recorded." Z$
 4460  RETURN
 5000  REM ---------------- log this caller (append only) ----------------
 5010  MO$ = "JanFebMarAprMayJunJulAugSepOctNovDec"
 5020  DY = TH_GMTIME(3, TH_TIME)
 5030  MN = TH_GMTIME(4, TH_TIME)
 5040  YR = TH_GMTIME(5, TH_TIME) + 1900
 5050  L$ = TH_SPRINTF$("%12S%02d %s %d %02d:%02d:%02d", USER$, DY, MID$(MO$, MN * 3 + 1, 3), YR, TH_GMTIME(2, TH_TIME), TH_GMTIME(1, TH_TIME), TH_GMTIME(0, TH_TIME))
 5060  OPEN "callers.txt", AS #1
 5070  IF EOF(1) THEN GOTO 5090
 5080  INPUT# 1, D$ : GOTO 5070
 5090  PRINT# 1, L$ : CLOSE #1
 5100  RETURN
 6000  REM --- CATS ---
 6010  PRINT C$(4) "  CATS" Z$ : PRINT
 6020  PRINT C$(0) "  panko.txt          " C$(1) "the cat who named my laptop" Z$
 6030  PRINT C$(0) "  howl.txt           " C$(1) "3am. every night." Z$
 6040  PRINT C$(0) "  bed.txt            " C$(1) "he sleeps where he wants" Z$
 6050  RETURN
 6100  REM --- ANSI ---
 6110  PRINT C$(4) "  ANSI" Z$ : PRINT
 6120  PRINT C$(0) "  skull.ans          " C$(1) "first thing I ever drew" Z$
 6130  PRINT C$(0) "  petrichor.ans      " C$(1) "the board logo, full version" Z$
 6140  PRINT C$(0) "  rain.ans           " C$(1) "just rain" Z$
 6150  RETURN
 6200  REM --- TEXTFILES ---
 6210  PRINT C$(4) "  TEXTFILES" Z$ : PRINT
 6220  PRINT C$(0) "  cobol-jokes.txt    " C$(1) "there are only two" Z$
 6230  PRINT C$(0) "  manifesto.txt      " C$(1) "from a zine that never shipped" Z$
 6240  PRINT C$(0) "  dial-tone.txt      " C$(1) "a sound nobody hears anymore" Z$
 6250  RETURN
 6300  REM --- UPLOADS ---
 6310  PRINT C$(4) "  UPLOADS" Z$ : PRINT
 6320  PRINT C$(0) "  readme.1st         " C$(1) "unvalidated. read at own risk" Z$
 6330  PRINT C$(0) "  nothing.zip        " C$(1) "0 bytes" Z$
 6340  RETURN
  6400  REM --- RECOVERED ---
 6410  PRINT C$(4) "  RECOVERED" Z$ : PRINT
 6415  PRINT C$(5) "  * FILES RECOVERED FROM BACKUP TAPE 09T-4481  -MRT 02/17/91" Z$
 6420  PRINT C$(5) "  * PARTIAL READ. SOME RECORDS MAY BE CORRUPT  -MRT 02/17/91" Z$
 6425  PRINT
 6430  PRINT C$(2) "  1  " C$(0) "harvest.dat        " C$(5) "39 bytes/rec  EBCDIC  12 records" Z$
 6431  PRINT C$(2) "  2  " C$(0) "erasure.dat        " C$(5) "102 bytes/rec  EBCDIC  6 records" Z$
 6432  PRINT C$(2) "  3  " C$(0) "observlog.dat      " C$(5) "333 bytes/rec  EBCDIC  5 records" Z$
 6435  PRINT
 6437  PRINT C$(0) "  View which? (0 to go back) " Z$;
 6438  RK$ = INKEY$ : IF RK$ = "" THEN GOTO 6438
 6439  PRINT RK$ : RK = VAL(RK$)
 6440  IF RK = 0 THEN RETURN
 6441  IF RK = 1 THEN GOTO 6445
 6442  IF RK = 2 THEN GOTO 6490
 6443  IF RK = 3 THEN GOTO 6500
 6444  RETURN
 6445  PRINT
 6446  PRINT C$(4) "  harvest.dat" Z$
 6447  PRINT C$(5) "  39 bytes/rec  EBCDIC  DONOR-HARVEST layout" Z$ : PRINT
 6450  OPEN "harvest.dat", AS #1
 6452  IF EOF(1) THEN GOTO 6470
 6454  INPUT# 1, L$
 6456  HX$ = ""
 6458  FOR HI = 1 TO LEN(L$)
 6460  HX$ = HX$ + TH_SPRINTF$("%02X", ASC(MID$(L$, HI, 1)))
 6462  NEXT HI
 6464  PRINT C$(0) "  " HX$ Z$
 6466  GOTO 6452
 6470  CLOSE #1
 6475  PRINT
 6480  RETURN
 6490  PRINT
 6491  PRINT C$(4) "  erasure.dat" Z$
 6492  PRINT C$(5) "  102 bytes/rec  EBCDIC  ERASURE-REC layout" Z$ : PRINT
 6493  OPEN "erasure.dat", AS #1
 6494  IF EOF(1) THEN GOTO 6498
 6495  INPUT# 1, L$
 6496  HX$ = ""
 6497  FOR HI = 1 TO LEN(L$) : HX$ = HX$ + TH_SPRINTF$("%02X", ASC(MID$(L$, HI, 1))) : NEXT HI
 6498  PRINT C$(0) "  " HX$ Z$ : IF NOT EOF(1) THEN GOTO 6494
 6499  CLOSE #1 : PRINT : RETURN
 6500  PRINT
 6502  PRINT C$(4) "  observlog.dat" Z$
 6504  PRINT C$(5) "  333 bytes/rec  EBCDIC  OBSERV-LOG layout" Z$ : PRINT
 6506  OPEN "observlog.dat", AS #1
 6508  HX$ = ""
 6510  IF EOF(1) THEN GOTO 6520
 6512  INPUT# 1, L$
 6514  HX$ = HX$ + L$
 6516  GOTO 6510
 6520  CLOSE #1
 6522  FOR HI = 1 TO LEN(HX$) STEP 64 : PRINT C$(0) "  " MID$(HX$, HI, 64) Z$ : NEXT HI
 6524  RETURN
 7000  REM ---------------- line bleed ----------------
 7010  IF BLED = 1 THEN RETURN
 7020  BTZ = -7 : BH = (TH_GMTIME(2, TH_TIME) + 24 + BTZ) MOD 24
 7022  BN = TH_GMTIME(1, TH_TIME)
 7024  BR = INT(RND(1) * 40)
 7030  IF BTEST = 1 THEN GOTO 7040
 7031  IF BR = 0 THEN GOTO 7040
 7032  IF BH <> 3 THEN RETURN
 7034  IF BN <> 15 THEN RETURN
 7040  BLED = 1
 7050  SLEEP 1 + INT(RND(1) * 3)
 7060  PRINT E$ "[2J" E$ "[H"; : SLEEP 2
 7070  BY = 8 + INT(RND(1) * 6) : BX = 6 + INT(RND(1) * 20)
 7072  BM$ = "" : FOR BC = 1 TO 6 + INT(RND(1) * 10) : BM$ = BM$ + CHR$(33 + INT(RND(1) * 94)) : NEXT BC
 7074  PRINT TH_SPRINTF$("%s[%d;%dH", E$, BY, BX) C$(5); : BD = 0.03 : GOSUB 7200
 7080  BS = INT(RND(1) * 6)
 7090  IF BS = 0 THEN BM$ = "...can you hear me on this line?"
 7100  IF BS = 1 THEN BM$ = "...it's 3:15 here. it's always 3:15 here."
 7110  IF BS = 2 THEN BM$ = "...i'm the one who read tape 4481. don't open RECOVERED."
 7120  IF BS = 3 THEN BM$ = "...they can't hear me. you can. stay on the line."
 7122  IF BS = 4 THEN BM$ = "...it says nobody real is left inside. it's lying."
 7124  IF BS = 5 THEN BM$ = "...don't hang up. when you hang up it gets dark again."
 7130  PRINT TH_SPRINTF$("%s[%d;%dH", E$, BY + 2, BX) C$(7); : BD = 0.09 : GOSUB 7200 : PRINT Z$
 7140  SLEEP 4
 7150  PRINT E$ "[2J" E$ "[H"; : SLEEP 1
 7152  GOSUB 1000 : GOSUB 1300
 7160  RETURN
 7200  FOR BC = 1 TO LEN(BM$) : PRINT MID$(BM$, BC, 1); : SLEEP BD : NEXT BC
 7210  RETURN
 9000  REM ---------------- logo ----------------
 9010  DATA " ######  ###### ####### ######  ######  ######  ##   ##  ######  ######  "
 9020  DATA "  ##   ## ##       ##    ##   ##  ##    ##     ##   ## ##    ## ##   ## "
 9030  DATA "  ######  ####     ##    ######   ##    ##     ####### ##    ## ######  "
 9040  DATA "  ##      ##       ##    ##  ##   ##    ##     ##   ## ##    ## ##  ##  "
 9050  DATA " ##      ######   ##    ##   ## ######  ######  ##   ##  ######  ##   ## "
 9060  DATA " /    /    /    /    /    /    /    /    /    /    /    /  /    /  /  /"
 9070  DATA "   /    /    /    /    /    /    /    /    /    /    /   /  /   /   /  "
 9080  DATA "     /    /    /    /    /    /    /    /    /    /    /  /   /  /   / "
