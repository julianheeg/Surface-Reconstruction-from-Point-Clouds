# |Created using:
# | Subdivfit -mf engine.crep1e-5.m -fi engine.11444.pts.gz -crep 1e-5 -csharp
# |  .2e-5 -reconstruct
# |Initial mesh:
# |Genus: c=3 b=4  v=426 f=783 e=1207  genus=0
# |11444 points read
# |Starting reconstruction sequence
# | crep=1e-05, csharp=2e-06
# | internal xform: F 1  0.107476 0 0  0 0.107476 0  0 0 0.107476  0.500183 0.492405 0.342257  0
# |
# |fgfit_before: v=426 nse=0/1207  edis=2.86217 etot=3.23096
# |fgfit_after : v=426 nse=0/1207  edis=0.0124688 etot=0.381263
# | (_fgfit:                491.67)
# |
# |Stoc, crep=1e-05 csharp=2e-06 wcrep=0.000865714 wcsharp=0.000173143
# |stoc_before: v=426 nse=0/1207  edis=0.0124688 etot=0.381263
# |it 1288, last search: 115 wasted attempts
# |New mesh:
# |Genus: c=3 b=4  v=208 f=347 e=553  genus=0
# |Summary of attempts and results:
# |                          ecol      espl      eswa      esha
# |      total_attempts      1288         0         0         0
# |             success       218         0         0         0
# |     positive_energy       919         0         0         0
# |        bad_dihedral        50         0         0         0
# |           bad_sharp        92         0         0         0
# |        illegal_move         9         0         0         0
# | last cedis=0.037502 cetot=0.21757
# |stoc_after : v=208 nse=0/553  edis=0.0375019 etot=0.21757
# | (_stoc:                3672.85)
# |
# |fgfit_before: v=208 nse=0/553  edis=0.0375019 etot=0.21757
# |fgfit_after : v=208 nse=0/553  edis=0.0285789 etot=0.208647
# | (_fgfit:                150.75)
# |
# |Stoc, crep=1e-05 csharp=2e-06 wcrep=0.000865714 wcsharp=0.000173143
# |stoc_before: v=208 nse=0/553  edis=0.0285788 etot=0.208647
# |it 643, last search: 43 wasted attempts
# |New mesh:
# |Genus: c=3 b=4  v=208 f=347 e=553  genus=0  sharpe=1 cuspv=0
# |Summary of attempts and results:
# |                          ecol      espl      eswa      esha
# |      total_attempts         0         0         0       643
# |             success         0         0         0         9
# |     positive_energy         0         0         0        75
# |        bad_dihedral         0         0         0         0
# |           bad_sharp         0         0         0       494
# |        illegal_move         0         0         0        65
# | last cedis=0.0264205 cetot=0.206662
# |stoc_after : v=208 nse=1/553  edis=0.0264204 etot=0.206662
# | (_stoc:                 221.66)
# |
# |fgfit_before: v=208 nse=1/553  edis=0.0264205 etot=0.206662
# |fgfit_after : v=208 nse=1/553  edis=0.023358 etot=0.2036
# | (_fgfit:                134.54)
# |
# |Stoc, crep=1e-05 csharp=2e-06 wcrep=0.000865714 wcsharp=0.000173143
# |stoc_before: v=208 nse=1/553  edis=0.0233582 etot=0.2036
# |it 629, last search: 85 wasted attempts
# |New mesh:
# |Genus: c=3 b=4  v=194 f=332 e=524  genus=0  sharpe=1 cuspv=0
# |Summary of attempts and results:
# |                          ecol      espl      eswa      esha
# |      total_attempts       629         0       611       615
# |             success        14         0         2         4
# |     positive_energy       579         0       495        69
# |        bad_dihedral        36         0        52         0
# |           bad_sharp         0         0         0       480
# |        illegal_move         0         0        62        62
# | last cedis=0.0268421 cetot=0.194964
# |stoc_after : v=194 nse=1/524  edis=0.026842 etot=0.194964
# | (_stoc:                2408.88)
# |
# |fgfit_before: v=194 nse=1/524  edis=0.026842 etot=0.194964
# |fgfit_after : v=194 nse=1/524  edis=0.0227598 etot=0.190881
# | (_fgfit:                134.00)
# | (Subdivfit:            7216.52)
# |Summary of timers (cpu=sgi host=espresso.cs.washington.edu):
# | ___submesh:         (2480  )    0.25:7.15     av=     0.49   sum=  1211.82
# | ____gmakeSpatial:   (10    )    4.76:8.68     av=     5.71   sum=    57.07
# | ____gspatialproject:(10    )    3.62:7.19     av=     4.43   sum=    44.29
# | ___gallproject:     (10    )    8.52:15.95    av=    10.23   sum=   102.27
# | ___computegrad:     (274   )    0.73:0.94     av=     0.79   sum=   215.90
# | ___gneighproject:   (465   )    1.07:1.51     av=     1.19   sum=   552.28
# | __fgfit_iter:       (70    )    9.29:14.96    av=    12.10   sum=   846.89
# | _fgfit:             (4     )  134.00:491.67   av=   227.74   sum=   910.96
# | _initial_fit:       (3     )   11.44:19.53    av=    14.52   sum=    43.56
# | ____lmakespatial:   (2470  )    0.00:0.23     av=     0.09   sum=   230.04
# | ____lspatialproject:(2470  )    0.00:0.37     av=     0.10   sum=   240.11
# | ___lallproject:     (2470  )    0.01:0.56     av=     0.19   sum=   473.25
# | ____lneighproject:  (13327 )    0.05:0.84     av=     0.20   sum=  2631.36
# | ____lcombinations:  (13327 )    0.01:0.21     av=     0.03   sum=   448.67
# | _____qrdLLS:        (13327 )    0.00:0.19     av=     0.04   sum=   565.05
# | ____lsolve:         (13327 )    0.00:0.22     av=     0.06   sum=   737.85
# | ___loptimize:       (13327 )    0.07:1.29     av=     0.31   sum=  4125.72
# | __tryecol:          (1816  )    1.05:8.18     av=     2.95   sum=  5361.55
# | __lattempt:         (2560  )    0.00:11.18    av=     2.43   sum=  6223.23
# | _stoc:              (3     )  221.66:3672.85  av=  2101.13   sum=  6303.39
# | __tryesha:          (157   )    1.05:9.97     av=     2.17   sum=   340.11
# | __tryeswa:          (497   )    0.62:2.75     av=     0.97   sum=   480.03
# | Subdivfit:          (1     )        :         av=  7216.52   sum=  7216.52
# |Summary of statistics:
# |Sospobcells:(298336 )          1:12          av=3.10871     sd=1.41112
# |Sssncellsv: (659314 )          1:343         av=1.84709     sd=2.52907
# |Sssnelemsv: (659314 )          1:135         av=12.1249     sd=7.28383
# |Sospcelln:  (143693 )          1:67          av=6.45432     sd=4.7194
# |Sprojquick: (24448553)          0:1           av=0.537658    sd=0.49858
# |Sprojnei:   (11303586)          0:6           av=0.156998    sd=0.37195
# |Sprojf:     (11303586)          3:55          av=10.1496     sd=2.0668
# |Sprojunexp: (1743641)          0:1           av=8.60269e-06 sd=0.00293302
# |Sneval:     (70     )          6:8           av=6.64286     sd=0.590645
# |Stmin:      (70     )  0.0148628:0.0580969   av=0.0318662   sd=0.0115955
# |Ssetfrem:   (2470   )        224:768         av=366.16      sd=96.8802
# |Ssetvrem:   (2470   )        120:388         av=187.962     sd=45.6801
# |Secolpts:   (1816   )        503:3051        av=1496.47     sd=478.339
# |Secolmf:    (1816   )         27:75          av=48.8287     sd=8.92218
# |Secolmv:    (1816   )          5:13          av=8.59967     sd=1.43317
# |Secolsmv:   (1816   )        247:647         av=427.022     sd=70.9173
# |Soptnit:    (2390   )          2:10          av=3.35607     sd=2.39033
# |Soptnig:    (253    )         11:12          av=11.0277     sd=0.164345
# |Sechange:   (247    )-0.00268641:-9.06209e-05 av=-0.000705723 sd=0.000368621
# |Seshapts:   (157    )       1014:3051        av=2080.94     sd=585.355
# |Seshamf:    (157    )         36:69          av=53.4777     sd=7.89481
# |Seshamv:    (157    )          7:13          av=9.80255     sd=1.4342
# |Seshasmv:   (157    )        321:583         av=459.955     sd=59.7729
# |Seswapts:   (497    )        631:2012        av=1192.71     sd=311.396
# |Seswamf:    (497    )         22:47          av=33.7807     sd=5.13195
# |Seswamv:    (497    )          4:4           av=4           sd=0
# |Seswasmv:   (497    )        205:407         av=300.594     sd=41.3415
# Created using:
#  Filtermesh engine.nsub2.crep1e-5p.0.m -renumber
# (Timing on cpu=sgi host=belvedere.microsoft.com)
#  (_readmesh:               0.04)
#  (_renumber:               0.00)
#  (Filtermesh:              0.04)
Vertex 1  -0.0533348 3.97038 0.0490912
Vertex 2  0.352034 3.55373 0.187117
Vertex 3  -0.212749 3.78412 0.155708
Vertex 4  -0.0515929 3.56978 -0.396489
Vertex 5  -0.330105 3.53781 -0.20106
Vertex 6  0.414374 3.44991 -0.316969
Vertex 7  0.0791534 3.57148 0.388515
Vertex 8  0.603263 3.23146 0.25414
Vertex 9  -0.50961 3.10928 0.494656
Vertex 10  -0.766339 2.98826 -0.0448358
Vertex 11  0.271868 2.91309 0.702908
Vertex 12  0.0871425 3.07952 -0.644397
Vertex 13  -0.442988 2.99267 -0.582772
Vertex 14  0.598213 3.0151 -0.294723
Vertex 15  -0.180485 2.9247 0.709699
Vertex 16  0.866722 2.33245 0.0998074
Vertex 17  0.353968 2.77309 -0.629233
Vertex 18  -0.0797472 2.45869 -0.78899
Vertex 19  -0.777804 2.14975 0.258919
Vertex 20  0.527709 2.28134 0.5887
Vertex 21  0.258649 2.20372 0.755228
Vertex 22  -0.669533 2.23729 -0.409636
Vertex 23  0.682391 2.29822 -0.473456
Vertex 24  0.186111 2.2617 -0.775059
Vertex 25  -0.799597 1.36588 -0.200889
Vertex 26  0.403264 1.64181 -0.68996
Vertex 27  -0.434757 1.59016 -0.732589
Vertex 28  -0.17854 1.83922 0.815861
Vertex 29  -0.534899 1.94806 0.606203
Vertex 30  0.581706 1.37601 0.564188
Vertex 31  0.0246301 0.969492 -0.748577
Vertex 32  0.699848 0.902286 -0.319159
Vertex 33  -0.692201 1.18503 0.256906
Vertex 34  -0.532362 1.13872 0.523993
Vertex 35  0.69483 0.835231 0.15478
Vertex 36  0.140249 0.884419 0.720647
Vertex 37  -0.550213 0.155665 -0.0728821
Vertex 38  -0.433276 -0.0212936 -0.387002
Vertex 39  0.380275 0.232148 -0.487788
Vertex 40  -0.0271125 -0.425262 -0.486455
Vertex 41  -0.246581 0.306469 0.590455
Vertex 42  0.397434 0.187801 0.436134
Vertex 43  -0.500922 -0.19141 0.221079
Vertex 44  0.500853 -0.151456 0.175839
Vertex 45  0.130563 -0.629036 0.391437
Vertex 46  0.437626 -0.472962 0.0413725
Vertex 47  -0.167493 -1.35915 -0.12869
Vertex 48  0.268059 -0.852382 0.154574
Vertex 49  -0.0118399 -1.90079 0.0426625
Vertex 50  0.0677461 -1.91273 -0.0735408
Vertex 51  -0.0193045 -2.28245 0.0285484
Vertex 52  1.27135 -2.51761 0.176932
Vertex 53  1.00929 -3.65611 -0.201223
Vertex 54  1.22903 -2.54049 -0.356183
Vertex 55  0.988113 -3.65728 0.258872
Vertex 56  1.01747 -3.00099 0.575686
Vertex 57  0.821465 -3.65288 -0.601027
Vertex 58  0.968788 -2.7058 -0.785017
Vertex 59  0.795249 -3.65827 0.630509
Vertex 60  0.859681 -2.3984 0.981854
Vertex 61  0.515711 -3.65118 -0.899402
Vertex 62  0.481315 -3.65021 0.907812
Vertex 63  0.477086 -2.84342 -1.14054
Vertex 64  0.335754 -2.54826 1.23107
Vertex 65  -0.116144 -3.67474 -1.06624
Vertex 66  -0.25355 -2.89356 -1.21993
Vertex 67  1.41278 -1.31251 0.0138934
Vertex 68  -0.196338 -2.88311 1.20343
Vertex 69  1.28899 -1.40193 0.625548
Vertex 70  -0.85923 -2.58866 -0.945308
Vertex 71  1.33702 -1.24194 -0.541273
Vertex 72  0.0651837 -3.65638 1.01631
Vertex 73  -0.40769 -3.66251 0.943272
Vertex 74  0.92342 -1.41607 -1.11064
Vertex 75  -0.804608 -2.67958 0.973744
Vertex 76  1.01951 -1.17022 0.97452
Vertex 77  -0.792833 -3.66344 -0.723935
Vertex 78  -0.782922 -3.65901 0.660184
Vertex 79  0.600994 -1.3201 1.294
Vertex 80  -1.20281 -2.45005 0.501053
Vertex 81  1.45614 -0.507615 0.0790537
Vertex 82  1.25026 -0.404276 -0.763655
Vertex 83  0.248693 -1.51766 -1.41324
Vertex 84  1.23129 -0.617571 0.679484
Vertex 85  0.897953 -0.44073 1.11578
Vertex 86  -0.606991 -1.45808 1.30923
Vertex 87  -1.18555 -1.11034 0.856186
Vertex 88  -1.01781 -3.64873 -0.17159
Vertex 89  1.26479 -0.303241 0.568299
Vertex 90  0.00830706 -1.16785 1.45001
Vertex 91  -1.31689 -1.80613 -0.519598
Vertex 92  -1.22487 -2.74276 -0.042701
Vertex 93  -0.985346 -3.65643 0.273975
Vertex 94  1.30936 -0.219298 -0.357228
Vertex 95  -0.362314 -1.37185 -1.36487
Vertex 96  -0.853079 -1.44769 -1.14772
Vertex 97  0.657945 -0.235646 1.1558
Vertex 98  0.61388 -0.49856 -1.30898
Vertex 99  -0.101614 -0.415478 -1.44052
Vertex 100  0.259169 -0.356625 1.41363
Vertex 101  -0.39879 -0.444281 1.34321
Vertex 102  -0.861898 -0.425838 1.12567
Vertex 103  -1.43703 -1.27761 0.16424
Vertex 104  0.635669 -0.254085 -1.22775
Vertex 105  -0.393798 -0.230706 1.28575
Vertex 106  -0.699626 -0.451342 -1.24827
Vertex 107  -1.30779 -0.59411 -0.719246
Vertex 108  -1.24812 -0.441605 0.658729
Vertex 109  -0.815746 -0.31188 -1.09731
Vertex 110  -0.197962 -0.268954 -1.29526
Vertex 111  -1.06206 -0.284939 0.788274
Vertex 112  -1.45229 -0.475386 0.0580286
Vertex 113  -1.26533 -0.279042 0.327244
Vertex 114  -1.28638 -0.251487 -0.41536
Vertex 115  2.17017 -0.800161 -0.129454
Vertex 116  1.88954 -1.83894 0.643911
Vertex 117  1.83759 -1.82613 -0.715265
Vertex 118  2.20156 -0.0780415 0.622372
Vertex 119  1.97168 -1.82941 -0.0980301
Vertex 120  2.06305 -0.195699 -0.927511
Vertex 121  1.5302 -1.826 -1.24783
Vertex 122  2.3357 1.4342 -0.283221
Vertex 123  1.65034 -0.808473 1.43031
Vertex 124  1.53074 -0.0592434 -1.70169
Vertex 125  1.49823 -1.8421 1.27532
Vertex 126  1.02386 -1.83261 -1.70475
Vertex 127  1.00708 -1.8215 1.70687
Vertex 128  1.95621 1.29502 -1.2055
Vertex 129  0.568462 -0.493331 -2.16566
Vertex 130  0.349174 -1.83217 -1.93612
Vertex 131  1.82821 0.709136 1.41807
Vertex 132  0.360233 -1.83812 1.94301
Vertex 133  2.19171 1.46376 0.67693
Vertex 134  0.597045 -0.965283 2.01935
Vertex 135  2.2054 2.02683 0.280779
Vertex 136  1.06508 -0.27454 1.94797
Vertex 137  -0.28641 -1.8295 -1.96962
Vertex 138  2.02226 2.02131 -0.956524
Vertex 139  1.35634 0.816932 1.85161
Vertex 140  -0.299539 -1.83012 1.9578
Vertex 141  1.51339 1.73245 -1.69474
Vertex 142  1.83892 1.95856 1.32671
Vertex 143  0.158585 0.157064 2.27782
Vertex 144  2.00198 2.10198 0.607488
Vertex 145  0.970645 1.10345 -2.09259
Vertex 146  -0.293885 -0.325528 -2.19775
Vertex 147  -1.08242 -1.84516 -1.6836
Vertex 148  -0.56272 -0.0429264 2.21273
Vertex 149  -0.828298 -0.752958 -1.98887
Vertex 150  2.06856 2.09625 -0.561676
Vertex 151  1.56362 2.06512 1.47057
Vertex 152  0.750793 0.676305 2.13879
Vertex 153  -1.45406 -0.65442 1.66004
Vertex 154  -1.59572 -0.481459 -1.56666
Vertex 155  1.21082 1.76446 1.89536
Vertex 156  -1.076 -1.83384 1.70955
Vertex 157  -1.71937 -1.84078 -1.02051
Vertex 158  0.883279 1.97089 -2.04228
Vertex 159  0.673481 1.8065 2.17608
Vertex 160  0.140429 1.24387 -2.31914
Vertex 161  1.39792 2.10326 -1.62848
Vertex 162  0.828669 2.06797 1.94879
Vertex 163  -0.652522 0.86283 -2.17617
Vertex 164  -0.0705812 1.80512 2.28682
Vertex 165  -1.31972 0.81695 1.87207
Vertex 166  -2.02237 -0.869214 0.761683
Vertex 167  -2.03749 -0.516993 -0.816279
Vertex 168  -1.07764 1.21936 -2.07612
Vertex 169  0.0282348 2.10444 2.11816
Vertex 170  -0.90868 1.43936 2.11218
Vertex 171  -2.01363 -1.84496 -0.161551
Vertex 172  -0.110146 1.87733 -2.27005
Vertex 173  -1.89735 0.964818 1.34082
Vertex 174  -1.82739 -1.852 0.916103
Vertex 175  0.390208 2.07725 -2.10323
Vertex 176  -2.20184 -0.485632 -0.0397159
Vertex 177  -1.06637 1.96243 -1.94382
Vertex 178  -0.811653 2.00454 2.03743
Vertex 179  -1.69615 1.00362 -1.51973
Vertex 180  -1.02797 2.0748 1.87147
Vertex 181  -2.2777 0.947679 0.502033
Vertex 182  -2.10724 1.08171 -0.953776
Vertex 183  -1.57334 1.92628 1.60237
Vertex 184  -0.614832 2.06346 -2.05154
Vertex 185  -2.25006 0.708396 -0.361985
Vertex 186  -1.7027 1.77937 -1.4764
Vertex 187  -2.01681 2.03518 -0.896623
Vertex 188  -1.85106 2.08252 1.13344
Vertex 189  -2.00495 1.66837 0.983987
Vertex 190  -1.43433 2.0715 -1.58065
Vertex 191  -2.25428 1.69397 -0.255665
Vertex 192  -1.90668 2.06128 -0.892755
Vertex 193  -2.1482 2.05074 0.473576
Vertex 194  -2.15169 2.07537 -0.064044
Face 1  2 1 3
Face 2  4 3 1
Face 3  6 1 2
Face 4  2 3 7
Face 5  4 5 3
Face 6  2 8 6
Face 7  4 1 6
Face 8  3 9 7
Face 9  7 11 2
Face 10  4 13 5
Face 11  11 7 15
Face 12  4 12 13
Face 13  9 15 7
Face 14  8 16 14
Face 15  8 14 6
Face 16  2 11 8
Face 17  17 12 6
Face 18  17 6 14
Face 19  18 13 12
Face 20  20 8 11
Face 21  12 17 18
Face 22  16 8 20
Face 23  18 17 24
Face 24  13 22 10
Face 25  23 17 14
Face 26  23 24 17
Face 27  23 14 16
Face 28  23 26 24
Face 29  10 25 19
Face 30  25 10 22
Face 31  27 22 13
Face 32  18 27 13
Face 33  15 28 11
Face 34  28 21 11
Face 35  18 24 31
Face 36  9 19 29
Face 37  27 18 31
Face 38  26 23 32
Face 39  27 25 22
Face 40  20 30 16
Face 41  29 19 34
Face 42  16 35 32
Face 43  21 28 36
Face 44  36 30 21
Face 45  33 34 19
Face 46  25 27 38
Face 47  34 28 29
Face 48  41 36 28
Face 49  26 39 31
Face 50  25 38 37
Face 51  27 31 40
Face 52  28 34 41
Face 53  42 30 36
Face 54  42 35 30
Face 55  42 44 35
Face 56  41 45 36
Face 57  38 27 40
Face 58  39 40 31
Face 59  40 47 38
Face 60  34 43 41
Face 61  42 45 48
Face 62  46 44 49
Face 63  37 38 47
Face 64  51 37 47
Face 65  41 43 51
Face 66  45 41 51
Face 67  51 48 45
Face 68  40 50 47
Face 69  47 50 51
Face 70  51 50 49
Face 71  53 52 55
Face 72  53 54 52
Face 73  54 53 57
Face 74  56 59 55
Face 75  58 54 57
Face 76  65 63 61
Face 77  54 67 52
Face 78  54 71 67
Face 79  56 52 69
Face 80  73 68 75
Face 81  74 58 63
Face 82  76 79 60
Face 83  66 83 63
Face 84  71 81 67
Face 85  71 74 82
Face 86  79 76 85
Face 87  82 81 71
Face 88  84 69 81
Face 89  60 79 64
Face 90  94 81 82
Face 91  81 94 89
Face 92  81 89 84
Face 93  69 84 76
Face 94  79 90 64
Face 95  88 91 77
Face 96  84 85 76
Face 97  86 75 68
Face 98  98 82 74
Face 99  77 91 70
Face 100  104 94 82
Face 101  98 74 83
Face 102  87 75 86
Face 103  95 66 96
Face 104  104 82 98
Face 105  83 99 98
Face 106  98 99 104
Face 107  83 95 99
Face 108  100 90 79
Face 109  90 100 101
Face 110  101 86 90
Face 111  87 86 102
Face 112  92 80 103
Face 113  70 91 107
Face 114  70 107 96
Face 115  92 103 91
Face 116  87 102 108
Face 117  106 95 96
Face 118  95 106 99
Face 119  101 102 86
Face 120  106 96 107
Face 121  101 105 102
Face 122  109 110 106
Face 123  107 109 106
Face 124  108 102 111
Face 125  112 103 108
Face 126  91 112 107
Face 127  107 112 114
Face 128  108 113 112
Face 129  114 112 113
Face 130  116 119 115
Face 131  117 115 119
Face 132  121 120 117
Face 133  121 124 120
Face 134  127 125 123
Face 135  115 122 118
Face 136  116 118 123
Face 137  120 122 115
Face 138  126 124 121
Face 139  124 126 129
Face 140  130 129 126
Face 141  123 118 131
Face 142  122 133 118
Face 143  134 127 136
Face 144  122 135 133
Face 145  118 133 131
Face 146  123 131 136
Face 147  127 123 136
Face 148  138 122 128
Face 149  129 130 137
Face 150  128 122 120
Face 151  128 124 141
Face 152  124 129 145
Face 153  146 129 137
Face 154  142 131 133
Face 155  136 131 139
Face 156  144 142 135
Face 157  137 147 149
Face 158  141 161 138
Face 159  144 151 142
Face 160  140 148 156
Face 161  134 136 152
Face 162  156 148 153
Face 163  161 150 138
Face 164  140 143 148
Face 165  139 142 155
Face 166  149 147 154
Face 167  145 158 141
Face 168  142 151 155
Face 169  155 159 139
Face 170  152 139 159
Face 171  147 157 154
Face 172  161 141 158
Face 173  143 152 159
Face 174  151 162 155
Face 175  160 158 145
Face 176  143 159 164
Face 177  161 158 175
Face 178  160 129 146
Face 179  153 148 165
Face 180  169 159 162
Face 181  172 158 160
Face 182  163 146 149
Face 183  149 168 163
Face 184  148 170 165
Face 185  160 146 163
Face 186  173 153 165
Face 187  158 172 175
Face 188  160 163 172
Face 189  172 184 175
Face 190  168 172 163
Face 191  179 168 154
Face 192  164 178 170
Face 193  164 169 178
Face 194  177 172 168
Face 195  177 184 172
Face 196  182 179 154
Face 197  154 167 182
Face 198  181 176 166
Face 199  184 177 190
Face 200  181 166 173
Face 201  168 179 186
Face 202  180 188 183
Face 203  183 173 165
Face 204  182 186 179
Face 205  176 185 167
Face 206  173 183 189
Face 207  187 190 186
Face 208  182 167 185
Face 209  189 181 173
Face 210  187 186 182
Face 211  190 187 192
Face 212  185 176 181
Face 213  191 182 185
Face 214  189 183 188
Face 215  187 194 192
Face 216  182 191 187
Face 217  181 189 193
Face 218  191 194 187
Face 219  189 188 193
Face 220  193 188 194
Face 221  56 55 52
Face 222  180 178 169
Face 223  97 105 100
Face 224  133 135 142
Face 225  62 64 72
Face 226  75 78 73
Face 227  171 174 166
Face 228  181 191 185
Face 229  105 101 100
Face 230  152 136 139
Face 231  80 87 103
Face 232  171 167 157
Face 233  116 115 118
Face 234  131 142 139
Face 235  106 110 99
Face 236  164 170 148
Face 237  10 19 9
Face 238  156 153 174
Face 239  120 115 117
Face 240  132 127 134
Face 241  56 60 59
Face 242  93 92 88
Face 243  171 176 167
Face 244  73 72 68
Face 245  150 144 135
Face 246  104 99 110
Face 247  72 64 68
Face 248  108 103 87
Face 249  137 149 146
Face 250  154 168 149
Face 251  113 108 111
Face 252  23 16 32
Face 253  112 91 103
Face 254  135 122 138
Face 255  129 160 145
Face 256  75 87 80
Face 257  109 107 114
Face 258  60 69 76
Face 259  170 183 165
Face 260  105 111 102
Face 261  78 80 93
Face 262  63 83 74
Face 263  93 80 92
Face 264  135 138 150
Face 265  65 66 63
Face 266  59 60 62
Face 267  64 62 60
Face 268  141 124 145
Face 269  12 4 6
Face 270  128 120 124
Face 271  168 186 177
Face 272  190 177 186
Face 273  60 56 69
Face 274  45 42 36
Face 275  33 19 25
Face 276  44 46 32
Face 277  51 49 48
Face 278  164 159 169
Face 279  50 40 39
Face 280  64 90 68
Face 281  86 68 90
Face 282  21 30 11
Face 283  20 11 30
Face 284  67 81 69
Face 285  152 143 134
Face 286  181 193 191
Face 287  194 191 193
Face 288  10 5 13
Face 289  32 39 26
Face 290  43 37 51
Face 291  49 50 46
Face 292  5 10 3
Face 293  9 3 10
Face 294  33 43 34
Face 295  54 58 71
Face 296  74 71 58
Face 297  162 159 155
Face 298  31 24 26
Face 299  30 35 16
Face 300  134 143 132
Face 301  140 132 143
Face 302  58 61 63
Face 303  58 57 61
Face 304  141 138 128
Face 305  170 178 183
Face 306  180 183 178
Face 307  166 176 171
Face 308  80 78 75
Face 309  148 143 164
Face 310  167 154 157
Face 311  83 66 95
Face 312  66 70 96
Face 313  33 25 43
Face 314  37 43 25
Face 315  116 123 125
Face 316  39 32 50
Face 317  46 50 32
Face 318  9 29 15
Face 319  28 15 29
Face 320  48 49 44
Face 321  91 88 92
Face 322  69 52 67
Face 323  97 100 85
Face 324  79 85 100
Face 325  32 35 44
Face 326  89 85 84
Face 327  89 97 85
Face 328  44 42 48
Face 329  65 77 66
Face 330  70 66 77
Face 331  153 173 174
Face 332  166 174 173
Edge 50 51 {sharp}