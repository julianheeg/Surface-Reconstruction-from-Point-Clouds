# |Created using:
# | Subdivfit -mf - -fi mechpart.4102.pts -record mechpart.nsub2.crep1e-5p.rec
# |  -crep 1e-5 -csharp .2e-5 -reconstruct
# |Initial mesh:
# |Genus: c=1 b=0  v=163 f=334 e=501  genus=3  sharpe=136 cuspv=0
# |4102 points read
# |Starting reconstruction sequence
# | crep=1e-05, csharp=2e-06
# | internal xform: F 1  1 0 0  0 1 0  0 0 1  0 0 0  0
# |
# |fgfit_before: v=163 nse=136/501  edis=0.00655278 etot=0.00845478
# |fgfit_after : v=163 nse=136/501  edis=0.000165907 etot=0.00206791
# | (_fgfit:                446.33)
# |
# |Stoc, crep=1e-05 csharp=2e-06 wcrep=1e-05 wcsharp=2e-06
# |stoc_before: v=163 nse=136/501  edis=0.000165905 etot=0.0020679
# |it 634, last search: 55 wasted attempts
# |New mesh:
# |Genus: c=1 b=0  v=118 f=244 e=366  genus=3  sharpe=117 cuspv=0
# |Summary of attempts and results:
# |                          ecol      espl      eswa      esha
# |      total_attempts       634         0         0         0
# |             success        45         0         0         0
# |     positive_energy       166         0         0         0
# |        bad_dihedral        61         0         0         0
# |           bad_sharp       354         0         0         0
# |        illegal_move         8         0         0         0
# | last cedis=0.000252552 cetot=0.00166655
# |stoc_after : v=118 nse=117/366  edis=0.000252554 etot=0.00166655
# | (_stoc:                1943.25)
# |
# |fgfit_before: v=118 nse=117/366  edis=0.000252551 etot=0.00166655
# |fgfit_after : v=118 nse=117/366  edis=0.000191469 etot=0.00160547
# | (_fgfit:                128.00)
# |
# |Stoc, crep=1e-05 csharp=2e-06 wcrep=1e-05 wcsharp=2e-06
# |stoc_before: v=118 nse=117/366  edis=0.00019147 etot=0.00160547
# |it 368, last search: 361 wasted attempts
# |New mesh:
# |Genus: c=1 b=0  v=118 f=244 e=366  genus=3  sharpe=116 cuspv=0
# |Summary of attempts and results:
# |                          ecol      espl      eswa      esha
# |      total_attempts         0         0         0       368
# |             success         0         0         0         1
# |     positive_energy         0         0         0       152
# |        bad_dihedral         0         0         0         0
# |           bad_sharp         0         0         0       215
# |        illegal_move         0         0         0         0
# | last cedis=0.000188079 cetot=0.00160008
# |stoc_after : v=118 nse=116/366  edis=0.000188082 etot=0.00160008
# | (_stoc:                 842.88)
# |
# |fgfit_before: v=118 nse=116/366  edis=0.000188082 etot=0.00160008
# |fgfit_after : v=118 nse=116/366  edis=0.000172819 etot=0.00158482
# | (_fgfit:                137.00)
# |
# |Stoc, crep=1e-05 csharp=2e-06 wcrep=1e-05 wcsharp=2e-06
# |stoc_before: v=118 nse=116/366  edis=0.000172819 etot=0.00158482
# |it 407, last search: 9 wasted attempts
# |New mesh:
# |Genus: c=1 b=0  v=115 f=238 e=357  genus=3  sharpe=113 cuspv=0
# |Summary of attempts and results:
# |                          ecol      espl      eswa      esha
# |      total_attempts       407         0       404       404
# |             success         3         0        10         0
# |     positive_energy       140         0       211       169
# |        bad_dihedral       261         0       180         0
# |           bad_sharp         0         0         0       235
# |        illegal_move         3         0         3         0
# | last cedis=0.000179567 cetot=0.00155557
# |stoc_after : v=115 nse=113/357  edis=0.000179743 etot=0.00155574
# | (_stoc:                3603.72)
# |
# |fgfit_before: v=115 nse=113/357  edis=0.000179742 etot=0.00155574
# |fgfit_after : v=115 nse=113/357  edis=0.000157878 etot=0.00153388
# | (_fgfit:                125.77)
# | (Subdivfit:            7228.12)
# |Summary of timers (cpu=mips host=marlin.cs.washington.edu):
# | ___submesh:         (1229  )    0.67:4.98     av=     1.89   sum=  2323.00
# | ____gmakeSpatial:   (10    )    6.25:7.82     av=     6.60   sum=    66.03
# | ____gspatialproject:(10    )    2.12:2.52     av=     2.25   sum=    22.52
# | ___gallproject:     (10    )    8.42:10.37    av=     8.92   sum=    89.23
# | ___computegrad:     (267   )    0.55:0.60     av=     0.56   sum=   149.90
# | ___gneighproject:   (468   )    1.17:1.32     av=     1.21   sum=   568.55
# | __fgfit_iter:       (70    )    9.03:15.25    av=    11.16   sum=   781.23
# | _fgfit:             (4     )  125.77:446.33   av=   209.28   sum=   837.10
# | _initial_fit:       (3     )   11.68:14.18    av=    12.53   sum=    37.58
# | ____lmakespatial:   (1219  )    0.00:0.83     av=     0.17   sum=   202.82
# | ____lspatialproject:(1219  )    0.02:1.42     av=     0.12   sum=   150.60
# | ___lallproject:     (1219  )    0.02:2.25     av=     0.29   sum=   355.27
# | ____lneighproject:  (4505  )    0.12:1.12     av=     0.42   sum=  1912.57
# | ____lcombinations:  (4505  )    0.02:0.33     av=     0.08   sum=   354.88
# | _____qrdLLS:        (4505  )    0.00:1.43     av=     0.10   sum=   453.97
# | ____lsolve:         (4505  )    0.00:1.58     av=     0.13   sum=   598.28
# | ___loptimize:       (4505  )    0.17:3.17     av=     0.67   sum=  3017.85
# | __tryecol:          (676   )    2.00:16.28    av=     5.80   sum=  3920.37
# | __lattempt:         (1409  )    0.00:24.35    av=     4.48   sum=  6316.67
# | _stoc:              (3     )  842.88:3603.72  av=  2129.95   sum=  6389.85
# | __tryesha:          (322   )    2.67:13.03    av=     5.32   sum=  1713.28
# | __tryeswa:          (221   )    1.48:8.68     av=     2.99   sum=   660.28
# | Subdivfit:          (1     )        :         av=  7228.12   sum=  7228.12
# |Summary of statistics:
# |Sospobcells:(149120 )          1:13          av=3.20249     sd=1.48407
# |Sssncellsv: (168961 )          1:216         av=5.04976     sd=13.2176
# |Sssnelemsv: (168961 )          1:138         av=13.824      sd=11.9139
# |Sospcelln:  (68374  )          1:39          av=6.98445     sd=4.96235
# |Sprojquick: (8300407)          0:1           av=0.46609     sd=0.498849
# |Sprojnei:   (4431667)          0:5           av=0.0529374   sd=0.235241
# |Sprojf:     (4431667)          4:54          av=11.4883     sd=3.07294
# |Sprojunexp: (224681 )          0:1           av=0.00379204  sd=0.0614628
# |Sneval:     (70     )          6:9           av=6.68571     sd=0.692462
# |Stmin:      (70     )  0.0198115:0.0906504   av=0.0550072   sd=0.0141922
# |Ssetfrem:   (1219   )        464:1968        av=1219.47     sd=235.216
# |Ssetvrem:   (1219   )        239:996         av=606.208     sd=115.731
# |Secolpts:   (676    )        465:3417        av=1695.98     sd=548.964
# |Secolmf:    (676    )         40:213         av=104.441     sd=32.9176
# |Secolmv:    (676    )          5:27          av=10.2751     sd=3.6051
# |Secolsmv:   (676    )        349:1786        av=903.32      sd=273.81
# |Soptnit:    (905    )          2:10          av=3.78011     sd=2.05059
# |Soptnig:    (67     )         11:12          av=11.1493     sd=0.359028
# |Sechange:   (59     )-2.38792e-05:-7.17789e-07 av=-7.38976e-06 sd=5.26772e-06
# |Seshapts:   (322    )        727:3417        av=1705.47     sd=541.629
# |Seshamf:    (322    )         47:199         av=103.919     sd=33.8957
# |Seshamv:    (322    )          7:28          av=11.0342     sd=4.12674
# |Seshasmv:   (322    )        411:1662        av=898.652     sd=280.334
# |Seswapts:   (221    )        450:2037        av=999.909     sd=379.339
# |Seswamf:    (221    )         28:122         av=60.4796     sd=20.9984
# |Seswamv:    (221    )          4:4           av=4           sd=0
# |Seswamvcvih:(221    )        249:1078        av=534.955     sd=184.36
# Created using:
#  Filtermesh mechpart.nsub2.crep1e-5p.0.m -renumber
# (Timing on cpu=sgi host=belvedere.microsoft.com)
#  (_readmesh:               0.02)
#  (_renumber:               0.00)
#  (Filtermesh:              0.04)
Vertex 1  0.453022 0.454306 0.433115
Vertex 2  0.366831 0.433569 0.416937
Vertex 3  0.3987 0.401222 0.470254
Vertex 4  0.400287 0.366555 0.474328
Vertex 5  0.366669 0.366663 0.366662
Vertex 6  0.366584 0.401681 0.489894
Vertex 7  0.453016 0.366807 0.399771
Vertex 8  0.502821 0.498464 0.399848
Vertex 9  0.448699 0.366684 0.366664
Vertex 10  0.411991 0.366729 0.560513
Vertex 11  0.366505 0.504019 0.402068
Vertex 12  0.366705 0.460613 0.59864
Vertex 13  0.366669 0.409256 0.539348
Vertex 14  0.366656 0.633327 0.366651
Vertex 15  0.397337 0.478411 0.366674
Vertex 16  0.417971 0.438007 0.366671
Vertex 17  0.408491 0.407335 0.551652
Vertex 18  0.453066 0.406816 0.366672
Vertex 19  0.366536 0.581111 0.445097
Vertex 20  0.366876 0.552133 0.416306
Vertex 21  0.421626 0.585988 0.446919
Vertex 22  0.40168 0.541092 0.366669
Vertex 23  0.553205 0.366593 0.408258
Vertex 24  0.493077 0.487965 0.596367
Vertex 25  0.395464 0.484778 0.100004
Vertex 26  0.633331 0.366679 0.366684
Vertex 27  0.58748 0.40927 0.446337
Vertex 28  0.461357 0.533012 0.422972
Vertex 29  0.480005 0.366583 0.601114
Vertex 30  0.524896 0.366652 0.633305
Vertex 31  0.551541 0.410725 0.366671
Vertex 32  0.505215 0.395897 0.366664
Vertex 33  0.63327 0.456571 0.406647
Vertex 34  0.366604 0.545493 0.593445
Vertex 35  0.398227 0.470619 0.633369
Vertex 36  0.366688 0.366665 0.633283
Vertex 37  0.472514 0.633332 0.400522
Vertex 38  0.509458 0.491759 0.59093
Vertex 39  0.398075 0.478083 0.899997
Vertex 40  0.434853 0.416719 0.633453
Vertex 41  0.459193 0.403741 0.100002
Vertex 42  0.633404 0.401616 0.466887
Vertex 43  0.584874 0.440772 0.36667
Vertex 44  0.366643 0.633342 0.633331
Vertex 45  0.483223 0.398571 0.633289
Vertex 46  0.436137 0.582212 0.366659
Vertex 47  0.582563 0.366735 0.460002
Vertex 48  0.551324 0.553046 0.429812
Vertex 49  0.553787 0.633159 0.411621
Vertex 50  0.477351 0.514345 0.592586
Vertex 51  0.398424 0.526093 0.633311
Vertex 52  0.602211 0.401419 0.525112
Vertex 53  0.397749 0.597614 0.498702
Vertex 54  0.417008 0.586409 0.550556
Vertex 55  0.36685 0.595783 0.536694
Vertex 56  0.4103 0.633334 0.535115
Vertex 57  0.526663 0.398228 0.633368
Vertex 58  0.535014 0.401509 0.900001
Vertex 59  0.483213 0.60139 0.366692
Vertex 60  0.602608 0.484142 0.366671
Vertex 61  0.512056 0.396599 0.0999971
Vertex 62  0.424014 0.425971 0.900018
Vertex 63  0.451711 0.596787 0.0999962
Vertex 64  0.598621 0.534148 0.366671
Vertex 65  0.633337 0.633369 0.366676
Vertex 66  0.566649 0.489512 0.597864
Vertex 67  0.533928 0.531577 0.59128
Vertex 68  0.430751 0.633353 0.5713
Vertex 69  0.479843 0.396225 0.899998
Vertex 70  0.586766 0.433317 0.633282
Vertex 71  0.567671 0.579524 0.366677
Vertex 72  0.524226 0.604064 0.0999938
Vertex 73  0.602155 0.36659 0.502084
Vertex 74  0.633274 0.557463 0.418895
Vertex 75  0.633379 0.515777 0.405345
Vertex 76  0.602595 0.484691 0.0999974
Vertex 77  0.599679 0.633518 0.46745
Vertex 78  0.537481 0.453655 0.57863
Vertex 79  0.424681 0.573186 0.633326
Vertex 80  0.598813 0.530367 0.100001
Vertex 81  0.417784 0.435844 0.0999878
Vertex 82  0.633332 0.366659 0.633355
Vertex 83  0.592247 0.593397 0.469067
Vertex 84  0.633343 0.428329 0.564709
Vertex 85  0.633302 0.413601 0.546204
Vertex 86  0.554101 0.412767 0.0999984
Vertex 87  0.490154 0.633265 0.602092
Vertex 88  0.527538 0.599139 0.366651
Vertex 89  0.585109 0.441355 0.0999993
Vertex 90  0.633332 0.472708 0.597682
Vertex 91  0.472773 0.600835 0.633396
Vertex 92  0.528439 0.63334 0.633348
Vertex 93  0.574413 0.573524 0.100003
Vertex 94  0.580764 0.431277 0.900002
Vertex 95  0.633341 0.633329 0.633342
Vertex 96  0.633365 0.545141 0.589699
Vertex 97  0.517641 0.600128 0.633203
Vertex 98  0.474726 0.602926 0.899979
Vertex 99  0.399391 0.527555 0.899989
Vertex 100  0.591718 0.55562 0.899996
Vertex 101  0.587722 0.555384 0.633333
Vertex 102  0.606699 0.508321 0.633349
Vertex 103  0.633287 0.586626 0.550959
Vertex 104  0.597935 0.596826 0.532889
Vertex 105  0.588599 0.633248 0.549296
Vertex 106  0.555506 0.633408 0.5813
Vertex 107  0.553952 0.587305 0.633316
Vertex 108  0.425222 0.573717 0.900012
Vertex 109  0.539091 0.599044 0.900042
Vertex 110  0.60679 0.492667 0.899998
Vertex 111  0.409064 0.633326 0.44463
Vertex 112  0.567176 0.366754 0.585319
Vertex 113  0.404527 0.549136 0.0999959
Vertex 114  0.633345 0.585595 0.451793
Vertex 115  0.633376 0.595894 0.497329
Face 1  24 29 10
Face 2  43 26 31
Face 3  42 27 52
Face 4  56 54 53
Face 5  44 55 34
Face 6  57 58 45
Face 7  68 50 54
Face 8  77 65 49
Face 9  77 48 83
Face 10  39 35 62
Face 11  100 107 109
Face 12  1 2 3
Face 13  2 6 3
Face 14  6 13 3
Face 15  8 1 7
Face 16  2 1 8
Face 17  11 2 8
Face 18  7 23 8
Face 19  20 14 11
Face 20  20 11 8
Face 21  28 20 8
Face 22  24 10 17
Face 23  20 28 21
Face 24  40 36 30
Face 25  15 22 25
Face 26  33 8 27
Face 27  24 12 34
Face 28  40 35 36
Face 29  30 45 40
Face 30  37 28 8
Face 31  29 24 38
Face 32  47 23 26
Face 33  23 47 27
Face 34  28 111 21
Face 35  37 111 28
Face 36  55 19 53
Face 37  111 53 21
Face 38  33 27 42
Face 39  24 34 50
Face 40  38 112 29
Face 41  78 112 38
Face 42  18 41 32
Face 43  75 8 33
Face 44  53 111 56
Face 45  44 51 79
Face 46  26 43 60
Face 47  78 38 66
Face 48  32 61 31
Face 49  59 72 63
Face 50  63 22 46
Face 51  113 25 22
Face 52  63 113 22
Face 53  25 16 15
Face 54  8 48 49
Face 55  56 44 68
Face 56  54 56 68
Face 57  88 72 59
Face 58  81 16 25
Face 59  61 32 41
Face 60  78 90 84
Face 61  50 68 87
Face 62  86 31 61
Face 63  71 65 64
Face 64  85 84 82
Face 65  48 77 49
Face 66  90 78 66
Face 67  50 87 67
Face 68  86 89 43
Face 69  71 64 93
Face 70  96 90 66
Face 71  88 71 93
Face 72  114 115 83
Face 73  87 92 106
Face 74  88 93 72
Face 75  104 83 115
Face 76  115 103 104
Face 77  83 104 77
Face 78  98 91 79
Face 79  79 108 98
Face 80  99 108 51
Face 81  77 105 65
Face 82  96 67 103
Face 83  105 67 106
Face 84  105 104 67
Face 85  67 104 103
Face 86  107 100 101
Face 87  70 110 94
Face 88  100 110 101
Face 89  67 96 66
Face 90  19 21 53
Face 91  40 62 35
Face 92  105 77 104
Face 93  55 44 14
Face 94  115 114 65
Face 95  73 82 112
Face 96  107 97 109
Face 97  98 109 97
Face 98  43 31 86
Face 99  78 84 52
Face 100  85 52 84
Face 101  101 102 95
Face 102  8 23 27
Face 103  42 52 85
Face 104  54 55 53
Face 105  13 17 3
Face 106  49 65 37
Face 107  49 37 8
Face 108  95 96 103
Face 109  55 14 19
Face 110  47 73 27
Face 111  52 27 73
Face 112  21 19 20
Face 113  95 65 105
Face 114  87 106 67
Face 115  93 64 80
Face 116  55 54 34
Face 117  50 34 54
Face 118  62 69 39
Face 119  111 37 14
Face 120  44 56 14
Face 121  111 14 56
Face 122  10 5 4
Face 123  90 82 84
Face 124  45 69 40
Face 125  62 40 69
Face 126  58 69 45
Face 127  74 114 48
Face 128  83 48 114
Face 129  5 10 36
Face 130  44 92 68
Face 131  87 68 92
Face 132  74 65 114
Face 133  26 23 9
Face 134  97 91 98
Face 135  79 51 108
Face 136  17 12 24
Face 137  12 17 13
Face 138  48 8 74
Face 139  75 74 8
Face 140  44 36 51
Face 141  35 51 36
Face 142  102 101 110
Face 143  74 75 65
Face 144  46 14 59
Face 145  95 105 92
Face 146  106 92 105
Face 147  65 14 37
Face 148  12 13 36
Face 149  33 42 26
Face 150  46 22 14
Face 151  102 110 70
Face 152  39 99 35
Face 153  51 35 99
Face 154  12 36 34
Face 155  44 34 36
Face 156  46 59 63
Face 157  16 5 15
Face 158  2 5 6
Face 159  47 26 73
Face 160  82 73 26
Face 161  88 65 71
Face 162  19 14 20
Face 163  33 26 75
Face 164  65 75 26
Face 165  5 16 9
Face 166  18 9 16
Face 167  2 11 5
Face 168  14 5 11
Face 169  14 22 5
Face 170  15 5 22
Face 171  95 103 65
Face 172  115 65 103
Face 173  16 81 18
Face 174  41 18 81
Face 175  73 112 52
Face 176  78 52 112
Face 177  5 36 6
Face 178  13 6 36
Face 179  59 14 88
Face 180  65 88 14
Face 181  58 94 69
Face 182  91 97 92
Face 183  42 85 26
Face 184  82 26 85
Face 185  69 94 39
Face 186  44 79 92
Face 187  91 92 79
Face 188  110 100 94
Face 189  64 60 80
Face 190  76 80 60
Face 191  70 82 102
Face 192  95 102 82
Face 193  109 98 100
Face 194  82 90 95
Face 195  96 95 90
Face 196  60 43 76
Face 197  89 76 43
Face 198  18 32 9
Face 199  26 9 31
Face 200  32 31 9
Face 201  26 60 65
Face 202  64 65 60
Face 203  94 100 39
Face 204  29 30 10
Face 205  36 10 30
Face 206  61 41 86
Face 207  81 25 41
Face 208  97 107 92
Face 209  41 25 86
Face 210  95 92 101
Face 211  107 101 92
Face 212  99 39 108
Face 213  39 100 108
Face 214  98 108 100
Face 215  86 25 89
Face 216  113 63 25
Face 217  93 80 72
Face 218  72 25 63
Face 219  72 80 25
Face 220  80 76 25
Face 221  76 89 25
Face 222  29 112 30
Face 223  82 30 112
Face 224  1 3 7
Face 225  4 7 3
Face 226  66 38 67
Face 227  4 5 7
Face 228  38 24 67
Face 229  50 67 24
Face 230  7 5 23
Face 231  9 23 5
Face 232  3 17 4
Face 233  10 4 17
Face 234  70 57 82
Face 235  30 82 45
Face 236  57 45 82
Face 237  58 57 94
Face 238  70 94 57
Edge 114 115 {sharp}
Edge 1 3 {sharp}
Edge 2 11 {sharp}
Edge 2 6 {sharp}
Edge 3 17 {sharp}
Edge 4 7 {sharp}
Edge 4 10 {sharp}
Edge 5 9 {sharp}
Edge 5 36 {sharp}
Edge 5 14 {sharp}
Edge 6 13 {sharp}
Edge 7 23 {sharp}
Edge 8 27 {sharp}
Edge 9 26 {sharp}
Edge 10 29 {sharp}
Edge 11 20 {sharp}
Edge 12 13 {sharp}
Edge 12 34 {sharp}
Edge 14 65 {sharp}
Edge 14 44 {sharp}
Edge 15 16 {sharp}
Edge 15 22 {sharp}
Edge 16 18 {sharp}
Edge 17 24 {sharp}
Edge 18 32 {sharp}
Edge 19 20 {sharp}
Edge 19 55 {sharp}
Edge 21 53 {sharp}
Edge 21 28 {sharp}
Edge 22 46 {sharp}
Edge 23 47 {sharp}
Edge 25 113 {sharp}
Edge 25 81 {sharp}
Edge 26 65 {sharp}
Edge 26 82 {sharp}
Edge 27 52 {sharp}
Edge 29 112 {sharp}
Edge 30 82 {sharp}
Edge 30 36 {sharp}
Edge 31 32 {sharp}
Edge 31 43 {sharp}
Edge 33 42 {sharp}
Edge 33 75 {sharp}
Edge 34 55 {sharp}
Edge 35 51 {sharp}
Edge 35 40 {sharp}
Edge 36 44 {sharp}
Edge 37 49 {sharp}
Edge 37 111 {sharp}
Edge 39 99 {sharp}
Edge 39 62 {sharp}
Edge 40 45 {sharp}
Edge 41 81 {sharp}
Edge 41 61 {sharp}
Edge 42 85 {sharp}
Edge 43 60 {sharp}
Edge 44 92 {sharp}
Edge 45 57 {sharp}
Edge 46 59 {sharp}
Edge 47 73 {sharp}
Edge 48 83 {sharp}
Edge 49 77 {sharp}
Edge 50 54 {sharp}
Edge 51 79 {sharp}
Edge 52 78 {sharp}
Edge 53 54 {sharp}
Edge 56 111 {sharp}
Edge 56 68 {sharp}
Edge 57 70 {sharp}
Edge 58 94 {sharp}
Edge 58 69 {sharp}
Edge 59 88 {sharp}
Edge 60 64 {sharp}
Edge 61 86 {sharp}
Edge 62 69 {sharp}
Edge 63 72 {sharp}
Edge 63 113 {sharp}
Edge 64 71 {sharp}
Edge 65 95 {sharp}
Edge 67 104 {sharp}
Edge 68 87 {sharp}
Edge 70 102 {sharp}
Edge 71 88 {sharp}
Edge 72 93 {sharp}
Edge 73 112 {sharp}
Edge 74 75 {sharp}
Edge 74 114 {sharp}
Edge 76 89 {sharp}
Edge 76 80 {sharp}
Edge 77 105 {sharp}
Edge 79 91 {sharp}
Edge 80 93 {sharp}
Edge 82 95 {sharp}
Edge 83 104 {sharp}
Edge 84 90 {sharp}
Edge 84 85 {sharp}
Edge 86 89 {sharp}
Edge 87 106 {sharp}
Edge 90 96 {sharp}
Edge 91 97 {sharp}
Edge 92 95 {sharp}
Edge 94 110 {sharp}
Edge 96 103 {sharp}
Edge 97 107 {sharp}
Edge 98 108 {sharp}
Edge 98 109 {sharp}
Edge 99 108 {sharp}
Edge 100 109 {sharp}
Edge 100 110 {sharp}
Edge 101 102 {sharp}
Edge 101 107 {sharp}
Edge 103 115 {sharp}
Edge 105 106 {sharp}
