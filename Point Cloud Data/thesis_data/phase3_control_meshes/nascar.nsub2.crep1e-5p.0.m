# |Created using:
# | Subdivfit -mf - -fi nascar.20621.pts -crep 1e-5 -csharp .2e-5 -reconstruct
# |Initial mesh:
# |Genus: c=1 b=5  v=226 f=411 e=640  genus=0  sharpe=38 cuspv=0
# |20621 points read
# |Starting reconstruction sequence
# | crep=1e-05, csharp=2e-06
# | internal xform: F 1  1 0 0  0 1 0  0 0 1  0 0 0  0
# |
# |fgfit_before: v=226 nse=38/640  edis=0.0293979 etot=0.0317339
# |fgfit_after : v=226 nse=38/640  edis=0.00229058 etot=0.00462658
# | (_fgfit:                832.07)
# |
# |Stoc, crep=1e-05 csharp=2e-06 wcrep=1e-05 wcsharp=2e-06
# |stoc_before: v=226 nse=38/640  edis=0.00228871 etot=0.00462471
# |it 799, last search: 20 wasted attempts
# |New mesh:
# |Genus: c=1 b=5  v=181 f=321 e=505  genus=0  sharpe=35 cuspv=0
# |Summary of attempts and results:
# |                          ecol      espl      eswa      esha
# |      total_attempts       799         0         0         0
# |             success        45         0         0         0
# |     positive_energy       539         0         0         0
# |        bad_dihedral        95         0         0         0
# |           bad_sharp       100         0         0         0
# |        illegal_move        20         0         0         0
# | last cedis=0.0023447 cetot=0.0042247
# |stoc_after : v=181 nse=35/505  edis=0.00234396 etot=0.00422396
# | (_stoc:                3811.69)
# |
# |fgfit_before: v=181 nse=35/505  edis=0.00234397 etot=0.00422397
# |fgfit_after : v=181 nse=35/505  edis=0.00222787 etot=0.00410787
# | (_fgfit:                246.53)
# |
# |Stoc, crep=1e-05 csharp=2e-06 wcrep=1e-05 wcsharp=2e-06
# |stoc_before: v=181 nse=35/505  edis=0.00222785 etot=0.00410785
# |it 957, last search: 63 wasted attempts
# |New mesh:
# |Genus: c=1 b=5  v=181 f=321 e=505  genus=0  sharpe=48 cuspv=0
# |Summary of attempts and results:
# |                          ecol      espl      eswa      esha
# |      total_attempts         0         0         0       957
# |             success         0         0         0        53
# |     positive_energy         0         0         0       275
# |        bad_dihedral         0         0         0         0
# |           bad_sharp         0         0         0       559
# |        illegal_move         0         0         0        70
# | last cedis=0.00192911 cetot=0.00383511
# |stoc_after : v=181 nse=48/505  edis=0.00192643 etot=0.00383243
# | (_stoc:                1464.74)
# |
# |fgfit_before: v=181 nse=48/505  edis=0.00192642 etot=0.00383242
# |fgfit_after : v=181 nse=48/505  edis=0.00188965 etot=0.00379565
# | (_fgfit:                257.61)
# |
# |Stoc, crep=1e-05 csharp=2e-06 wcrep=1e-05 wcsharp=2e-06
# |stoc_before: v=181 nse=48/505  edis=0.00188965 etot=0.00379565
# |it 848, last search: 84 wasted attempts
# |New mesh:
# |Genus: c=1 b=5  v=175 f=310 e=488  genus=0  sharpe=52 cuspv=0
# |Summary of attempts and results:
# |                          ecol      espl      eswa      esha
# |      total_attempts       848         0       810       842
# |             success         6         0        21        32
# |     positive_energy       666         0       505       235
# |        bad_dihedral       159         0       225         0
# |           bad_sharp         0         0         0       519
# |        illegal_move        17         0        59        56
# | last cedis=0.00172551 cetot=0.00357951
# |stoc_after : v=175 nse=52/488  edis=0.00172528 etot=0.00357928
# | (_stoc:                6630.12)
# |
# |fgfit_before: v=175 nse=52/488  edis=0.00172526 etot=0.00357926
# |fgfit_after : v=175 nse=52/488  edis=0.00168985 etot=0.00354385
# | (_fgfit:                269.23)
# | (Subdivfit:           13512.96)
# |Summary of timers (cpu=sgi host=espresso.cs.washington.edu):
# | ___submesh:         (2641  )    0.18:3.45     av=     0.66   sum=  1736.41
# | ____gmakeSpatial:   (10    )    3.25:4.07     av=     3.47   sum=    34.75
# | ____gspatialproject:(10    )    9.26:12.01    av=    10.30   sum=   102.99
# | ___gallproject:     (10    )   12.55:15.53    av=    13.83   sum=   138.29
# | ___computegrad:     (290   )    1.28:1.54     av=     1.40   sum=   405.79
# | ___gneighproject:   (480   )    2.06:3.19     av=     2.27   sum=  1088.38
# | __fgfit_iter:       (70    )   16.99:30.67    av=    21.96   sum=  1536.98
# | _fgfit:             (4     )  246.53:832.07   av=   401.36   sum=  1605.44
# | _initial_fit:       (3     )   15.97:17.74    av=    16.68   sum=    50.04
# | ____lmakespatial:   (2631  )    0.00:0.17     av=     0.06   sum=   162.57
# | ____lspatialproject:(2631  )    0.01:0.74     av=     0.20   sum=   524.48
# | ___lallproject:     (2631  )    0.02:0.91     av=     0.26   sum=   689.08
# | ____lneighproject:  (10441 )    0.10:1.65     av=     0.53   sum=  5541.28
# | ____lcombinations:  (10441 )    0.02:0.28     av=     0.10   sum=  1032.56
# | _____qrdLLS:        (10441 )    0.00:0.46     av=     0.12   sum=  1255.72
# | ____lsolve:         (10441 )    0.01:0.54     av=     0.15   sum=  1589.22
# | ___loptimize:       (10441 )    0.14:2.48     av=     0.84   sum=  8727.96
# | __tryecol:          (1510  )    0.63:15.81    av=     5.44   sum=  8213.37
# | __lattempt:         (2604  )    0.00:28.34    av=     4.53   sum= 11806.28
# | _stoc:              (3     ) 1464.74:6630.12  av=  3968.85   sum= 11906.55
# | __tryesha:          (595   )    1.02:21.10    av=     4.28   sum=  2546.92
# | __tryeswa:          (526   )    0.70:8.99     av=     1.91   sum=  1005.02
# | Subdivfit:          (1     )        :         av= 13512.96   sum= 13512.96
# |Summary of statistics:
# |Sospobcells:(261216 )          1:11          av=2.33053     sd=1.09066
# |Sssncellsv: (1246439)          1:64          av=1.32564     sd=0.979145
# |Sssnelemsv: (1246439)          1:150         av=16.2112     sd=10.1981
# |Sospcelln:  (62023  )          1:80          av=9.81525     sd=8.13516
# |Sprojquick: (50502203)          0:1           av=0.535556    sd=0.498734
# |Sprojnei:   (23455430)          0:10          av=0.120755    sd=0.345594
# |Sprojf:     (23455430)          3:58          av=10.4325     sd=2.17378
# |Sprojunexp: (2691518)          0:1           av=0.000316178 sd=0.0177786
# |Sneval:     (70     )          6:9           av=6.85714     sd=0.687059
# |Stmin:      (70     ) 0.00519668:0.0181539   av=0.00946207  sd=0.00243518
# |Ssetfrem:   (2631   )        208:1040        av=668.041     sd=148.111
# |Ssetvrem:   (2631   )        116:537         av=350.68      sd=74.7652
# |Secolpts:   (1510   )       1145:7482        av=4103.76     sd=984.799
# |Secolmf:    (1510   )         19:100         av=62.5172     sd=14.5174
# |Secolmv:    (1510   )          3:14          av=9.11258     sd=1.73432
# |Secolsmv:   (1510   )        183:875         av=550.069     sd=123.517
# |Soptnit:    (2384   )          2:10          av=2.81208     sd=2.03431
# |Soptnig:    (164    )         11:12          av=11.0061     sd=0.0780869
# |Sechange:   (157    )-4.77982e-05:-8.2586e-07 av=-5.66172e-06 sd=5.73844e-06
# |Seshapts:   (595    )       2002:7117        av=4227.85     sd=966.873
# |Seshamf:    (595    )         21:97          av=67.6118     sd=12.8413
# |Seshamv:    (595    )          6:15          av=10.2773     sd=1.6233
# |Seshasmv:   (595    )        199:853         av=592.711     sd=110.57
# |Seswapts:   (526    )        903:4825        av=2762.94     sd=757.152
# |Seswamf:    (526    )         14:60          av=41.6027     sd=8.17056
# |Seswamv:    (526    )          4:4           av=4           sd=0
# |Seswasmv:   (526    )        133:533         av=371.74      sd=70.8669
# Created using:
#  Filtermesh nascar.nsub2.crep1e-5p.0.m -renumber
# (Timing on cpu=sgi host=belvedere.microsoft.com)
#  (_readmesh:               0.04)
#  (_renumber:               0.00)
#  (Filtermesh:              0.04)
Vertex 1  0.446448 0.108799 0.195097
Vertex 2  0.530427 0.107521 0.201024
Vertex 3  0.515336 0.0965792 0.175383
Vertex 4  0.57729 0.10644 0.175541
Vertex 5  0.466265 0.141134 0.207977
Vertex 6  0.441123 0.101364 0.177348
Vertex 7  0.607838 0.127422 0.201061
Vertex 8  0.564828 0.163132 0.214213
Vertex 9  0.374797 0.132242 0.20037
Vertex 10  0.445838 0.189992 0.2202
Vertex 11  0.622406 0.137148 0.203227
Vertex 12  0.638568 0.117594 0.170654
Vertex 13  0.61656 0.20116 0.218591
Vertex 14  0.493472 0.334238 0.238779
Vertex 15  0.366335 0.213077 0.215061
Vertex 16  0.620678 0.162001 0.207855
Vertex 17  0.374027 0.12242 0.176221
Vertex 18  0.444622 0.262957 0.230312
Vertex 19  0.650983 0.204919 0.173163
Vertex 20  0.668295 0.23393 0.201663
Vertex 21  0.63416 0.20902 0.21834
Vertex 22  0.56125 0.264343 0.233919
Vertex 23  0.339941 0.209606 0.17063
Vertex 24  0.352551 0.224363 0.220284
Vertex 25  0.339304 0.227496 0.19395
Vertex 26  0.522949 0.350045 0.24005
Vertex 27  0.340221 0.256037 0.213995
Vertex 28  0.367232 0.321664 0.228699
Vertex 29  0.422204 0.360252 0.239073
Vertex 30  0.656992 0.249297 0.228127
Vertex 31  0.617344 0.353953 0.237104
Vertex 32  0.448895 0.346518 0.233732
Vertex 33  0.498459 0.379931 0.259813
Vertex 34  0.346797 0.299906 0.228491
Vertex 35  0.661052 0.272808 0.212094
Vertex 36  0.356001 0.379676 0.224644
Vertex 37  0.46279 0.403658 0.269942
Vertex 38  0.58932 0.350882 0.235217
Vertex 39  0.383925 0.361387 0.231295
Vertex 40  0.329202 0.253782 0.202079
Vertex 41  0.403425 0.4116 0.264745
Vertex 42  0.563207 0.412621 0.275949
Vertex 43  0.341044 0.35883 0.173463
Vertex 44  0.653479 0.340363 0.210698
Vertex 45  0.645718 0.350512 0.22707
Vertex 46  0.645611 0.380901 0.23254
Vertex 47  0.501147 0.458713 0.297562
Vertex 48  0.660205 0.351471 0.179304
Vertex 49  0.354272 0.412644 0.22526
Vertex 50  0.43239 0.453356 0.289647
Vertex 51  0.65591 0.321747 0.149162
Vertex 52  0.596211 0.40956 0.264363
Vertex 53  0.541385 0.451036 0.290502
Vertex 54  0.348334 0.316537 0.131687
Vertex 55  0.392549 0.428318 0.266658
Vertex 56  0.435829 0.451821 0.299951
Vertex 57  0.347104 0.418412 0.144229
Vertex 58  0.623108 0.321538 0.0905637
Vertex 59  0.580821 0.469073 0.295341
Vertex 60  0.376956 0.421565 0.22801
Vertex 61  0.643867 0.414457 0.227663
Vertex 62  0.6311 0.415746 0.248987
Vertex 63  0.625577 0.444546 0.276856
Vertex 64  0.33725 0.472587 0.183475
Vertex 65  0.399731 0.474956 0.292215
Vertex 66  0.557065 0.522477 0.305861
Vertex 67  0.374853 0.309387 0.0931876
Vertex 68  0.38776 0.456622 0.293633
Vertex 69  0.406206 0.461516 0.292941
Vertex 70  0.575514 0.457101 0.300314
Vertex 71  0.559178 0.473344 0.300081
Vertex 72  0.353714 0.669347 0.12484
Vertex 73  0.415717 0.494894 0.302851
Vertex 74  0.454072 0.549834 0.30619
Vertex 75  0.660306 0.593608 0.189005
Vertex 76  0.649067 0.464587 0.138366
Vertex 77  0.602723 0.467586 0.298983
Vertex 78  0.343869 0.645828 0.200191
Vertex 79  0.347212 0.545715 0.216014
Vertex 80  0.372092 0.574194 0.227486
Vertex 81  0.399177 0.570428 0.302523
Vertex 82  0.572412 0.599945 0.305837
Vertex 83  0.360986 0.427095 0.117033
Vertex 84  0.357157 0.579054 0.228374
Vertex 85  0.623292 0.413606 0.229855
Vertex 86  0.621598 0.67884 0.0923808
Vertex 87  0.64437 0.57858 0.228084
Vertex 88  0.367758 0.715722 0.232345
Vertex 89  0.366093 0.413347 0.245231
Vertex 90  0.59799 0.560801 0.300491
Vertex 91  0.351593 0.623041 0.223063
Vertex 92  0.371514 0.587709 0.26104
Vertex 93  0.387427 0.590779 0.284915
Vertex 94  0.409656 0.643956 0.304844
Vertex 95  0.604897 0.571107 0.294579
Vertex 96  0.461914 0.666281 0.302388
Vertex 97  0.394859 0.588132 0.277232
Vertex 98  0.60832 0.608707 0.299673
Vertex 99  0.554437 0.64744 0.30064
Vertex 100  0.369609 0.63826 0.111703
Vertex 101  0.661094 0.641775 0.172392
Vertex 102  0.617598 0.568874 0.229782
Vertex 103  0.626829 0.594811 0.266805
Vertex 104  0.610625 0.593906 0.292291
Vertex 105  0.406679 0.749424 0.267082
Vertex 106  0.423403 0.659511 0.303593
Vertex 107  0.652269 0.641985 0.215562
Vertex 108  0.648189 0.705128 0.227577
Vertex 109  0.548486 0.681837 0.291254
Vertex 110  0.354962 0.726661 0.23045
Vertex 111  0.390965 0.67647 0.292041
Vertex 112  0.622976 0.683296 0.241249
Vertex 113  0.599597 0.661771 0.296487
Vertex 114  0.55372 0.725026 0.280002
Vertex 115  0.333705 0.733717 0.21584
Vertex 116  0.576064 0.667829 0.301536
Vertex 117  0.51194 0.768792 0.262291
Vertex 118  0.341675 0.657841 0.160179
Vertex 119  0.389726 0.630536 0.294021
Vertex 120  0.380021 0.699734 0.270552
Vertex 121  0.644681 0.626645 0.124346
Vertex 122  0.603978 0.643954 0.27089
Vertex 123  0.637024 0.684953 0.248789
Vertex 124  0.608803 0.67238 0.287332
Vertex 125  0.37842 0.660888 0.273002
Vertex 126  0.672167 0.730136 0.196511
Vertex 127  0.649977 0.67222 0.140141
Vertex 128  0.634327 0.718682 0.231633
Vertex 129  0.592998 0.669458 0.294442
Vertex 130  0.599985 0.671068 0.281081
Vertex 131  0.362303 0.730516 0.231806
Vertex 132  0.343333 0.77043 0.221436
Vertex 133  0.377544 0.682252 0.0971789
Vertex 134  0.361895 0.774825 0.242811
Vertex 135  0.377076 0.754272 0.247213
Vertex 136  0.667025 0.733334 0.211439
Vertex 137  0.63948 0.770055 0.239529
Vertex 138  0.634813 0.736825 0.231999
Vertex 139  0.329787 0.736155 0.199339
Vertex 140  0.603293 0.73241 0.267215
Vertex 141  0.49192 0.797541 0.242446
Vertex 142  0.351583 0.624554 0.086342
Vertex 143  0.624179 0.753596 0.243492
Vertex 144  0.61508 0.744658 0.264392
Vertex 145  0.600447 0.782062 0.242135
Vertex 146  0.623059 0.73977 0.245193
Vertex 147  0.348577 0.842615 0.185756
Vertex 148  0.396523 0.780227 0.240042
Vertex 149  0.654416 0.802899 0.212866
Vertex 150  0.385474 0.789818 0.242308
Vertex 151  0.625182 0.820538 0.236784
Vertex 152  0.370349 0.870603 0.23711
Vertex 153  0.558631 0.79205 0.244813
Vertex 154  0.43707 0.782133 0.25023
Vertex 155  0.66166 0.791829 0.174912
Vertex 156  0.639977 0.797693 0.097701
Vertex 157  0.637819 0.866243 0.212066
Vertex 158  0.5044 0.891031 0.234175
Vertex 159  0.34132 0.788406 0.160818
Vertex 160  0.377688 0.883421 0.235785
Vertex 161  0.374904 0.881683 0.229262
Vertex 162  0.551226 0.824781 0.240089
Vertex 163  0.647805 0.850085 0.170957
Vertex 164  0.623514 0.872092 0.231884
Vertex 165  0.524763 0.866163 0.238579
Vertex 166  0.631251 0.89356 0.180105
Vertex 167  0.618939 0.882801 0.232878
Vertex 168  0.360112 0.794869 0.101318
Vertex 169  0.427245 0.900348 0.207106
Vertex 170  0.62585 0.880925 0.227936
Vertex 171  0.368987 0.855285 0.113729
Vertex 172  0.628942 0.858845 0.109682
Vertex 173  0.615388 0.895371 0.208493
Vertex 174  0.515883 0.902765 0.18446
Vertex 175  0.36998 0.895418 0.184153
Face 1  2 5 1
Face 2  1 17 6
Face 3  1 9 17
Face 4  10 5 8
Face 5  1 5 9
Face 6  16 13 8
Face 7  11 12 19
Face 8  9 23 17
Face 9  9 5 15
Face 10  13 16 21
Face 11  22 10 8
Face 12  24 9 15
Face 13  10 18 15
Face 14  40 24 27
Face 15  14 26 32
Face 16  24 40 25
Face 17  22 13 31
Face 18  30 21 20
Face 19  32 33 37
Face 20  26 14 31
Face 21  31 38 26
Face 22  36 34 28
Face 23  32 37 41
Face 24  32 41 39
Face 25  45 30 35
Face 26  45 46 31
Face 27  49 34 36
Face 28  48 35 51
Face 29  46 38 31
Face 30  43 54 40
Face 31  38 52 42
Face 32  59 42 52
Face 33  37 50 41
Face 34  50 47 56
Face 35  49 89 60
Face 36  41 50 65
Face 37  46 52 38
Face 38  65 68 55
Face 39  61 85 62
Face 40  63 52 46
Face 41  62 63 46
Face 42  70 47 53
Face 43  70 53 59
Face 44  66 56 71
Face 45  55 68 36
Face 46  47 70 71
Face 47  74 56 66
Face 48  73 68 69
Face 49  59 77 70
Face 50  57 67 54
Face 51  59 63 77
Face 52  70 66 71
Face 53  72 83 57
Face 54  84 79 49
Face 55  80 84 49
Face 56  73 74 81
Face 57  51 58 76
Face 58  86 76 58
Face 59  87 102 61
Face 60  87 61 44
Face 61  81 74 94
Face 62  98 90 95
Face 63  119 93 81
Face 64  105 106 96
Face 65  107 75 101
Face 66  44 107 87
Face 67  104 103 95
Face 68  94 106 111
Face 69  107 108 87
Face 70  87 103 104
Face 71  82 98 113
Face 72  110 115 91
Face 73  139 118 78
Face 74  76 121 101
Face 75  98 103 122
Face 76  124 113 98
Face 77  105 120 106
Face 78  120 111 106
Face 79  116 99 82
Face 80  116 109 96
Face 81  139 72 118
Face 82  132 139 115
Face 83  110 134 115
Face 84  131 110 88
Face 85  88 125 131
Face 86  126 136 107
Face 87  86 127 121
Face 88  128 108 138
Face 89  137 138 108
Face 90  112 128 123
Face 91  137 108 136
Face 92  143 138 137
Face 93  128 138 123
Face 94  144 123 138
Face 95  139 132 147
Face 96  142 100 133
Face 97  136 126 149
Face 98  144 138 143
Face 99  141 105 117
Face 100  149 137 136
Face 101  146 144 143
Face 102  146 130 144
Face 103  151 143 137
Face 104  145 146 143
Face 105  139 147 159
Face 106  126 155 149
Face 107  126 156 155
Face 108  141 154 105
Face 109  151 145 143
Face 110  150 148 154
Face 111  163 149 155
Face 112  152 160 161
Face 113  163 157 149
Face 114  157 164 149
Face 115  157 170 164
Face 116  167 164 170
Face 117  145 151 162
Face 118  162 153 145
Face 119  147 161 175
Face 120  171 159 147
Face 121  160 158 169
Face 122  157 166 170
Face 123  163 166 157
Face 124  174 175 169
Face 125  69 56 73
Face 126  151 167 162
Face 127  109 116 129
Face 128  69 50 56
Face 129  52 63 59
Face 130  69 65 50
Face 131  70 77 66
Face 132  10 14 18
Face 133  145 140 146
Face 134  116 82 113
Face 135  162 165 141
Face 136  166 174 173
Face 137  10 22 14
Face 138  104 95 62
Face 139  25 23 9
Face 140  103 98 95
Face 141  30 45 31
Face 142  161 147 152
Face 143  24 25 9
Face 144  34 40 27
Face 145  49 79 64
Face 146  5 2 8
Face 147  115 134 132
Face 148  35 48 44
Face 149  123 122 112
Face 150  43 40 34
Face 151  20 35 30
Face 152  164 167 151
Face 153  85 61 102
Face 154  116 96 99
Face 155  130 146 129
Face 156  140 129 146
Face 157  33 32 26
Face 158  79 84 91
Face 159  141 117 153
Face 160  100 83 72
Face 161  68 65 69
Face 162  97 93 92
Face 163  119 92 93
Face 164  4 12 7
Face 165  11 7 12
Face 166  97 89 93
Face 167  66 90 82
Face 168  94 74 82
Face 169  8 13 22
Face 170  105 154 148
Face 171  97 92 80
Face 172  92 84 80
Face 173  109 129 114
Face 174  37 33 47
Face 175  7 2 4
Face 176  155 156 163
Face 177  172 163 156
Face 178  141 153 162
Face 179  37 47 50
Face 180  42 59 53
Face 181  10 15 5
Face 182  4 2 3
Face 183  117 105 114
Face 184  133 100 72
Face 185  159 171 168
Face 186  76 86 121
Face 187  94 96 106
Face 188  74 66 82
Face 189  117 114 153
Face 190  28 15 18
Face 191  56 74 73
Face 192  31 14 22
Face 193  11 19 20
Face 194  14 32 29
Face 195  13 30 31
Face 196  105 96 114
Face 197  109 114 96
Face 198  57 83 67
Face 199  32 39 29
Face 200  89 49 36
Face 201  114 129 140
Face 202  158 160 165
Face 203  21 30 13
Face 204  107 136 108
Face 205  34 27 28
Face 206  60 80 49
Face 207  135 131 120
Face 208  134 135 150
Face 209  148 150 135
Face 210  150 154 141
Face 211  62 46 61
Face 212  162 167 165
Face 213  158 165 167
Face 214  43 34 64
Face 215  49 64 34
Face 216  56 47 71
Face 217  107 101 126
Face 218  36 68 89
Face 219  90 77 95
Face 220  134 152 132
Face 221  147 132 152
Face 222  45 61 46
Face 223  33 42 47
Face 224  53 47 42
Face 225  43 64 54
Face 226  57 54 64
Face 227  98 82 90
Face 228  11 16 7
Face 229  112 103 87
Face 230  122 123 98
Face 231  124 98 123
Face 232  73 81 68
Face 233  16 11 21
Face 234  104 102 87
Face 235  88 110 84
Face 236  91 84 110
Face 237  77 90 66
Face 238  76 48 51
Face 239  81 93 68
Face 240  89 68 93
Face 241  108 128 87
Face 242  112 87 128
Face 243  158 167 173
Face 244  123 144 124
Face 245  130 124 144
Face 246  72 57 118
Face 247  75 107 48
Face 248  44 48 107
Face 249  21 11 20
Face 250  28 29 36
Face 251  39 36 29
Face 252  166 173 170
Face 253  167 170 173
Face 254  149 164 137
Face 255  151 137 164
Face 256  83 100 67
Face 257  142 67 100
Face 258  161 160 175
Face 259  169 175 160
Face 260  57 64 118
Face 261  78 118 64
Face 262  141 165 150
Face 263  160 150 165
Face 264  82 99 94
Face 265  96 94 99
Face 266  158 173 169
Face 267  174 169 173
Face 268  75 48 101
Face 269  76 101 48
Face 270  64 79 78
Face 271  91 78 79
Face 272  62 95 63
Face 273  77 63 95
Face 274  15 28 24
Face 275  27 24 28
Face 276  1 6 2
Face 277  3 2 6
Face 278  18 14 28
Face 279  29 28 14
Face 280  131 135 110
Face 281  134 110 135
Face 282  44 61 35
Face 283  45 35 61
Face 284  26 38 33
Face 285  42 33 38
Face 286  130 129 124
Face 287  101 121 126
Face 288  127 126 121
Face 289  36 39 55
Face 290  113 124 116
Face 291  129 116 124
Face 292  114 140 153
Face 293  145 153 140
Face 294  7 16 2
Face 295  8 2 16
Face 296  134 150 152
Face 297  160 152 150
Face 298  94 111 81
Face 299  119 81 111
Face 300  41 65 39
Face 301  55 39 65
Face 302  91 115 78
Face 303  139 78 115
Face 304  131 125 120
Face 305  84 92 88
Face 306  119 88 92
Face 307  105 148 120
Face 308  135 120 148
Face 309  111 120 119
Face 310  125 119 120
Edge 113 124 {sharp}
Edge 116 124 {sharp}
Edge 120 135 {sharp}
Edge 9 15 {sharp}
Edge 9 17 {sharp}
Edge 125 131 {sharp}
Edge 128 138 {sharp}
Edge 135 148 {sharp}
Edge 26 38 {sharp}
Edge 26 32 {sharp}
Edge 140 145 {sharp}
Edge 141 153 {sharp}
Edge 29 32 {sharp}
Edge 148 150 {sharp}
Edge 36 55 {sharp}
Edge 38 46 {sharp}
Edge 158 167 {sharp}
Edge 158 160 {sharp}
Edge 46 62 {sharp}
Edge 160 161 {sharp}
Edge 47 50 {sharp}
Edge 161 175 {sharp}
Edge 49 60 {sharp}
Edge 49 84 {sharp}
Edge 49 89 {sharp}
Edge 50 69 {sharp}
Edge 166 173 {sharp}
Edge 166 170 {sharp}
Edge 167 170 {sharp}
Edge 55 65 {sharp}
Edge 61 62 {sharp}
Edge 61 87 {sharp}
Edge 61 85 {sharp}
Edge 63 77 {sharp}
Edge 65 69 {sharp}
Edge 77 90 {sharp}
Edge 80 84 {sharp}
Edge 84 92 {sharp}
Edge 84 88 {sharp}
Edge 87 108 {sharp}
Edge 87 104 {sharp}
Edge 87 112 {sharp}
Edge 87 102 {sharp}
Edge 88 131 {sharp}
Edge 89 93 {sharp}
Edge 92 93 {sharp}
Edge 93 97 {sharp}
Edge 96 116 {sharp}
Edge 98 122 {sharp}
Edge 110 135 {sharp}
Edge 111 120 {sharp}
Edge 112 128 {sharp}
