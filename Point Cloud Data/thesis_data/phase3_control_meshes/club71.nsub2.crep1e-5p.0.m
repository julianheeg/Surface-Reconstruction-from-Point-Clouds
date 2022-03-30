# |Created using:
# | Subdivfit -mf - -fi club71.16864.pts -record club71.nsub2.crep1e-5p.rec
# |  -crep 1e-5 -csharp .2e-5 -reconstruct
# |Initial mesh:
# |Genus: c=1 b=1  v=262 f=515 e=776  genus=0  sharpe=122 cuspv=0
# |16864 points read
# |Starting reconstruction sequence
# | crep=1e-05, csharp=2e-06
# | internal xform: F 1  1 0 0  0 1 0  0 0 1  0 0 0  0
# |
# |fgfit_before: v=262 nse=122/776  edis=0.0185203 etot=0.0213843
# |fgfit_after : v=262 nse=122/776  edis=0.00141967 etot=0.00428367
# | (_fgfit:               1655.32)
# |
# |Stoc, crep=1e-05 csharp=2e-06 wcrep=1e-05 wcsharp=2e-06
# |stoc_before: v=262 nse=122/776  edis=0.00141966 etot=0.00428366
# |it 986, last search: 32 wasted attempts
# |New mesh:
# |Genus: c=1 b=1  v=161 f=313 e=473  genus=0  sharpe=88 cuspv=0
# |Summary of attempts and results:
# |                          ecol      espl      eswa      esha
# |      total_attempts       986         0         0         0
# |             success       101         0         0         0
# |     positive_energy       495         0         0         0
# |        bad_dihedral        82         0         0         0
# |           bad_sharp       297         0         0         0
# |        illegal_move        11         0         0         0
# | last cedis=0.00167619 cetot=0.00346219
# |stoc_after : v=161 nse=88/473  edis=0.00167102 etot=0.00345702
# | (_stoc:                8312.12)
# |
# |fgfit_before: v=161 nse=88/473  edis=0.00167102 etot=0.00345702
# |fgfit_after : v=161 nse=88/473  edis=0.00156002 etot=0.00334602
# | (_fgfit:                424.58)
# |
# |Stoc, crep=1e-05 csharp=2e-06 wcrep=1e-05 wcsharp=2e-06
# |stoc_before: v=161 nse=88/473  edis=0.00155977 etot=0.00334577
# |it 775, last search: 89 wasted attempts
# |New mesh:
# |Genus: c=1 b=1  v=161 f=313 e=473  genus=0  sharpe=73 cuspv=0
# |Summary of attempts and results:
# |                          ecol      espl      eswa      esha
# |      total_attempts         0         0         0       775
# |             success         0         0         0        35
# |     positive_energy         0         0         0       295
# |        bad_dihedral         0         0         0         0
# |           bad_sharp         0         0         0       438
# |        illegal_move         0         0         0         7
# | last cedis=0.00144359 cetot=0.00319959
# |stoc_after : v=161 nse=73/473  edis=0.00144258 etot=0.00319858
# | (_stoc:                2686.30)
# |
# |fgfit_before: v=161 nse=73/473  edis=0.00144259 etot=0.00319859
# |fgfit_after : v=161 nse=73/473  edis=0.00141377 etot=0.00316977
# | (_fgfit:                440.87)
# |
# |Stoc, crep=1e-05 csharp=2e-06 wcrep=1e-05 wcsharp=2e-06
# |stoc_before: v=161 nse=73/473  edis=0.00141352 etot=0.00316952
# |it 639, last search: 36 wasted attempts
# |New mesh:
# |Genus: c=1 b=1  v=154 f=299 e=452  genus=0  sharpe=71 cuspv=0
# |Summary of attempts and results:
# |                          ecol      espl      eswa      esha
# |      total_attempts       639         0       622       632
# |             success         7         0        13        10
# |     positive_energy       494         0       479       230
# |        bad_dihedral       136         0       121         0
# |           bad_sharp         0         0         0       385
# |        illegal_move         2         0         9         7
# | last cedis=0.00135337 cetot=0.00303537
# |stoc_after : v=154 nse=71/452  edis=0.00135201 etot=0.00303401
# | (_stoc:               10682.47)
# |
# |fgfit_before: v=154 nse=71/452  edis=0.00135201 etot=0.00303401
# |fgfit_after : v=154 nse=71/452  edis=0.00131539 etot=0.00299739
# | (_fgfit:                453.80)
# | (Subdivfit:           24657.88)
# |Summary of timers (cpu=mips host=grail.cs.washington.edu):
# | ___submesh:         (2387  )    0.48:8.88     av=     1.37   sum=  3269.38
# | ____gmakeSpatial:   (10    )    6.55:10.05    av=     7.31   sum=    73.08
# | ____gspatialproject:(10    )   13.43:17.75    av=    14.48   sum=   144.80
# | ___gallproject:     (10    )   20.07:27.92    av=    21.87   sum=   218.67
# | ___computegrad:     (272   )    2.40:3.33     av=     2.53   sum=   687.25
# | ___gneighproject:   (497   )    3.80:6.48     av=     4.13   sum=  2054.55
# | __fgfit_iter:       (70    )   30.03:56.85    av=    40.81   sum=  2856.83
# | _fgfit:             (4     )  424.58:1655.32  av=   743.64   sum=  2974.57
# | _initial_fit:       (3     )   25.12:34.68    av=    28.39   sum=    85.18
# | ____lmakespatial:   (2377  )    0.00:0.43     av=     0.13   sum=   299.85
# | ____lspatialproject:(2377  )    0.02:1.40     av=     0.29   sum=   687.32
# | ___lallproject:     (2377  )    0.03:1.72     av=     0.42   sum=   989.92
# | ____lneighproject:  (10289 )    0.25:4.52     av=     0.95   sum=  9785.63
# | ____lcombinations:  (10289 )    0.03:0.60     av=     0.18   sum=  1892.52
# | _____qrdLLS:        (10289 )    0.02:2.00     av=     0.30   sum=  3050.95
# | ____lsolve:         (10289 )    0.03:2.30     av=     0.38   sum=  3926.73
# | ___loptimize:       (10289 )    0.33:6.45     av=     1.58   sum= 16260.47
# | __tryecol:          (1315  )    1.52:42.12    av=    11.54   sum= 15172.68
# | __lattempt:         (2400  )    0.00:51.33    av=     8.97   sum= 21521.57
# | _stoc:              (3     ) 2686.30:10682.47 av=  7226.96   sum= 21680.88
# | __tryesha:          (570   )    2.83:51.27    av=     7.67   sum=  4371.43
# | __tryeswa:          (492   )    1.48:22.68    av=     3.93   sum=  1935.57
# | Subdivfit:          (1     )        :         av= 24657.88   sum= 24657.88
# |Summary of statistics:
# |Sospobcells:(247456 )          1:13          av=2.51214     sd=1.20355
# |Sssncellsv: (938942 )          1:64          av=1.44743     sd=1.15793
# |Sssnelemsv: (938942 )          1:226         av=16.7938     sd=12.2668
# |Sospcelln:  (62829  )          1:129         av=9.89422     sd=8.88348
# |Sprojquick: (44923771)          0:1           av=0.522915    sd=0.499475
# |Sprojnei:   (21432475)          0:10          av=0.0960099   sd=0.316802
# |Sprojf:     (21432475)          3:69          av=10.6047     sd=2.2399
# |Sprojunexp: (1935300)          0:1           av=0.00153723  sd=0.0391774
# |Sneval:     (70     )          6:9           av=7.1         sd=0.725319
# |Stmin:      (70     ) 0.00228225:0.0149734   av=0.00605193  sd=0.0026931
# |Ssetfrem:   (2377   )        288:1520        av=801.817     sd=224.997
# |Ssetvrem:   (2377   )        140:797         av=411.697     sd=116.898
# |Secolpts:   (1315   )       1157:8345        av=3888.9      sd=1491.33
# |Secolmf:    (1315   )         24:114         av=71.6684     sd=13.908
# |Secolmv:    (1315   )          4:16          av=9.36654     sd=1.7446
# |Secolsmv:   (1315   )        224:985         av=621.499     sd=119.914
# |Soptnit:    (2160   )          2:10          av=3.33889     sd=2.12028
# |Soptnig:    (167    )         11:12          av=11.0659     sd=0.248798
# |Sechange:   (166    )-2.11376e-05:-3.45553e-07 av=-6.63737e-06 sd=4.78787e-06
# |Seshapts:   (570    )       1721:8345        av=3813.78     sd=1514.62
# |Seshamf:    (570    )         39:108         av=72.3211     sd=14.2938
# |Seshamv:    (570    )          6:17          av=10.2807     sd=1.84795
# |Seshasmv:   (570    )        343:923         av=625.182     sd=122.992
# |Seswapts:   (492    )        929:6058        av=2607.15     sd=1094.52
# |Seswamf:    (492    )         23:65          av=45.4451     sd=7.27459
# |Seswamv:    (492    )          4:4           av=4           sd=0
# |Seswamvcvih:(492    )        215:575         av=401.222     sd=64.0039
# Created using:
#  Filtermesh club71.nsub2.crep1e-5p.0.m -renumber
# (Timing on cpu=sgi host=belvedere.microsoft.com)
#  (_readmesh:               0.04)
#  (_renumber:               0.00)
#  (Filtermesh:              0.04)
Vertex 1  0.24972 0.107995 0.174269
Vertex 2  0.218569 0.114872 0.184311
Vertex 3  0.24956 0.105627 0.122298
Vertex 4  0.250856 0.0943501 0.154844
Vertex 5  0.176283 0.121017 0.171973
Vertex 6  0.287127 0.180791 0.124065
Vertex 7  0.206366 0.139677 0.142416
Vertex 8  0.365329 0.197987 0.181642
Vertex 9  0.359623 0.21052 0.114813
Vertex 10  0.379421 0.174871 0.168388
Vertex 11  0.382169 0.168042 0.143887
Vertex 12  0.399498 0.158986 0.15612
Vertex 13  0.375642 0.177876 0.12127
Vertex 14  0.392237 0.166481 0.114904
Vertex 15  0.350461 0.226489 0.157974
Vertex 16  0.403135 0.184931 0.187774
Vertex 17  0.37227 0.209919 0.193975
Vertex 18  0.503363 0.221575 0.126815
Vertex 19  0.383018 0.181763 0.18763
Vertex 20  0.393567 0.196943 0.19123
Vertex 21  0.372964 0.206925 0.0979613
Vertex 22  0.355582 0.237594 0.171195
Vertex 23  0.407738 0.192525 0.10653
Vertex 24  0.539273 0.32608 0.176225
Vertex 25  0.356539 0.238557 0.12589
Vertex 26  0.496031 0.317047 0.145943
Vertex 27  0.541459 0.245534 0.167381
Vertex 28  0.478515 0.251559 0.100599
Vertex 29  0.496458 0.29873 0.10649
Vertex 30  0.487497 0.270651 0.190184
Vertex 31  0.567085 0.273766 0.106843
Vertex 32  0.589877 0.282057 0.185246
Vertex 33  0.616406 0.338069 0.193254
Vertex 34  0.577135 0.298569 0.0966266
Vertex 35  0.550586 0.312251 0.0971219
Vertex 36  0.616633 0.275424 0.143954
Vertex 37  0.631024 0.298484 0.121092
Vertex 38  0.589681 0.361378 0.174743
Vertex 39  0.59494 0.373884 0.130634
Vertex 40  0.666486 0.342979 0.187177
Vertex 41  0.593931 0.392502 0.155226
Vertex 42  0.682329 0.331059 0.144257
Vertex 43  0.676436 0.351803 0.116283
Vertex 44  0.602399 0.399785 0.181921
Vertex 45  0.639586 0.360326 0.117059
Vertex 46  0.720739 0.378948 0.163575
Vertex 47  0.62435 0.374925 0.201456
Vertex 48  0.567695 0.459853 0.175218
Vertex 49  0.607399 0.421922 0.158597
Vertex 50  0.693889 0.375147 0.188069
Vertex 51  0.644936 0.412282 0.22573
Vertex 52  0.669005 0.380922 0.206423
Vertex 53  0.622569 0.422353 0.158109
Vertex 54  0.58023 0.439737 0.203597
Vertex 55  0.718775 0.397826 0.150297
Vertex 56  0.669919 0.401101 0.146503
Vertex 57  0.653919 0.442245 0.223335
Vertex 58  0.739441 0.453514 0.149473
Vertex 59  0.578061 0.489434 0.151909
Vertex 60  0.691931 0.403334 0.215435
Vertex 61  0.725447 0.429681 0.15131
Vertex 62  0.614027 0.457294 0.191422
Vertex 63  0.597989 0.476837 0.202999
Vertex 64  0.576096 0.508053 0.192234
Vertex 65  0.723338 0.480119 0.23617
Vertex 66  0.599011 0.490846 0.190285
Vertex 67  0.586832 0.484149 0.188069
Vertex 68  0.559967 0.49928 0.150227
Vertex 69  0.654061 0.520725 0.144824
Vertex 70  0.75451 0.474554 0.166709
Vertex 71  0.691207 0.43468 0.236381
Vertex 72  0.670176 0.460304 0.200178
Vertex 73  0.554943 0.515483 0.190065
Vertex 74  0.550934 0.630029 0.13238
Vertex 75  0.632446 0.46762 0.200057
Vertex 76  0.613644 0.474806 0.184237
Vertex 77  0.656865 0.475296 0.185037
Vertex 78  0.597559 0.503005 0.17912
Vertex 79  0.588182 0.529904 0.185033
Vertex 80  0.548319 0.549358 0.152329
Vertex 81  0.690264 0.483695 0.236154
Vertex 82  0.675539 0.48741 0.197539
Vertex 83  0.572253 0.533148 0.180201
Vertex 84  0.544484 0.585751 0.169498
Vertex 85  0.58169 0.607894 0.165332
Vertex 86  0.804228 0.731638 0.11524
Vertex 87  0.707428 0.475491 0.243879
Vertex 88  0.678783 0.501531 0.183579
Vertex 89  0.764313 0.513509 0.145785
Vertex 90  0.544831 0.821551 0.140998
Vertex 91  0.695519 0.526533 0.196635
Vertex 92  0.509204 0.855649 0.11297
Vertex 93  0.744094 0.537283 0.2252
Vertex 94  0.75259 0.747343 0.11778
Vertex 95  0.728365 0.643873 0.229718
Vertex 96  0.734311 0.708389 0.180522
Vertex 97  0.57002 0.718194 0.156768
Vertex 98  0.743257 0.614291 0.240456
Vertex 99  0.786666 0.580824 0.153766
Vertex 100  0.526917 0.742318 0.155489
Vertex 101  0.721258 0.669701 0.180713
Vertex 102  0.557292 0.810553 0.135194
Vertex 103  0.764915 0.717163 0.23549
Vertex 104  0.713192 0.643772 0.168556
Vertex 105  0.786255 0.628458 0.132459
Vertex 106  0.535803 0.761995 0.116403
Vertex 107  0.642941 0.761496 0.150316
Vertex 108  0.795827 0.677866 0.161505
Vertex 109  0.7154 0.686868 0.164128
Vertex 110  0.659636 0.730418 0.154401
Vertex 111  0.802579 0.79499 0.10962
Vertex 112  0.574054 0.873026 0.101555
Vertex 113  0.772417 0.721191 0.211075
Vertex 114  0.737463 0.771496 0.219482
Vertex 115  0.802531 0.687328 0.12695
Vertex 116  0.536522 0.821603 0.15365
Vertex 117  0.701727 0.701878 0.176397
Vertex 118  0.650361 0.74409 0.164503
Vertex 119  0.642706 0.78264 0.157975
Vertex 120  0.565732 0.828645 0.13839
Vertex 121  0.636332 0.816676 0.140674
Vertex 122  0.574084 0.829004 0.135497
Vertex 123  0.807882 0.743178 0.13674
Vertex 124  0.652309 0.849429 0.151581
Vertex 125  0.627208 0.831335 0.151047
Vertex 126  0.60672 0.84389 0.136503
Vertex 127  0.516418 0.848322 0.134465
Vertex 128  0.72834 0.78279 0.168951
Vertex 129  0.555454 0.856374 0.136484
Vertex 130  0.544434 0.842087 0.150519
Vertex 131  0.646138 0.896448 0.0978852
Vertex 132  0.766736 0.810727 0.205482
Vertex 133  0.758338 0.772308 0.232366
Vertex 134  0.717945 0.824052 0.206528
Vertex 135  0.569795 0.869576 0.15214
Vertex 136  0.541543 0.885145 0.14606
Vertex 137  0.540607 0.845862 0.10435
Vertex 138  0.806351 0.7489 0.116264
Vertex 139  0.804558 0.780856 0.137004
Vertex 140  0.706855 0.829686 0.16233
Vertex 141  0.599524 0.859412 0.145201
Vertex 142  0.550049 0.896213 0.102362
Vertex 143  0.669534 0.853553 0.186772
Vertex 144  0.560389 0.903761 0.140581
Vertex 145  0.597277 0.90362 0.125933
Vertex 146  0.786586 0.837234 0.128784
Vertex 147  0.725504 0.877506 0.103296
Vertex 148  0.696178 0.856331 0.199024
Vertex 149  0.757013 0.852673 0.174723
Vertex 150  0.788284 0.83012 0.105888
Vertex 151  0.746592 0.844157 0.218112
Vertex 152  0.695959 0.891246 0.190671
Vertex 153  0.749162 0.866056 0.122021
Vertex 154  0.702742 0.891762 0.134861
Face 1  9 21 13
Face 2  9 13 3
Face 3  21 14 13
Face 4  24 22 17
Face 5  47 44 38
Face 6  51 54 47
Face 7  54 51 57
Face 8  58 61 53
Face 9  72 62 57
Face 10  64 73 54
Face 11  73 80 68
Face 12  82 77 75
Face 13  84 80 73
Face 14  84 92 80
Face 15  96 82 91
Face 16  96 101 82
Face 17  119 107 118
Face 18  116 127 100
Face 19  124 141 125
Face 20  125 122 126
Face 21  139 123 138
Face 22  133 148 134
Face 23  139 138 111
Face 24  146 139 111
Face 25  151 148 133
Face 26  140 134 143
Face 27  154 149 153
Face 28  1 8 2
Face 29  6 9 3
Face 30  10 1 4
Face 31  4 11 10
Face 32  14 11 13
Face 33  1 10 8
Face 34  14 12 11
Face 35  10 19 8
Face 36  19 17 8
Face 37  19 10 12
Face 38  19 12 16
Face 39  19 20 17
Face 40  16 20 19
Face 41  22 15 8
Face 42  8 17 22
Face 43  15 9 6
Face 44  14 18 12
Face 45  25 15 22
Face 46  22 26 25
Face 47  9 25 21
Face 48  9 15 25
Face 49  16 27 20
Face 50  20 32 30
Face 51  30 32 33
Face 52  35 28 29
Face 53  35 34 28
Face 54  32 27 36
Face 55  18 37 36
Face 56  29 26 39
Face 57  37 18 31
Face 58  31 34 37
Face 59  40 33 32
Face 60  34 45 43
Face 61  36 37 42
Face 62  38 33 47
Face 63  44 41 38
Face 64  43 46 42
Face 65  42 37 43
Face 66  48 44 47
Face 67  42 50 40
Face 68  40 52 51
Face 69  49 53 41
Face 70  41 53 39
Face 71  50 42 46
Face 72  46 43 55
Face 73  53 49 59
Face 74  61 46 55
Face 75  59 69 58
Face 76  60 52 50
Face 77  46 70 65
Face 78  68 59 49
Face 79  75 76 66
Face 80  59 68 74
Face 81  76 75 77
Face 82  78 66 76
Face 83  60 65 71
Face 84  79 78 85
Face 85  80 74 68
Face 86  64 67 83
Face 87  67 79 83
Face 88  73 64 84
Face 89  57 81 72
Face 90  71 65 87
Face 91  91 72 81
Face 92  65 70 93
Face 93  82 72 91
Face 94  95 96 91
Face 95  89 99 70
Face 96  64 100 84
Face 97  84 100 92
Face 98  82 101 88
Face 99  98 93 103
Face 100  104 88 101
Face 101  86 115 105
Face 102  95 98 103
Face 103  109 104 101
Face 104  109 117 110
Face 105  94 74 112
Face 106  117 109 101
Face 107  107 110 118
Face 108  110 117 118
Face 109  120 102 122
Face 110  115 123 108
Face 111  116 130 127
Face 112  129 135 130
Face 113  86 123 115
Face 114  132 113 123
Face 115  121 125 126
Face 116  92 100 127
Face 117  134 114 133
Face 118  134 128 114
Face 119  141 135 129
Face 120  74 106 137
Face 121  74 137 112
Face 122  123 139 132
Face 123  133 103 113
Face 124  125 119 124
Face 125  138 86 111
Face 126  134 140 128
Face 127  136 92 127
Face 128  142 92 136
Face 129  142 136 144
Face 130  143 141 124
Face 131  133 132 151
Face 132  132 149 151
Face 133  144 152 145
Face 134  142 144 145
Face 135  148 151 152
Face 136  152 144 136
Face 137  111 150 146
Face 138  154 147 131
Face 139  150 153 146
Face 140  153 150 147
Face 141  153 147 154
Face 142  143 135 141
Face 143  98 65 93
Face 144  48 73 68
Face 145  87 51 71
Face 146  15 6 5
Face 147  54 73 48
Face 148  152 151 149
Face 149  154 152 149
Face 150  142 137 92
Face 151  86 138 123
Face 152  32 20 27
Face 153  38 41 39
Face 154  116 64 90
Face 155  153 149 146
Face 156  50 52 40
Face 157  82 88 77
Face 158  96 95 114
Face 159  40 36 42
Face 160  81 95 91
Face 161  58 53 59
Face 162  21 23 14
Face 163  122 125 141
Face 164  131 145 154
Face 165  133 113 132
Face 166  152 154 145
Face 167  57 62 63
Face 168  50 46 60
Face 169  65 60 46
Face 170  143 136 135
Face 171  56 55 45
Face 172  36 40 32
Face 173  64 54 63
Face 174  142 145 131
Face 175  55 43 45
Face 176  67 66 79
Face 177  78 79 66
Face 178  116 90 130
Face 179  129 130 90
Face 180  114 128 96
Face 181  6 7 5
Face 182  64 63 67
Face 183  62 67 63
Face 184  124 140 143
Face 185  118 128 119
Face 186  103 99 113
Face 187  108 113 99
Face 188  79 85 97
Face 189  64 116 100
Face 190  137 106 92
Face 191  103 93 99
Face 192  54 57 63
Face 193  34 35 45
Face 194  139 146 132
Face 195  149 132 146
Face 196  69 59 74
Face 197  124 119 140
Face 198  128 140 119
Face 199  148 152 136
Face 200  23 18 14
Face 201  134 148 143
Face 202  127 130 136
Face 203  135 136 130
Face 204  108 123 113
Face 205  45 39 56
Face 206  53 56 39
Face 207  122 141 120
Face 208  61 58 46
Face 209  117 101 96
Face 210  31 28 34
Face 211  109 110 104
Face 212  40 47 33
Face 213  24 26 22
Face 214  136 143 148
Face 215  23 21 28
Face 216  93 70 99
Face 217  112 137 142
Face 218  108 99 115
Face 219  37 34 43
Face 220  25 29 21
Face 221  105 115 99
Face 222  85 110 102
Face 223  107 102 110
Face 224  94 111 86
Face 225  111 94 112
Face 226  120 141 90
Face 227  129 90 141
Face 228  18 23 31
Face 229  28 31 23
Face 230  75 72 82
Face 231  57 51 81
Face 232  87 81 51
Face 233  45 35 39
Face 234  94 69 74
Face 235  111 131 150
Face 236  147 150 131
Face 237  18 36 27
Face 238  55 56 61
Face 239  53 61 56
Face 240  114 95 133
Face 241  103 133 95
Face 242  18 27 12
Face 243  99 89 105
Face 244  51 52 71
Face 245  60 71 52
Face 246  35 29 39
Face 247  121 126 107
Face 248  72 75 62
Face 249  20 30 17
Face 250  24 17 30
Face 251  76 77 78
Face 252  29 28 21
Face 253  78 77 85
Face 254  88 85 77
Face 255  90 64 83
Face 256  26 29 25
Face 257  65 98 87
Face 258  74 80 106
Face 259  92 106 80
Face 260  16 12 27
Face 261  48 47 54
Face 262  120 90 97
Face 263  47 40 51
Face 264  24 38 26
Face 265  39 26 38
Face 266  41 44 49
Face 267  10 11 12
Face 268  62 75 67
Face 269  66 67 75
Face 270  111 112 131
Face 271  24 30 38
Face 272  33 38 30
Face 273  112 142 131
Face 274  5 2 15
Face 275  8 15 2
Face 276  97 85 120
Face 277  102 120 85
Face 278  86 105 58
Face 279  89 58 105
Face 280  3 13 4
Face 281  11 4 13
Face 282  58 89 46
Face 283  70 46 89
Face 284  107 126 102
Face 285  122 102 126
Face 286  88 104 85
Face 287  110 85 104
Face 288  69 94 58
Face 289  86 58 94
Face 290  96 128 117
Face 291  118 117 128
Face 292  44 48 49
Face 293  68 49 48
Face 294  87 98 81
Face 295  95 81 98
Face 296  83 79 90
Face 297  97 90 79
Face 298  119 125 107
Face 299  121 107 125
Edge 114 134 {sharp}
Edge 117 118 {sharp}
Edge 118 119 {sharp}
Edge 119 125 {sharp}
Edge 120 122 {sharp}
Edge 121 126 {sharp}
Edge 8 15 {sharp}
Edge 8 10 {sharp}
Edge 122 126 {sharp}
Edge 9 15 {sharp}
Edge 9 13 {sharp}
Edge 10 11 {sharp}
Edge 124 140 {sharp}
Edge 124 141 {sharp}
Edge 11 13 {sharp}
Edge 125 126 {sharp}
Edge 12 14 {sharp}
Edge 12 19 {sharp}
Edge 127 136 {sharp}
Edge 14 21 {sharp}
Edge 128 140 {sharp}
Edge 129 141 {sharp}
Edge 17 22 {sharp}
Edge 17 19 {sharp}
Edge 131 147 {sharp}
Edge 131 142 {sharp}
Edge 134 143 {sharp}
Edge 21 25 {sharp}
Edge 22 25 {sharp}
Edge 136 144 {sharp}
Edge 144 152 {sharp}
Edge 147 150 {sharp}
Edge 151 152 {sharp}
Edge 43 55 {sharp}
Edge 46 58 {sharp}
Edge 55 61 {sharp}
Edge 57 63 {sharp}
Edge 57 81 {sharp}
Edge 58 89 {sharp}
Edge 58 61 {sharp}
Edge 62 72 {sharp}
Edge 64 116 {sharp}
Edge 68 80 {sharp}
Edge 70 99 {sharp}
Edge 72 91 {sharp}
Edge 73 84 {sharp}
Edge 76 77 {sharp}
Edge 76 78 {sharp}
Edge 77 88 {sharp}
Edge 78 85 {sharp}
Edge 79 97 {sharp}
Edge 81 95 {sharp}
Edge 82 101 {sharp}
Edge 83 90 {sharp}
Edge 84 100 {sharp}
Edge 85 102 {sharp}
Edge 86 111 {sharp}
Edge 88 104 {sharp}
Edge 90 129 {sharp}
Edge 91 96 {sharp}
Edge 92 142 {sharp}
Edge 95 114 {sharp}
Edge 96 128 {sharp}
Edge 97 120 {sharp}
Edge 100 127 {sharp}
Edge 101 117 {sharp}
Edge 104 109 {sharp}
Edge 107 121 {sharp}
Edge 107 110 {sharp}
Edge 109 110 {sharp}
Edge 111 150 {sharp}
