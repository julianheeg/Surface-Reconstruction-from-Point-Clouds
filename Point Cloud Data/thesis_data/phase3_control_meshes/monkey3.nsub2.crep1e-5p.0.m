# |Created using:
# | Subdivfit -fi - -mf - -crep 1e-5 -csharp .2e-5 -reconstruct
# |9354 points read
# |Initial mesh:
# |Genus: c=1 b=1  v=274 f=488 e=761  genus=0  sharpe=14 cuspv=0
# |Starting reconstruction sequence
# | crep=1e-05, csharp=2e-06
# | internal xform: F 1  0.79644 0 0  0 0.79644 0  0 0 0.79644  0.101804 0.10176 0.102238  0
# |
# |(Timing on cpu=mips host=marlin.cs.washington.edu)
# |fgfit_before: v=274 nse=14/761  edis=0.325873 etot=0.330237
# |fgfit_after : v=274 nse=14/761  edis=0.000163691 etot=0.00452744
# | (_fgfit:                831.97)
# |
# |Stoc, crep=1e-05 csharp=2e-06 wcrep=1.5765e-05 wcsharp=3.153e-06
# |stoc_before: v=274 nse=14/761  edis=0.00016369 etot=0.00452744
# |it 925, last search: 36 wasted attempts
# |New mesh:
# |Genus: c=1 b=1  v=143 f=226 e=368  genus=0  sharpe=10 cuspv=0
# |Summary of attempts and results:
# |                          ecol      espl      eswa      esha
# |      total_attempts       925         0         0         0
# |             success       131         0         0         0
# |     positive_energy       624         0         0         0
# |        bad_dihedral        43         0         0         0
# |           bad_sharp       123         0         0         0
# |        illegal_move         4         0         0         0
# | last cedis=0.000456067 cetot=0.00274199
# |stoc_after : v=143 nse=10/368  edis=0.000456095 etot=0.00274202
# | (_stoc:                4887.28)
# |
# |fgfit_before: v=143 nse=10/368  edis=0.000456087 etot=0.00274201
# |fgfit_after : v=143 nse=10/368  edis=0.000370116 etot=0.00265604
# | (_fgfit:                223.22)
# |
# |Stoc, crep=1e-05 csharp=2e-06 wcrep=1.5765e-05 wcsharp=3.153e-06
# |stoc_before: v=143 nse=10/368  edis=0.000370119 etot=0.00265604
# |it 457, last search: 28 wasted attempts
# |New mesh:
# |Genus: c=1 b=1  v=143 f=226 e=368  genus=0  sharpe=1 cuspv=0
# |Summary of attempts and results:
# |                          ecol      espl      eswa      esha
# |      total_attempts         0         0         0       457
# |             success         0         0         0         9
# |     positive_energy         0         0         0        86
# |        bad_dihedral         0         0         0         0
# |           bad_sharp         0         0         0       304
# |        illegal_move         0         0         0        58
# | last cedis=0.000325645 cetot=0.00258319
# |stoc_after : v=143 nse=1/368  edis=0.00032599 etot=0.00258354
# | (_stoc:                 545.42)
# |
# |fgfit_before: v=143 nse=1/368  edis=0.000325984 etot=0.00258353
# |fgfit_after : v=143 nse=1/368  edis=0.000308475 etot=0.00256602
# | (_fgfit:                230.00)
# |
# |Stoc, crep=1e-05 csharp=2e-06 wcrep=1.5765e-05 wcsharp=3.153e-06
# |stoc_before: v=143 nse=1/368  edis=0.000308479 etot=0.00256603
# |it 499, last search: 59 wasted attempts
# |New mesh:
# |Genus: c=1 b=1  v=133 f=209 e=341  genus=0
# |Summary of attempts and results:
# |                          ecol      espl      eswa      esha
# |      total_attempts       499         0       480       489
# |             success        10         0         5         9
# |     positive_energy       465         0       341        89
# |        bad_dihedral        21         0        69         0
# |           bad_sharp         0         0         0       326
# |        illegal_move         3         0        65        65
# | last cedis=0.000309606 cetot=0.00240635
# |stoc_after : v=133 nse=0/341  edis=0.000311129 etot=0.00240787
# | (_stoc:                4486.95)
# |
# |fgfit_before: v=133 nse=0/341  edis=0.000311134 etot=0.00240788
# |fgfit_after : v=133 nse=0/341  edis=0.000276611 etot=0.00237336
# | (_fgfit:                216.03)
# | (Subdivfit:           11423.77)
# |Summary of timers (cpu=mips host=marlin.cs.washington.edu):
# | ___submesh:         (1843  )    0.32:8.30     av=     0.97   sum=  1795.72
# | ____gmakeSpatial:   (10    )    9.20:14.17    av=    10.22   sum=   102.23
# | ____gspatialproject:(10    )    3.43:4.50     av=     3.67   sum=    36.73
# | ___gallproject:     (10    )   12.72:18.82    av=    14.00   sum=   140.00
# | ___computegrad:     (244   )    1.32:1.42     av=     1.36   sum=   332.58
# | ___gneighproject:   (482   )    1.93:2.68     av=     2.05   sum=   985.98
# | __fgfit_iter:       (70    )   16.08:29.17    av=    20.30   sum=  1421.18
# | _fgfit:             (4     )  216.03:831.97   av=   375.30   sum=  1501.22
# | _initial_fit:       (3     )   16.00:24.60    av=    18.89   sum=    56.67
# | ____lmakespatial:   (1833  )    0.00:0.67     av=     0.23   sum=   423.43
# | ____lspatialproject:(1833  )    0.02:0.60     av=     0.13   sum=   231.42
# | ___lallproject:     (1833  )    0.02:1.02     av=     0.36   sum=   658.30
# | ____lneighproject:  (9464  )    0.12:1.35     av=     0.42   sum=  4002.10
# | ____lcombinations:  (9464  )    0.02:0.22     av=     0.08   sum=   782.92
# | _____qrdLLS:        (9464  )    0.00:0.58     av=     0.14   sum=  1282.83
# | ____lsolve:         (9464  )    0.02:0.72     av=     0.18   sum=  1678.13
# | ___loptimize:       (9464  )    0.17:1.83     av=     0.72   sum=  6808.27
# | __tryecol:          (1294  )    1.42:15.32    av=     6.23   sum=  8063.32
# | __lattempt:         (1881  )    0.00:28.75    av=     5.22   sum=  9815.60
# | _stoc:              (3     )  545.42:4887.28  av=  3306.55   sum=  9919.65
# | __tryesha:          (193   )    1.78:22.42    av=     5.17   sum=   998.22
# | __tryeswa:          (346   )    0.92:6.37     av=     2.16   sum=   748.28
# | Subdivfit:          (1     )        :         av= 11423.77   sum= 11423.77
# |Summary of statistics:
# |Sospobcells:(208656 )          1:24          av=4.19813     sd=2.35275
# |Sssncellsv: (504078 )          1:648         av=2.71507     sd=16.0931
# |Sssnelemsv: (504078 )          1:103         av=6.7926      sd=5.30174
# |Sospcelln:  (194379 )          1:69          av=4.50648     sd=3.58278
# |Sprojquick: (20095924)          0:1           av=0.546441    sd=0.497839
# |Sprojnei:   (9114682)          0:7           av=0.133682    sd=0.36625
# |Sprojf:     (9114682)          3:53          av=10.0117     sd=2.07687
# |Sprojunexp: (1148338)          0:1           av=1.30624e-05 sd=0.00361417
# |Sneval:     (70     )          6:9           av=6.88571     sd=0.808342
# |Stmin:      (70     ) 0.00613254:0.047975    av=0.0170835   sd=0.00728854
# |Ssetfrem:   (1833   )        192:1488        av=565.464     sd=239.836
# |Ssetvrem:   (1833   )        100:778         av=299.676     sd=125.647
# |Secolpts:   (1294   )        549:3780        av=1694.25     sd=563.916
# |Secolmf:    (1294   )         18:110         av=53.7767     sd=19.173
# |Secolmv:    (1294   )          4:15          av=8.72257     sd=1.7914
# |Secolsmv:   (1294   )        169:969         av=475.512     sd=164.651
# |Soptnit:    (1771   )          2:10          av=3.30435     sd=2.3995
# |Soptnig:    (166    )         11:12          av=11.0241     sd=0.153812
# |Sechange:   (164    )-3.59286e-05:-9.68822e-07 av=-1.23047e-05 sd=7.76855e-06
# |Seshapts:   (193    )        969:3571        av=2461.42     sd=530.837
# |Seshamf:    (193    )         29:112         av=77.4611     sd=18.1619
# |Seshamv:    (193    )          6:13          av=10.5907     sd=1.40064
# |Seshasmv:   (193    )        263:985         av=680.751     sd=157.209
# |Seswapts:   (346    )        584:2101        av=1312.77     sd=303.768
# |Seswamf:    (346    )         16:62          av=37.5289     sd=11.476
# |Seswamv:    (346    )          4:4           av=4           sd=0
# |Seswasmv:   (346    )        149:549         av=336.994     sd=99.4737
# Created using:
#  Filtermesh monkey3.nsub2.crep1e-5p.0.m -renumber
# (Timing on cpu=sgi host=belvedere.microsoft.com)
#  (_readmesh:               0.00)
#  (_renumber:               0.00)
#  (Filtermesh:              0.02)
Vertex 1  0.490325 0.48047 0.496451
Vertex 2  0.427559 0.464046 0.488302
Vertex 3  0.513215 0.524852 0.506774
Vertex 4  0.43768 0.508672 0.487186
Vertex 5  0.529879 0.428968 0.480256
Vertex 6  0.548391 0.493176 0.506137
Vertex 7  0.451327 0.430334 0.538739
Vertex 8  0.382379 0.506624 0.41049
Vertex 9  0.572925 0.449506 0.492697
Vertex 10  0.571752 0.376398 0.339652
Vertex 11  0.494217 0.39605 0.516604
Vertex 12  0.508936 0.641426 0.488451
Vertex 13  0.487429 0.55083 0.510901
Vertex 14  0.395948 0.547016 0.469611
Vertex 15  0.450584 0.552518 0.528582
Vertex 16  0.554753 0.557344 0.481845
Vertex 17  0.523985 0.604225 0.452492
Vertex 18  0.374342 0.446077 0.422626
Vertex 19  0.477209 0.362826 0.596791
Vertex 20  0.601093 0.448679 0.529177
Vertex 21  0.347417 0.554869 0.335869
Vertex 22  0.396341 0.576164 0.564744
Vertex 23  0.59319 0.505789 0.55775
Vertex 24  0.609716 0.564048 0.502376
Vertex 25  0.373948 0.408169 0.567908
Vertex 26  0.557971 0.603045 0.387476
Vertex 27  0.48736 0.639825 0.558086
Vertex 28  0.61767 0.488583 0.614769
Vertex 29  0.490623 0.287341 0.562342
Vertex 30  0.46691 0.608048 0.595911
Vertex 31  0.601217 0.393749 0.36719
Vertex 32  0.313888 0.602885 0.467844
Vertex 33  0.661938 0.575311 0.593209
Vertex 34  0.6208 0.594201 0.399067
Vertex 35  0.505379 0.820858 0.469327
Vertex 36  0.480373 0.749093 0.799317
Vertex 37  0.297071 0.376899 0.533018
Vertex 38  0.407011 0.606255 0.696937
Vertex 39  0.530681 0.346685 0.34167
Vertex 40  0.700798 0.372776 0.357522
Vertex 41  0.451201 0.323328 0.811021
Vertex 42  0.416357 0.377779 0.709359
Vertex 43  0.701457 0.401015 0.678637
Vertex 44  0.50042 0.0349942 0.480091
Vertex 45  0.52763 0.71017 0.235507
Vertex 46  0.502988 0.188711 0.46652
Vertex 47  0.331844 0.463416 0.222902
Vertex 48  0.764194 0.347295 0.484167
Vertex 49  0.764266 0.640821 0.649593
Vertex 50  0.525365 0.27458 0.233809
Vertex 51  0.271107 0.614706 0.282329
Vertex 52  0.697089 0.582847 0.774999
Vertex 53  0.574725 0.656223 0.12072
Vertex 54  0.327365 0.510447 0.177237
Vertex 55  0.559155 0.326905 0.152721
Vertex 56  0.278023 0.388055 0.285128
Vertex 57  0.312572 0.56072 0.185921
Vertex 58  0.511698 0.844848 0.22543
Vertex 59  0.493662 0.855848 0.629058
Vertex 60  0.191875 0.3272 0.350489
Vertex 61  0.254565 0.397273 -0.00253374
Vertex 62  0.222014 0.667325 0.610734
Vertex 63  0.6661 0.344496 -0.000562659
Vertex 64  0.491194 0.140194 0.721091
Vertex 65  0.690191 0.565968 0.892159
Vertex 66  0.778189 0.665625 0.382822
Vertex 67  0.337386 0.366987 0.828034
Vertex 68  0.434113 0.670536 0.870498
Vertex 69  0.468571 0.223017 1.00023
Vertex 70  0.275485 0.651102 0.756713
Vertex 71  0.841289 0.296696 0.329749
Vertex 72  0.700136 0.46232 1.00105
Vertex 73  0.689721 0.533894 1.00307
Vertex 74  0.499492 1.02518 0.511722
Vertex 75  0.379678 0.637924 0.852514
Vertex 76  0.684739 0.652199 -0.00237797
Vertex 77  0.26171 0.667601 1.00046
Vertex 78  0.304376 0.522474 -0.002186
Vertex 79  0.87374 0.291981 0.754877
Vertex 80  0.617312 0.340293 -0.000453228
Vertex 81  0.707407 0.415927 0.812327
Vertex 82  0.491489 1.06747 1.05351
Vertex 83  0.787602 0.35357 0.83809
Vertex 84  1.0241 0.803889 0.385375
Vertex 85  0.813839 0.695487 0.141207
Vertex 86  0.301077 0.461476 -0.00556261
Vertex 87  0.709915 0.352593 0.205578
Vertex 88  0.509906 -0.0606935 -0.0421148
Vertex 89  0.514375 0.0942382 -0.0259122
Vertex 90  0.706639 0.652859 0.112419
Vertex 91  0.272397 0.583875 -0.000919007
Vertex 92  0.773415 0.324309 0.221603
Vertex 93  0.135137 0.275704 1.03215
Vertex 94  0.485898 0.106462 1.02983
Vertex 95  0.107199 0.739672 1.03376
Vertex 96  0.737451 0.33183 -0.000624828
Vertex 97  0.56749 0.31079 -0.0025012
Vertex 98  0.392354 0.343193 0.969244
Vertex 99  -0.0551175 0.811957 -0.039205
Vertex 100  0.451809 0.719037 1.0057
Vertex 101  1.03362 0.192974 0.541883
Vertex 102  0.868145 0.721413 0.252842
Vertex 103  0.484703 0.846947 1.02579
Vertex 104  0.214781 0.635331 -0.000890672
Vertex 105  0.404767 0.667108 1.00316
Vertex 106  0.868283 0.273039 -0.0262667
Vertex 107  0.738951 0.403055 1.00076
Vertex 108  0.392545 0.341394 1.00168
Vertex 109  0.441785 0.296595 1.00196
Vertex 110  0.341832 0.65225 1.00111
Vertex 111  0.586862 0.659106 -0.00536607
Vertex 112  0.539583 0.743173 -0.00186238
Vertex 113  0.768281 0.624173 1.00135
Vertex 114  0.134444 0.30166 -0.027817
Vertex 115  0.532735 0.237687 -0.000894386
Vertex 116  0.904933 0.726916 0.737656
Vertex 117  0.517865 0.855493 -0.024438
Vertex 118  0.856988 0.690921 1.01866
Vertex 119  0.508794 1.06924 -0.0523439
Vertex 120  -0.029866 0.192171 0.665437
Vertex 121  0.110297 0.713206 -0.0172911
Vertex 122  0.300884 0.347795 1.00251
Vertex 123  -0.0718122 0.177772 -0.0562571
Vertex 124  1.05486 0.827716 -0.0669937
Vertex 125  -0.0238278 0.803575 0.584786
Vertex 126  -0.0582203 0.169333 1.06464
Vertex 127  0.836621 0.323058 1.02633
Vertex 128  1.07233 0.162043 -0.0478035
Vertex 129  1.07518 0.174582 1.06029
Vertex 130  1.06282 0.817753 1.04781
Vertex 131  -0.0658802 0.833934 1.05449
Vertex 132  0.807361 0.695886 -0.0236018
Vertex 133  0.489887 -0.0691401 1.04687
Face 1  1 5 6
Face 2  1 6 3
Face 3  3 12 13
Face 4  2 4 8
Face 5  5 9 6
Face 6  17 12 3
Face 7  18 2 8
Face 8  14 4 15
Face 9  4 13 15
Face 10  19 11 7
Face 11  20 6 9
Face 12  7 2 25
Face 13  14 21 8
Face 14  6 23 16
Face 15  23 24 16
Face 16  17 16 26
Face 17  20 28 23
Face 18  11 19 29
Face 19  2 18 25
Face 20  14 22 32
Face 21  15 27 30
Face 22  31 9 5
Face 23  24 23 33
Face 24  24 34 16
Face 25  16 34 26
Face 26  27 35 36
Face 27  30 38 22
Face 28  40 9 31
Face 29  5 10 31
Face 30  32 21 14
Face 31  27 38 30
Face 32  7 42 19
Face 33  41 19 42
Face 34  7 25 42
Face 35  47 18 8
Face 36  39 29 50
Face 37  26 45 17
Face 38  24 33 49
Face 39  23 28 52
Face 40  26 53 45
Face 41  51 21 32
Face 42  8 21 54
Face 43  8 54 47
Face 44  54 21 57
Face 45  60 37 18
Face 46  12 58 35
Face 47  21 51 57
Face 48  28 20 43
Face 49  28 65 52
Face 50  34 24 66
Face 51  32 22 62
Face 52  48 43 20
Face 53  39 50 55
Face 54  29 46 50
Face 55  70 62 22
Face 56  24 49 66
Face 57  46 64 44
Face 58  18 56 60
Face 59  65 72 73
Face 60  27 36 68
Face 61  53 26 76
Face 62  77 38 75
Face 63  80 63 10
Face 64  35 119 74
Face 65  59 74 82
Face 66  67 42 25
Face 67  38 77 70
Face 68  78 54 57
Face 69  48 40 71
Face 70  72 43 81
Face 71  29 69 64
Face 72  37 60 120
Face 73  83 81 43
Face 74  35 58 119
Face 75  47 86 61
Face 76  33 52 49
Face 77  57 91 78
Face 78  40 87 92
Face 79  69 94 64
Face 80  40 92 71
Face 81  34 66 85
Face 82  32 125 99
Face 83  87 63 96
Face 84  55 97 80
Face 85  34 85 90
Face 86  42 67 98
Face 87  37 120 93
Face 88  42 98 41
Face 89  92 106 71
Face 90  115 55 50
Face 91  66 84 102
Face 92  64 133 44
Face 93  100 105 68
Face 94  41 109 69
Face 95  48 79 83
Face 96  115 97 55
Face 97  98 122 108
Face 98  75 105 110
Face 99  75 68 105
Face 100  111 53 76
Face 101  62 70 95
Face 102  75 110 77
Face 103  72 81 107
Face 104  98 67 122
Face 105  45 112 117
Face 106  61 114 56
Face 107  118 49 52
Face 108  60 56 123
Face 109  65 118 52
Face 110  65 113 118
Face 111  45 117 58
Face 112  58 117 119
Face 113  36 82 103
Face 114  60 123 120
Face 115  83 127 81
Face 116  116 49 130
Face 117  67 93 122
Face 118  48 101 79
Face 119  114 123 56
Face 120  83 79 127
Face 121  102 84 124
Face 122  126 93 120
Face 123  127 79 129
Face 124  102 124 85
Face 125  129 79 101
Face 126  118 130 49
Face 127  85 124 132
Face 128  95 131 125
Face 129  32 62 125
Face 130  106 128 71
Face 131  20 23 6
Face 132  59 36 35
Face 133  40 63 87
Face 134  7 11 5
Face 135  4 14 8
Face 136  2 1 3
Face 137  16 17 3
Face 138  101 71 128
Face 139  27 12 35
Face 140  98 108 41
Face 141  109 41 108
Face 142  10 11 39
Face 143  29 39 11
Face 144  15 13 27
Face 145  52 33 23
Face 146  41 29 19
Face 147  77 95 70
Face 148  31 10 63
Face 149  2 7 1
Face 150  3 6 16
Face 151  22 14 15
Face 152  68 75 38
Face 153  67 25 37
Face 154  5 1 7
Face 155  101 48 71
Face 156  10 5 11
Face 157  76 90 132
Face 158  85 132 90
Face 159  48 83 43
Face 160  40 48 9
Face 161  68 36 100
Face 162  103 100 36
Face 163  31 63 40
Face 164  127 107 81
Face 165  30 22 15
Face 166  93 67 37
Face 167  94 133 64
Face 168  49 116 66
Face 169  36 59 82
Face 170  47 56 18
Face 171  85 66 102
Face 172  104 51 121
Face 173  62 95 125
Face 174  46 29 64
Face 175  44 88 89
Face 176  121 51 99
Face 177  43 72 28
Face 178  65 28 72
Face 179  9 48 20
Face 180  66 116 84
Face 181  130 84 116
Face 182  34 90 26
Face 183  76 26 90
Face 184  12 27 13
Face 185  115 50 89
Face 186  50 46 89
Face 187  44 89 46
Face 188  25 18 37
Face 189  27 68 38
Face 190  3 13 2
Face 191  4 2 13
Face 192  56 47 61
Face 193  59 35 74
Face 194  92 87 106
Face 195  96 106 87
Face 196  69 29 41
Face 197  38 70 22
Face 198  12 17 58
Face 199  45 58 17
Face 200  99 51 32
Face 201  51 104 57
Face 202  91 57 104
Face 203  54 78 47
Face 204  86 47 78
Face 205  73 113 65
Face 206  10 39 80
Face 207  55 80 39
Face 208  45 53 112
Face 209  111 112 53
