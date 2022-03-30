# |Created using:
# | Subdivfit -fi - -mf - -crep 1.1e-5 -csharp .3e-5 -reconstruct
# |6475 points read
# |Initial mesh:
# |Genus: c=1 b=0  v=161 f=318 e=477  genus=0  sharpe=130 cuspv=0
# |Starting reconstruction sequence
# | crep=1.1e-05, csharp=3e-06
# | internal xform: F 1  0.152221 0 0  0 0.152221 0  0 0 0.152221  0.132466 -1.81769 0.508068  0
# |
# |(Timing on cpu=sgi host=espresso.cs.washington.edu)
# |fgfit_before: v=161 nse=130/477  edis=0.427016 etot=0.520278
# |fgfit_after : v=161 nse=130/477  edis=0.0516264 etot=0.144888
# | (_fgfit:                318.52)
# |
# |Stoc, crep=1.1e-05 csharp=3e-06 wcrep=0.000474724 wcsharp=0.00012947
# |stoc_before: v=161 nse=130/477  edis=0.0516241 etot=0.144886
# |it 596, last search: 29 wasted attempts
# |New mesh:
# |Genus: c=1 b=0  v=111 f=218 e=327  genus=0  sharpe=104 cuspv=0
# |Summary of attempts and results:
# |                          ecol      espl      eswa      esha
# |      total_attempts       596         0         0         0
# |             success        50         0         0         0
# |     positive_energy       206         0         0         0
# |        bad_dihedral        55         0         0         0
# |           bad_sharp       269         0         0         0
# |        illegal_move        16         0         0         0
# | last cedis=0.0457932 cetot=0.111952
# |stoc_after : v=111 nse=104/327  edis=0.0456974 etot=0.111857
# | (_stoc:                1371.99)
# |
# |fgfit_before: v=111 nse=104/327  edis=0.0456972 etot=0.111856
# |fgfit_after : v=111 nse=104/327  edis=0.0423918 etot=0.108551
# | (_fgfit:                 96.97)
# |
# |Stoc, crep=1.1e-05 csharp=3e-06 wcrep=0.000474724 wcsharp=0.00012947
# |stoc_before: v=111 nse=104/327  edis=0.0423912 etot=0.10855
# |it 414, last search: 36 wasted attempts
# |New mesh:
# |Genus: c=1 b=0  v=111 f=218 e=327  genus=0  sharpe=107 cuspv=0
# |Summary of attempts and results:
# |                          ecol      espl      eswa      esha
# |      total_attempts         0         0         0       414
# |             success         0         0         0         9
# |     positive_energy         0         0         0       157
# |        bad_dihedral         0         0         0         0
# |           bad_sharp         0         0         0       248
# |        illegal_move         0         0         0         0
# | last cedis=0.028618 cetot=0.0951656
# |stoc_after : v=111 nse=107/327  edis=0.0285891 etot=0.0951367
# | (_stoc:                 513.60)
# |
# |fgfit_before: v=111 nse=107/327  edis=0.028589 etot=0.0951366
# |fgfit_after : v=111 nse=107/327  edis=0.027364 etot=0.0939116
# | (_fgfit:                 93.30)
# |
# |Stoc, crep=1.1e-05 csharp=3e-06 wcrep=0.000474724 wcsharp=0.00012947
# |stoc_before: v=111 nse=107/327  edis=0.0273643 etot=0.0939119
# |it 421, last search: 17 wasted attempts
# |New mesh:
# |Genus: c=1 b=0  v=108 f=212 e=318  genus=0  sharpe=106 cuspv=0
# |Summary of attempts and results:
# |                          ecol      espl      eswa      esha
# |      total_attempts       421         0       416       418
# |             success         3         0        22         2
# |     positive_energy       266         0       245       158
# |        bad_dihedral       136         0       135         0
# |           bad_sharp         0         0         0       258
# |        illegal_move        16         0        14         0
# | last cedis=0.0222326 cetot=0.0872266
# |stoc_after : v=108 nse=106/318  edis=0.0218276 etot=0.0868216
# | (_stoc:                2493.73)
# |
# |fgfit_before: v=108 nse=106/318  edis=0.0218281 etot=0.086822
# |fgfit_after : v=108 nse=106/318  edis=0.0209302 etot=0.0859242
# | (_fgfit:                104.59)
# | (Subdivfit:            4999.00)
# |Summary of timers (cpu=sgi host=espresso.cs.washington.edu):
# | ___submesh:         (1319  )    0.30:2.31     av=     0.74   sum=   976.54
# | ____gmakeSpatial:   (10    )    3.54:4.54     av=     3.78   sum=    37.80
# | ____gspatialproject:(10    )    1.72:2.04     av=     1.81   sum=    18.07
# | ___gallproject:     (10    )    5.35:6.57     av=     5.64   sum=    56.40
# | ___computegrad:     (249   )    0.32:0.36     av=     0.34   sum=    84.01
# | ___gneighproject:   (521   )    0.82:1.02     av=     0.91   sum=   472.64
# | __fgfit_iter:       (70    )    5.98:11.10    av=     8.30   sum=   581.24
# | _fgfit:             (4     )   93.30:318.52   av=   153.35   sum=   613.38
# | _initial_fit:       (3     )    7.07:8.41     av=     7.53   sum=    22.59
# | __lattempt:         (1431  )    0.00:22.13    av=     3.03   sum=  4335.47
# | ____lmakespatial:   (1309  )    0.00:0.53     av=     0.10   sum=   130.36
# | ____lspatialproject:(1309  )    0.00:0.66     av=     0.09   sum=   113.84
# | ___lallproject:     (1309  )    0.01:1.08     av=     0.19   sum=   245.82
# | ____lneighproject:  (5495  )    0.07:1.33     av=     0.34   sum=  1868.41
# | ____lcombinations:  (5495  )    0.01:0.15     av=     0.05   sum=   269.44
# | _____qrdLLS:        (5495  )    0.00:0.45     av=     0.08   sum=   432.59
# | ____lsolve:         (5495  )    0.01:0.50     av=     0.10   sum=   529.86
# | ___loptimize:       (5495  )    0.09:1.67     av=     0.51   sum=  2823.96
# | __tryecol:          (716   )    0.82:20.08    av=     4.07   sum=  2912.83
# | _stoc:              (3     )  513.60:2493.73  av=  1459.77   sum=  4379.32
# | __tryesha:          (326   )    0.82:11.54    av=     2.92   sum=   951.70
# | __tryeswa:          (267   )    0.65:5.81     av=     1.73   sum=   461.37
# | Subdivfit:          (1     )        :         av=  4999.00   sum=  4999.00
# |Summary of statistics:
# |Sospobcells:(141840 )          1:28          av=4.13801     sd=2.13636
# |Sssncellsv: (297958 )          1:512         av=5.35998     sd=17.9974
# |Sssnelemsv: (297958 )          1:105         av=8.73039     sd=7.23988
# |Sospcelln:  (115085 )          1:36          av=5.10002     sd=3.5162
# |Sprojquick: (15334163)          0:1           av=0.459172    sd=0.49833
# |Sprojnei:   (8293150)          0:11          av=0.067806    sd=0.271761
# |Sprojf:     (8293150)          4:76          av=11.1279     sd=2.60204
# |Sprojunexp: (525556 )          0:1           av=0.00345349  sd=0.0586649
# |Sneval:     (70     )          6:9           av=7.44286     sd=0.810005
# |Stmin:      (70     ) 0.00347092:0.04275     av=0.0141632   sd=0.00829867
# |Ssetfrem:   (1309   )        272:1408        av=797.213     sd=197.328
# |Ssetvrem:   (1309   )        146:716         av=407.943     sd=96.0548
# |Secolpts:   (716    )        699:4775        av=2400.03     sd=831.755
# |Secolmf:    (716    )         30:146         av=72.3142     sd=19.2248
# |Secolmv:    (716    )          5:19          av=9.32821     sd=1.98733
# |Secolsmv:   (716    )        257:1261        av=623.962     sd=165.388
# |Soptnit:    (1122   )          2:10          av=3.55704     sd=2.16921
# |Soptnig:    (90     )         11:12          av=11.1        sd=0.301681
# |Sechange:   (86     )-0.00665049:-2.73866e-05 av=-0.000616319 sd=0.000959498
# |Seshapts:   (326    )        737:4736        av=2441.1      sd=762.068
# |Seshamf:    (326    )         32:140         av=72.6074     sd=17.758
# |Seshamv:    (326    )          6:16          av=9.92638     sd=1.86484
# |Seshasmv:   (326    )        273:1195        av=626.018     sd=152.155
# |Seswapts:   (267    )        516:3322        av=1567.94     sd=620.647
# |Seswamf:    (267    )         28:88          av=46.6966     sd=10.5275
# |Seswamv:    (267    )          4:4           av=4           sd=0
# |Seswasmv:   (267    )        241:768         av=410.442     sd=94.1278
# Created using:
#  Filtermesh fandisk2.nsub2.crep1e-5p.0.m -renumber
# (Timing on cpu=sgi host=belvedere.microsoft.com)
#  (_readmesh:               0.02)
#  (_renumber:               0.00)
#  (Filtermesh:              0.02)
Vertex 1  -0.00102389 15.3854 -1.53301
Vertex 2  0.336624 15.3778 -1.38794
Vertex 3  0.789685 15.4898 -0.629462
Vertex 4  5.17243e-05 14.6716 -1.10973
Vertex 5  2.44007e-05 15.4395 -0.000273438
Vertex 6  0.568789 15.5678 -1.11978
Vertex 7  0.603965 15.4557 0.000311231
Vertex 8  1.14765 15.6482 -0.94446
Vertex 9  1.28392 15.7866 4.91525e-05
Vertex 10  1.50391 15.9019 -0.805654
Vertex 11  1.62714 16.0022 -7.62069e-05
Vertex 12  1.94842 16.3217 -0.759314
Vertex 13  1.92527 16.3378 0.000255737
Vertex 14  2.28872 16.7695 -0.658764
Vertex 15  3.57817 15.5007 -0.970218
Vertex 16  3.33732 15.4699 -1.19365
Vertex 17  3.14585 15.3711 -1.35295
Vertex 18  3.35148 16.296 -0.756014
Vertex 19  3.11298 15.731 -0.828865
Vertex 20  2.78509 15.4731 -1.15725
Vertex 21  1.29829 15.3606 -1.21775
Vertex 22  2.76738 15.3201 -1.96799
Vertex 23  2.34123 12.5884 -2.21972
Vertex 24  2.05057 12.6228 -2.22584
Vertex 25  1.5419 12.5868 -2.21933
Vertex 26  1.34472 12.6877 -2.23715
Vertex 27  2.42833 12.8266 -2.26159
Vertex 28  3.18433 14.8952 -2.62652
Vertex 29  3.18599 14.0827 -2.48307
Vertex 30  1.32265 12.903 -2.27553
Vertex 31  2.69616 14.8951 -2.62666
Vertex 32  2.70432 14.0827 -2.48329
Vertex 33  2.6974 13.2346 -2.33373
Vertex 34  1.34133 13.4723 -2.3754
Vertex 35  2.42766 13.2093 -2.32913
Vertex 36  2.69616 15.2011 -2.68065
Vertex 37  1.28055 13.8688 -2.44569
Vertex 38  1.08798 14.1469 -2.4944
Vertex 39  0.68367 14.478 -2.55294
Vertex 40  8.97734e-05 15.2039 -2.681
Vertex 41  -0.000121244 14.4635 -2.55037
Vertex 42  -0.00022027 14.6751 0.000225412
Vertex 43  4.82826 17.8532 -0.502851
Vertex 44  4.82787 17.8535 -0.00010328
Vertex 45  4.82727 17.6614 -0.524787
Vertex 46  4.82796 13.6152 -0.000108959
Vertex 47  4.82806 15.6442 -0.167109
Vertex 48  4.82784 15.571 -0.580952
Vertex 49  4.82784 15.2643 -0.533255
Vertex 50  4.82796 15.1802 -1.00994
Vertex 51  4.82808 14.3671 -0.87073
Vertex 52  4.82785 14.4517 -0.391973
Vertex 53  4.82791 13.6115 -0.240071
Vertex 54  4.17417 13.6004 -0.29735
Vertex 55  3.90429 13.5901 -0.000104151
Vertex 56  3.52747 13.542 -0.654599
Vertex 57  3.0492 13.5092 0.000161214
Vertex 58  2.42719 13.3941 0.000153528
Vertex 59  3.15306 13.4753 -1.00129
Vertex 60  2.42809 13.404 -0.802202
Vertex 61  2.76556 13.3627 -1.66456
Vertex 62  2.73 15.0089 -1.98173
Vertex 63  3.15615 15.1343 -1.27059
Vertex 64  3.74242 15.2258 -0.750456
Vertex 65  4.21346 15.5611 -0.635715
Vertex 66  4.50878 15.2658 -0.525383
Vertex 67  1.26996 12.896 -0.000108206
Vertex 68  1.49897 12.7627 -5.82665e-05
Vertex 69  2.16738 12.8175 8.46072e-05
Vertex 70  0.553662 14.714 -0.000155969
Vertex 71  2.42893 13.0298 -5.72607e-05
Vertex 72  0.899351 14.5222 0.000207288
Vertex 73  1.3755 13.8495 0.000156549
Vertex 74  1.16961 14.2727 7.11063e-05
Vertex 75  2.34943 12.8003 0.00018498
Vertex 76  2.37815 16.875 -7.63473e-05
Vertex 77  2.79846 17.2276 -0.000226657
Vertex 78  3.51707 17.631 0.00123078
Vertex 79  4.27168 17.8318 -6.98477e-05
Vertex 80  3.28533 17.5346 -0.526984
Vertex 81  2.62815 17.0741 -0.643875
Vertex 82  3.65395 16.9148 -0.651583
Vertex 83  4.12302 17.798 -0.485335
Vertex 84  4.38603 17.6566 -0.560506
Vertex 85  3.92353 15.6241 -0.279144
Vertex 86  4.55765 15.6455 -0.157201
Vertex 87  3.37697 15.569 -0.595464
Vertex 88  3.03585 15.5174 -0.86078
Vertex 89  2.30565 12.7608 -1.0516
Vertex 90  1.68987 12.7633 -1.29165
Vertex 91  1.50024 12.747 -1.33499
Vertex 92  1.54118 12.797 -0.200913
Vertex 93  1.29608 12.9443 -1.00051
Vertex 94  0.251906 14.6103 -1.6212
Vertex 95  0.685485 14.6397 -1.10329
Vertex 96  1.09714 14.3479 -1.22611
Vertex 97  1.23048 14.0721 -1.12524
Vertex 98  2.71496 14.1598 -2.0461
Vertex 99  3.00681 14.2917 -1.29871
Vertex 100  3.66706 14.4053 -0.653801
Vertex 101  4.33728 14.448 -0.412185
Vertex 102  4.56155 13.8122 -0.265498
Vertex 103  4.40751 14.3669 -0.870943
Vertex 104  3.61 14.2969 -1.26901
Vertex 105  3.19976 14.1611 -2.03824
Vertex 106  4.31033 15.1752 -1.03872
Vertex 107  3.62246 15.1047 -1.43918
Vertex 108  3.21368 14.985 -2.11725
Face 1  7 3 5
Face 2  3 7 9
Face 3  11 12 10
Face 4  6 3 8
Face 5  2 1 3
Face 6  10 9 11
Face 7  2 21 1
Face 8  8 10 19
Face 9  2 6 21
Face 10  27 24 35
Face 11  24 27 23
Face 12  39 41 40
Face 13  46 47 44
Face 14  46 54 53
Face 15  54 46 55
Face 16  60 35 61
Face 17  56 55 57
Face 18  56 54 55
Face 19  57 58 60
Face 20  57 59 56
Face 21  36 22 62
Face 22  15 64 16
Face 23  15 65 64
Face 24  49 66 48
Face 25  65 48 66
Face 26  64 65 66
Face 27  62 22 17
Face 28  62 17 63
Face 29  77 79 78
Face 30  5 70 7
Face 31  81 80 14
Face 32  84 83 43
Face 33  10 12 19
Face 34  82 83 84
Face 35  87 18 82
Face 36  82 84 85
Face 37  88 20 19
Face 38  84 45 86
Face 39  23 27 89
Face 40  90 89 69
Face 41  71 89 27
Face 42  71 75 89
Face 43  69 92 90
Face 44  26 25 91
Face 45  93 91 67
Face 46  67 91 92
Face 47  68 67 92
Face 48  30 93 34
Face 49  93 30 26
Face 50  94 39 95
Face 51  95 70 4
Face 52  95 72 70
Face 53  72 95 96
Face 54  96 74 72
Face 55  39 38 96
Face 56  97 37 73
Face 57  37 34 73
Face 58  94 41 39
Face 59  94 4 41
Face 60  70 42 4
Face 61  40 1 36
Face 62  61 98 99
Face 63  99 59 61
Face 64  100 101 102
Face 65  56 59 100
Face 66  54 56 100
Face 67  33 98 61
Face 68  102 53 54
Face 69  99 105 104
Face 70  29 98 32
Face 71  62 63 108
Face 72  104 107 106
Face 73  104 108 107
Face 74  104 105 108
Face 75  108 105 29
Face 76  29 28 108
Face 77  79 83 78
Face 78  83 80 78
Face 79  77 78 80
Face 80  14 13 76
Face 81  24 23 89
Face 82  50 51 103
Face 83  90 92 91
Face 84  18 80 82
Face 85  76 81 14
Face 86  91 93 26
Face 87  47 86 45
Face 88  92 69 68
Face 89  89 75 69
Face 90  80 81 77
Face 91  43 83 79
Face 92  61 59 60
Face 93  53 102 52
Face 94  20 88 16
Face 95  70 5 42
Face 96  73 34 93
Face 97  102 54 100
Face 98  47 48 86
Face 99  65 86 48
Face 100  86 85 84
Face 101  21 20 17
Face 102  17 16 63
Face 103  64 63 16
Face 104  1 5 3
Face 105  93 67 73
Face 106  52 46 53
Face 107  28 29 32
Face 108  1 22 36
Face 109  37 97 96
Face 110  33 61 35
Face 111  59 57 60
Face 112  107 108 63
Face 113  62 31 36
Face 114  76 77 81
Face 115  29 105 98
Face 116  99 104 100
Face 117  87 82 85
Face 118  63 64 107
Face 119  101 100 103
Face 120  104 103 100
Face 121  31 62 28
Face 122  108 28 62
Face 123  16 88 15
Face 124  87 15 88
Face 125  58 57 11
Face 126  44 43 79
Face 127  32 98 33
Face 128  99 98 105
Face 129  64 66 107
Face 130  106 107 66
Face 131  83 82 80
Face 132  65 15 87
Face 133  42 5 4
Face 134  40 36 39
Face 135  28 32 31
Face 136  9 72 11
Face 137  94 95 4
Face 138  59 99 100
Face 139  1 21 22
Face 140  51 52 103
Face 141  101 103 52
Face 142  84 43 45
Face 143  49 50 66
Face 144  106 66 50
Face 145  46 49 47
Face 146  48 47 49
Face 147  72 74 11
Face 148  39 36 38
Face 149  51 50 52
Face 150  71 27 58
Face 151  46 52 49
Face 152  50 49 52
Face 153  13 11 44
Face 154  80 18 14
Face 155  52 102 101
Face 156  44 55 46
Face 157  33 35 32
Face 158  79 77 44
Face 159  44 11 55
Face 160  57 55 11
Face 161  58 11 73
Face 162  74 73 11
Face 163  31 32 36
Face 164  44 77 13
Face 165  76 13 77
Face 166  32 35 37
Face 167  34 37 35
Face 168  32 37 36
Face 169  38 36 37
Face 170  37 96 38
Face 171  96 95 39
Face 172  22 21 17
Face 173  96 97 74
Face 174  73 74 97
Face 175  17 20 16
Face 176  12 11 14
Face 177  13 14 11
Face 178  19 18 88
Face 179  87 88 18
Face 180  50 103 106
Face 181  104 106 103
Face 182  6 2 3
Face 183  89 90 24
Face 184  44 47 43
Face 185  45 43 47
Face 186  41 4 40
Face 187  6 8 21
Face 188  8 3 10
Face 189  9 10 3
Face 190  7 70 9
Face 191  72 9 70
Face 192  58 73 68
Face 193  67 68 73
Face 194  86 65 85
Face 195  87 85 65
Face 196  24 90 25
Face 197  91 25 90
Face 198  68 69 58
Face 199  25 34 24
Face 200  35 24 34
Face 201  27 35 58
Face 202  60 58 35
Face 203  14 18 12
Face 204  19 12 18
Face 205  69 75 58
Face 206  71 58 75
Face 207  26 30 25
Face 208  34 25 30
Face 209  8 19 21
Face 210  20 21 19
Face 211  1 40 5
Face 212  4 5 40
Edge 1 40 {sharp}
Edge 1 5 {sharp}
Edge 4 42 {sharp}
Edge 4 41 {sharp}
Edge 5 42 {sharp}
Edge 5 7 {sharp}
Edge 6 8 {sharp}
Edge 7 9 {sharp}
Edge 8 10 {sharp}
Edge 9 11 {sharp}
Edge 10 12 {sharp}
Edge 11 13 {sharp}
Edge 12 14 {sharp}
Edge 13 76 {sharp}
Edge 14 81 {sharp}
Edge 15 16 {sharp}
Edge 15 65 {sharp}
Edge 16 17 {sharp}
Edge 17 22 {sharp}
Edge 18 19 {sharp}
Edge 18 82 {sharp}
Edge 19 20 {sharp}
Edge 20 88 {sharp}
Edge 22 36 {sharp}
Edge 23 27 {sharp}
Edge 23 24 {sharp}
Edge 24 25 {sharp}
Edge 25 26 {sharp}
Edge 26 30 {sharp}
Edge 27 35 {sharp}
Edge 27 71 {sharp}
Edge 28 31 {sharp}
Edge 28 29 {sharp}
Edge 28 108 {sharp}
Edge 29 105 {sharp}
Edge 29 32 {sharp}
Edge 30 34 {sharp}
Edge 31 62 {sharp}
Edge 31 36 {sharp}
Edge 32 33 {sharp}
Edge 32 98 {sharp}
Edge 33 35 {sharp}
Edge 33 61 {sharp}
Edge 34 37 {sharp}
Edge 35 60 {sharp}
Edge 36 40 {sharp}
Edge 37 38 {sharp}
Edge 38 39 {sharp}
Edge 39 41 {sharp}
Edge 40 41 {sharp}
Edge 42 70 {sharp}
Edge 43 44 {sharp}
Edge 43 45 {sharp}
Edge 43 83 {sharp}
Edge 44 79 {sharp}
Edge 44 46 {sharp}
Edge 45 47 {sharp}
Edge 46 53 {sharp}
Edge 46 55 {sharp}
Edge 47 48 {sharp}
Edge 47 86 {sharp}
Edge 48 65 {sharp}
Edge 48 49 {sharp}
Edge 49 50 {sharp}
Edge 49 66 {sharp}
Edge 50 106 {sharp}
Edge 50 51 {sharp}
Edge 51 52 {sharp}
Edge 51 103 {sharp}
Edge 52 101 {sharp}
Edge 52 53 {sharp}
Edge 53 54 {sharp}
Edge 54 56 {sharp}
Edge 55 57 {sharp}
Edge 56 59 {sharp}
Edge 57 58 {sharp}
Edge 58 71 {sharp}
Edge 58 60 {sharp}
Edge 59 61 {sharp}
Edge 62 63 {sharp}
Edge 63 64 {sharp}
Edge 64 66 {sharp}
Edge 67 68 {sharp}
Edge 67 73 {sharp}
Edge 68 69 {sharp}
Edge 69 75 {sharp}
Edge 70 72 {sharp}
Edge 71 75 {sharp}
Edge 72 74 {sharp}
Edge 73 74 {sharp}
Edge 76 77 {sharp}
Edge 77 78 {sharp}
Edge 78 79 {sharp}
Edge 80 83 {sharp}
Edge 80 81 {sharp}
Edge 82 84 {sharp}
Edge 85 86 {sharp}
Edge 85 87 {sharp}
Edge 87 88 {sharp}
Edge 98 99 {sharp}
Edge 99 100 {sharp}
Edge 100 101 {sharp}
Edge 103 104 {sharp}
Edge 104 105 {sharp}
Edge 106 107 {sharp}
Edge 107 108 {sharp}
