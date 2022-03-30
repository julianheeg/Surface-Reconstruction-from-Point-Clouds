# |Created using:
# | Subdivfit -mf - -fi cactus.3337.pts -record cactus.nsub2.crep1e-5p.rec
# |  -crep 1e-5 -csharp .2e-5 -reconstruct
# |Initial mesh:
# |Genus: c=1 b=0  v=157 f=310 e=465  genus=0  sharpe=62 cuspv=0
# |3337 points read
# |Starting reconstruction sequence
# | crep=1e-05, csharp=2e-06
# | internal xform: F 1  1 0 0  0 1 0  0 0 1  0 0 0  0
# |
# |fgfit_before: v=157 nse=62/465  edis=0.019029 etot=0.020723
# |fgfit_after : v=157 nse=62/465  edis=0.000327357 etot=0.00202136
# | (_fgfit:                368.25)
# |
# |Stoc, crep=1e-05 csharp=2e-06 wcrep=1e-05 wcsharp=2e-06
# |stoc_before: v=157 nse=62/465  edis=0.000327356 etot=0.00202136
# |it 637, last search: 16 wasted attempts
# |New mesh:
# |Genus: c=1 b=0  v=100 f=196 e=294  genus=0  sharpe=49 cuspv=0
# |Summary of attempts and results:
# |                          ecol      espl      eswa      esha
# |      total_attempts       637         0         0         0
# |             success        57         0         0         0
# |     positive_energy       331         0         0         0
# |        bad_dihedral        57         0         0         0
# |           bad_sharp       190         0         0         0
# |        illegal_move         2         0         0         0
# | last cedis=0.000487213 cetot=0.00158521
# |stoc_after : v=100 nse=49/294  edis=0.000485609 etot=0.00158361
# | (_stoc:                1975.28)
# |
# |fgfit_before: v=100 nse=49/294  edis=0.000485614 etot=0.00158361
# |fgfit_after : v=100 nse=49/294  edis=0.000415788 etot=0.00151379
# | (_fgfit:                102.83)
# |
# |Stoc, crep=1e-05 csharp=2e-06 wcrep=1e-05 wcsharp=2e-06
# |stoc_before: v=100 nse=49/294  edis=0.000415788 etot=0.00151379
# |it 586, last search: 22 wasted attempts
# |New mesh:
# |Genus: c=1 b=0  v=100 f=196 e=294  genus=0  sharpe=30 cuspv=0
# |Summary of attempts and results:
# |                          ecol      espl      eswa      esha
# |      total_attempts         0         0         0       586
# |             success         0         0         0        41
# |     positive_energy         0         0         0       274
# |        bad_dihedral         0         0         0         0
# |           bad_sharp         0         0         0       271
# |        illegal_move         0         0         0         0
# | last cedis=0.000286919 cetot=0.00134692
# |stoc_after : v=100 nse=30/294  edis=0.000286915 etot=0.00134692
# | (_stoc:                 966.23)
# |
# |fgfit_before: v=100 nse=30/294  edis=0.000286918 etot=0.00134692
# |fgfit_after : v=100 nse=30/294  edis=0.000269612 etot=0.00132961
# | (_fgfit:                 98.25)
# |
# |Stoc, crep=1e-05 csharp=2e-06 wcrep=1e-05 wcsharp=2e-06
# |stoc_before: v=100 nse=30/294  edis=0.000269611 etot=0.00132961
# |it 398, last search: 28 wasted attempts
# |New mesh:
# |Genus: c=1 b=0  v=99 f=194 e=291  genus=0  sharpe=29 cuspv=0
# |Summary of attempts and results:
# |                          ecol      espl      eswa      esha
# |      total_attempts       398         0       388       397
# |             success         1         0         5         9
# |     positive_energy       330         0       301       197
# |        bad_dihedral        64         0        79         0
# |           bad_sharp         0         0         0       191
# |        illegal_move         3         0         3         0
# | last cedis=0.000255201 cetot=0.0013032
# |stoc_after : v=99 nse=29/291  edis=0.000255199 etot=0.0013032
# | (_stoc:                2804.90)
# |
# |fgfit_before: v=99 nse=29/291  edis=0.000255201 etot=0.0013032
# |fgfit_after : v=99 nse=29/291  edis=0.000243873 etot=0.00129187
# | (_fgfit:                102.10)
# | (Subdivfit:            6418.90)
# |Summary of timers (cpu=mips host=grail.cs.washington.edu):
# | ___submesh:         (1677  )    0.40:4.92     av=     0.97   sum=  1631.72
# | ____gmakeSpatial:   (10    )    5.03:6.88     av=     5.47   sum=    54.73
# | ____gspatialproject:(10    )    2.22:3.33     av=     2.47   sum=    24.68
# | ___gallproject:     (10    )    7.30:9.98     av=     8.00   sum=    79.97
# | ___computegrad:     (263   )    0.53:0.63     av=     0.56   sum=   147.73
# | ___gneighproject:   (493   )    0.78:1.10     av=     0.84   sum=   415.92
# | __fgfit_iter:       (70    )    6.78:12.48    av=     8.88   sum=   621.68
# | _fgfit:             (4     )   98.25:368.25   av=   167.86   sum=   671.43
# | _initial_fit:       (3     )    9.87:13.02    av=    10.94   sum=    32.83
# | __lattempt:         (1621  )    0.00:18.05    av=     3.51   sum=  5683.32
# | ____lmakespatial:   (1667  )    0.00:0.53     av=     0.13   sum=   214.68
# | ____lspatialproject:(1667  )    0.00:0.47     av=     0.08   sum=   136.68
# | ___lallproject:     (1667  )    0.00:1.00     av=     0.21   sum=   353.20
# | ____lneighproject:  (7665  )    0.08:0.80     av=     0.25   sum=  1952.38
# | ____lcombinations:  (7665  )    0.00:0.15     av=     0.05   sum=   393.37
# | _____qrdLLS:        (7665  )    0.00:0.23     av=     0.06   sum=   467.80
# | ____lsolve:         (7665  )    0.00:0.28     av=     0.08   sum=   629.97
# | ___loptimize:       (7665  )    0.12:1.15     av=     0.41   sum=  3162.03
# | __tryecol:          (840   )    1.08:10.50    av=     4.27   sum=  3588.85
# | _stoc:              (3     )  966.23:2804.90  av=  1915.47   sum=  5746.42
# | __tryesha:          (521   )    1.07:9.08     av=     2.87   sum=  1495.80
# | __tryeswa:          (306   )    1.03:4.17     av=     1.87   sum=   573.22
# | Subdivfit:          (1     )        :         av=  6418.90   sum=  6418.90
# |Summary of statistics:
# |Sospobcells:(153568 )          1:19          av=3.02784     sd=1.84232
# |Sssncellsv: (175605 )          1:180         av=2.23166     sd=4.8576
# |Sssnelemsv: (175605 )          1:133         av=15.3992     sd=10.3855
# |Sospcelln:  (58712  )          1:63          av=7.91968     sd=6.04194
# |Sprojquick: (8830924)          0:1           av=0.519042    sd=0.499637
# |Sprojnei:   (4247300)          0:7           av=0.0961168   sd=0.310136
# |Sprojf:     (4247300)          4:56          av=10.6554     sd=2.09099
# |Sprojunexp: (392159 )          0:1           av=0.000591597 sd=0.0243156
# |Sneval:     (70     )          6:9           av=7.04286     sd=0.769636
# |Stmin:      (70     )  0.0146723:0.0770622   av=0.0368712   sd=0.0109039
# |Ssetfrem:   (1667   )        192:1040        av=517.221     sd=193.3
# |Ssetvrem:   (1667   )         96:544         av=255.01      sd=96.2203
# |Secolpts:   (840    )        420:1793        av=1033.47     sd=320.17
# |Secolmf:    (840    )         31:95          av=64.3333     sd=13.3286
# |Secolmv:    (840    )          6:15          av=9.09762     sd=1.45901
# |Secolsmv:   (840    )        263:822         av=550.082     sd=115.929
# |Soptnit:    (1549   )          2:10          av=3.65784     sd=2.11715
# |Soptnig:    (116    )         11:12          av=11.0948     sd=0.294248
# |Sechange:   (113    )-1.80489e-05:-7.08835e-07 av=-5.57011e-06 sd=4.23299e-06
# |Seshapts:   (521    )        497:1784        av=1039.19     sd=328.901
# |Seshamf:    (521    )         33:90          av=61.6756     sd=14.34
# |Seshamv:    (521    )          7:14          av=9.90595     sd=1.37728
# |Seshasmv:   (521    )        279:771         av=523.82      sd=123.911
# |Seswapts:   (306    )        397:1458        av=712.212     sd=196.694
# |Seswamf:    (306    )         25:58          av=42.0556     sd=7.31449
# |Seswamv:    (306    )          4:4           av=4           sd=0
# |Seswasmv:   (306    )        215:512         av=368.18      sd=66.1357
# Created using:
#  Filtermesh cactus.nsub2.crep1e-5p.0.m -renumber
# (Timing on cpu=sgi host=belvedere.microsoft.com)
#  (_readmesh:               0.00)
#  (_renumber:               0.02)
#  (Filtermesh:              0.02)
Vertex 1  0.504734 0.448666 0.546374
Vertex 2  0.466731 0.458205 0.529447
Vertex 3  0.433771 0.542279 0.830792
Vertex 4  0.43508 0.488235 0.833311
Vertex 5  0.46041 0.464387 0.488209
Vertex 6  0.484807 0.429791 0.544127
Vertex 7  0.455069 0.380114 0.523187
Vertex 8  0.460559 0.572863 0.599581
Vertex 9  0.48586 0.585207 0.577426
Vertex 10  0.538514 0.573026 0.599391
Vertex 11  0.569129 0.506024 0.773072
Vertex 12  0.457984 0.689417 0.634936
Vertex 13  0.475189 0.615764 0.579941
Vertex 14  0.43755 0.486629 0.0999444
Vertex 15  0.535254 0.460414 0.522845
Vertex 16  0.540092 0.382811 0.515628
Vertex 17  0.551543 0.469836 0.0999259
Vertex 18  0.517477 0.45139 0.465738
Vertex 19  0.540191 0.467724 0.494483
Vertex 20  0.486656 0.353243 0.588902
Vertex 21  0.525824 0.362903 0.478842
Vertex 22  0.478291 0.391597 0.472168
Vertex 23  0.485187 0.4523 0.467353
Vertex 24  0.473186 0.640992 0.663575
Vertex 25  0.514834 0.584375 0.576837
Vertex 26  0.56133 0.550366 0.795747
Vertex 27  0.467188 0.293469 0.540282
Vertex 28  0.470029 0.457823 0.832163
Vertex 29  0.447687 0.462407 0.863
Vertex 30  0.541409 0.64247 0.624976
Vertex 31  0.529986 0.581548 0.0998924
Vertex 32  0.489715 0.587231 0.0997658
Vertex 33  0.53726 0.574962 0.631383
Vertex 34  0.461964 0.32225 0.599045
Vertex 35  0.51182 0.448583 0.0998711
Vertex 36  0.466542 0.456109 0.0998732
Vertex 37  0.5227 0.30374 0.533639
Vertex 38  0.51974 0.38941 0.551998
Vertex 39  0.546678 0.278357 0.616964
Vertex 40  0.556734 0.469159 0.848087
Vertex 41  0.526149 0.321684 0.624457
Vertex 42  0.497518 0.231265 0.625568
Vertex 43  0.459048 0.264113 0.65353
Vertex 44  0.502638 0.699369 0.610273
Vertex 45  0.503103 0.588866 0.659831
Vertex 46  0.460103 0.582059 0.857349
Vertex 47  0.561018 0.55358 0.10004
Vertex 48  0.571738 0.521559 0.856072
Vertex 49  0.547754 0.496146 0.88866
Vertex 50  0.465875 0.307634 0.644835
Vertex 51  0.483208 0.732899 0.671728
Vertex 52  0.536447 0.718499 0.660522
Vertex 53  0.452427 0.716766 0.722984
Vertex 54  0.544902 0.570105 0.820658
Vertex 55  0.512119 0.319654 0.667976
Vertex 56  0.493266 0.327954 0.83416
Vertex 57  0.483198 0.562702 0.89291
Vertex 58  0.480835 0.511467 0.922246
Vertex 59  0.512154 0.593115 0.859038
Vertex 60  0.484859 0.574045 0.824214
Vertex 61  0.556137 0.558779 0.883441
Vertex 62  0.533078 0.259051 0.661635
Vertex 63  0.503234 0.243733 0.82236
Vertex 64  0.464176 0.302932 0.673166
Vertex 65  0.462907 0.263248 0.829133
Vertex 66  0.453029 0.732268 0.839212
Vertex 67  0.455695 0.294172 0.832495
Vertex 68  0.539856 0.711535 0.716164
Vertex 69  0.513816 0.687186 0.731287
Vertex 70  0.492009 0.68349 0.73962
Vertex 71  0.536411 0.29587 0.709854
Vertex 72  0.541811 0.263731 0.835044
Vertex 73  0.532361 0.750799 0.797295
Vertex 74  0.475105 0.756413 0.733343
Vertex 75  0.516066 0.676393 0.83414
Vertex 76  0.477159 0.671202 0.840311
Vertex 77  0.429757 0.530333 0.0994968
Vertex 78  0.468827 0.24855 0.828404
Vertex 79  0.486024 0.328536 0.855033
Vertex 80  0.490128 0.762683 0.849478
Vertex 81  0.538142 0.312103 0.852135
Vertex 82  0.541907 0.694653 0.836993
Vertex 83  0.543867 0.73892 0.862432
Vertex 84  0.516174 0.690979 0.875723
Vertex 85  0.479716 0.731513 0.88095
Vertex 86  0.570631 0.510343 0.0999907
Vertex 87  0.452184 0.570465 0.0975794
Vertex 88  0.542714 0.465414 0.682723
Vertex 89  0.464814 0.576567 0.634202
Vertex 90  0.522987 0.627353 0.579873
Vertex 91  0.517746 0.629171 0.661442
Vertex 92  0.506242 0.445498 0.840567
Vertex 93  0.514436 0.450906 0.873825
Vertex 94  0.424485 0.532308 0.8614
Vertex 95  0.515645 0.756374 0.714239
Vertex 96  0.466112 0.69063 0.852914
Vertex 97  0.468822 0.282751 0.883573
Vertex 98  0.533787 0.286345 0.87615
Vertex 99  0.510241 0.237437 0.859427
Face 1  2 7 6
Face 2  12 13 8
Face 3  22 21 27
Face 4  33 10 30
Face 5  15 38 16
Face 6  26 48 11
Face 7  59 46 57
Face 8  42 62 63
Face 9  79 56 67
Face 10  82 83 84
Face 11  4 14 5
Face 12  8 3 89
Face 13  6 7 20
Face 14  20 38 6
Face 15  23 22 5
Face 16  8 89 12
Face 17  9 8 13
Face 18  46 45 89
Face 19  45 24 89
Face 20  18 17 19
Face 21  18 23 35
Face 22  13 25 9
Face 23  25 13 90
Face 24  89 24 12
Face 25  9 25 32
Face 26  25 31 32
Face 27  21 18 19
Face 28  38 20 41
Face 29  21 37 27
Face 30  27 34 7
Face 31  20 7 34
Face 32  27 7 22
Face 33  23 36 35
Face 34  29 4 28
Face 35  13 44 90
Face 36  52 90 44
Face 37  24 45 91
Face 38  31 25 10
Face 39  92 29 28
Face 40  29 92 93
Face 41  92 40 93
Face 42  94 4 29
Face 43  90 52 30
Face 44  33 91 45
Face 45  30 91 33
Face 46  33 26 10
Face 47  4 94 3
Face 48  40 88 11
Face 49  48 40 11
Face 50  58 29 93
Face 51  42 27 37
Face 52  27 43 34
Face 53  34 50 20
Face 54  58 94 29
Face 55  69 24 91
Face 56  37 39 42
Face 57  40 48 49
Face 58  50 55 20
Face 59  20 55 41
Face 60  50 43 64
Face 61  50 34 43
Face 62  57 94 58
Face 63  44 12 51
Face 64  24 70 53
Face 65  31 10 47
Face 66  60 59 45
Face 67  42 39 62
Face 68  38 41 39
Face 69  41 55 71
Face 70  61 58 49
Face 71  48 61 49
Face 72  56 50 64
Face 73  94 57 46
Face 74  70 24 69
Face 75  46 3 94
Face 76  41 71 39
Face 77  58 61 57
Face 78  67 64 65
Face 79  56 64 67
Face 80  51 53 74
Face 81  33 54 26
Face 82  59 60 46
Face 83  59 57 61
Face 84  52 73 68
Face 85  74 95 51
Face 86  95 74 73
Face 87  8 87 3
Face 88  54 59 61
Face 89  62 39 71
Face 90  52 95 73
Face 91  72 63 62
Face 92  73 74 80
Face 93  76 96 66
Face 94  96 85 66
Face 95  65 97 67
Face 96  67 97 79
Face 97  75 69 82
Face 98  69 68 82
Face 99  73 82 68
Face 100  76 84 96
Face 101  76 75 84
Face 102  84 85 96
Face 103  85 84 83
Face 104  87 77 3
Face 105  79 97 98
Face 106  81 79 98
Face 107  78 65 63
Face 108  78 97 65
Face 109  84 75 82
Face 110  73 83 82
Face 111  85 83 80
Face 112  80 83 73
Face 113  98 72 81
Face 114  99 78 63
Face 115  72 99 63
Face 116  99 97 78
Face 117  97 99 98
Face 118  99 72 98
Face 119  12 44 13
Face 120  2 6 1
Face 121  38 1 6
Face 122  40 49 93
Face 123  58 93 49
Face 124  38 39 16
Face 125  80 66 85
Face 126  25 90 10
Face 127  30 10 90
Face 128  21 19 16
Face 129  88 17 11
Face 130  68 30 52
Face 131  71 81 72
Face 132  56 81 55
Face 133  56 79 81
Face 134  51 12 53
Face 135  63 65 42
Face 136  43 42 65
Face 137  71 55 81
Face 138  89 3 46
Face 139  64 43 65
Face 140  14 36 5
Face 141  23 5 36
Face 142  66 80 53
Face 143  74 53 80
Face 144  42 43 27
Face 145  30 68 91
Face 146  69 91 68
Face 147  53 76 66
Face 148  48 26 61
Face 149  54 61 26
Face 150  11 17 86
Face 151  88 1 15
Face 152  33 45 54
Face 153  59 54 45
Face 154  56 55 50
Face 155  35 17 18
Face 156  70 76 53
Face 157  46 60 45
Face 158  10 26 47
Face 159  71 72 62
Face 160  2 5 7
Face 161  22 7 5
Face 162  12 24 53
Face 163  37 21 39
Face 164  16 39 21
Face 165  17 88 19
Face 166  15 19 88
Face 167  11 86 26
Face 168  47 26 86
Face 169  2 28 5
Face 170  4 5 28
Face 171  38 15 1
Face 172  3 77 4
Face 173  14 4 77
Face 174  19 15 16
Face 175  36 14 35
Face 176  17 35 14
Face 177  8 9 87
Face 178  32 87 9
Face 179  87 32 77
Face 180  86 17 32
Face 181  77 32 14
Face 182  17 14 32
Face 183  32 31 86
Face 184  47 86 31
Face 185  51 95 44
Face 186  52 44 95
Face 187  21 22 18
Face 188  23 18 22
Face 189  2 1 28
Face 190  92 28 1
Face 191  1 88 92
Face 192  40 92 88
Face 193  69 75 70
Face 194  76 70 75
Edge 1 15 {sharp}
Edge 1 2 {sharp}
Edge 2 5 {sharp}
Edge 5 23 {sharp}
Edge 8 9 {sharp}
Edge 8 89 {sharp}
Edge 9 25 {sharp}
Edge 10 25 {sharp}
Edge 10 33 {sharp}
Edge 14 77 {sharp}
Edge 14 36 {sharp}
Edge 15 19 {sharp}
Edge 17 35 {sharp}
Edge 17 86 {sharp}
Edge 18 19 {sharp}
Edge 18 23 {sharp}
Edge 20 55 {sharp}
Edge 31 47 {sharp}
Edge 31 32 {sharp}
Edge 32 87 {sharp}
Edge 33 45 {sharp}
Edge 35 36 {sharp}
Edge 45 89 {sharp}
Edge 47 86 {sharp}
Edge 50 55 {sharp}
Edge 66 80 {sharp}
Edge 77 87 {sharp}
Edge 80 83 {sharp}
Edge 84 85 {sharp}
