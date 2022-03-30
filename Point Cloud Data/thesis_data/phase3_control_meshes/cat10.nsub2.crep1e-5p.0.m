# |Created using:
# | Subdivfit -mf - -fi cat.10000.pts -crep 1e-5 -csharp .2e-5 -reconstruct
# |Initial mesh:
# |Genus: c=1 b=1  v=328 f=627 e=954  genus=0  sharpe=107 cuspv=0
# |10000 points read
# |Starting reconstruction sequence
# | crep=1e-05, csharp=2e-06
# | internal xform: F 1  1 0 0  0 1 0  0 0 1  0 0 0  0
# |
# |(Timing on cpu=sgi host=espresso.cs.washington.edu)
# |fgfit_before: v=328 nse=107/954  edis=0.0772247 etot=0.0807187
# |fgfit_after : v=328 nse=107/954  edis=0.0100621 etot=0.0135561
# | (_fgfit:                552.21)
# |
# |Stoc, crep=1e-05 csharp=2e-06 wcrep=1e-05 wcsharp=2e-06
# |stoc_before: v=328 nse=107/954  edis=0.0100621 etot=0.0135561
# |it 1086, last search: 38 wasted attempts
# |New mesh:
# |Genus: c=1 b=1  v=302 f=575 e=876  genus=0  sharpe=103 cuspv=0
# |Summary of attempts and results:
# |                          ecol      espl      eswa      esha
# |      total_attempts      1086         0         0         0
# |             success        26         0         0         0
# |     positive_energy       655         0         0         0
# |        bad_dihedral       190         0         0         0
# |           bad_sharp       205         0         0         0
# |        illegal_move        10         0         0         0
# | last cedis=0.00991884 cetot=0.0131448
# |stoc_after : v=302 nse=103/876  edis=0.00992761 etot=0.0131536
# | (_stoc:                2439.80)
# |
# |fgfit_before: v=302 nse=103/876  edis=0.00992762 etot=0.0131536
# |fgfit_after : v=302 nse=103/876  edis=0.00965524 etot=0.0128812
# | (_fgfit:                171.85)
# |
# |Stoc, crep=1e-05 csharp=2e-06 wcrep=1e-05 wcsharp=2e-06
# |stoc_before: v=302 nse=103/876  edis=0.00965524 etot=0.0128812
# |it 2462, last search: 24 wasted attempts
# |New mesh:
# |Genus: c=1 b=1  v=302 f=575 e=876  genus=0  sharpe=205 cuspv=0
# |Summary of attempts and results:
# |                          ecol      espl      eswa      esha
# |      total_attempts         0         0         0      2462
# |             success         0         0         0       236
# |     positive_energy         0         0         0       981
# |        bad_dihedral         0         0         0         0
# |           bad_sharp         0         0         0      1202
# |        illegal_move         0         0         0        43
# | last cedis=0.00515919 cetot=0.00858919
# |stoc_after : v=302 nse=205/876  edis=0.00516221 etot=0.00859221
# | (_stoc:                3165.18)
# |
# |fgfit_before: v=302 nse=205/876  edis=0.00516221 etot=0.00859221
# |fgfit_after : v=302 nse=205/876  edis=0.00484119 etot=0.00827119
# | (_fgfit:                177.33)
# |
# |Stoc, crep=1e-05 csharp=2e-06 wcrep=1e-05 wcsharp=2e-06
# |stoc_before: v=302 nse=205/876  edis=0.00484119 etot=0.00827119
# |it 1262, last search: 73 wasted attempts
# |New mesh:
# |Genus: c=1 b=1  v=294 f=561 e=854  genus=0  sharpe=212 cuspv=0
# |Summary of attempts and results:
# |                          ecol      espl      eswa      esha
# |      total_attempts      1262         0      1213      1254
# |             success         8         0        39        41
# |     positive_energy       965         0       832       578
# |        bad_dihedral       278         0       298         0
# |           bad_sharp         0         0         0       604
# |        illegal_move        11         0        44        31
# | last cedis=0.00422537 cetot=0.00758937
# |stoc_after : v=294 nse=212/854  edis=0.00423151 etot=0.00759551
# | (_stoc:                5895.32)
# |
# |fgfit_before: v=294 nse=212/854  edis=0.00423151 etot=0.00759551
# |fgfit_after : v=294 nse=212/854  edis=0.00408044 etot=0.00744444
# | (_fgfit:                174.99)
# | (Subdivfit:           12577.45)
# |Summary of timers (cpu=sgi host=espresso.cs.washington.edu):
# | ___submesh:         (4839  )    0.26:6.19     av=     0.80   sum=  3882.37
# | ____gmakeSpatial:   (10    )    6.79:7.52     av=     7.13   sum=    71.33
# | ____gspatialproject:(10    )    4.67:5.80     av=     4.91   sum=    49.08
# | ___gallproject:     (10    )   11.75:12.85    av=    12.16   sum=   121.57
# | ___computegrad:     (291   )    0.90:1.06     av=     0.94   sum=   272.84
# | ___gneighproject:   (471   )    1.23:1.64     av=     1.40   sum=   657.45
# | __fgfit_iter:       (70    )   10.39:20.43    av=    14.31   sum=  1001.39
# | _fgfit:             (4     )  171.85:552.21   av=   269.10   sum=  1076.38
# | _initial_fit:       (3     )   16.51:16.65    av=    16.57   sum=    49.72
# | __lattempt:         (4810  )    0.00:13.04    av=     2.37   sum= 11400.56
# | ____lmakespatial:   (4829  )    0.00:0.31     av=     0.06   sum=   297.69
# | ____lspatialproject:(4829  )    0.00:0.35     av=     0.06   sum=   270.82
# | ___lallproject:     (4829  )    0.00:0.66     av=     0.12   sum=   573.65
# | ____lneighproject:  (18363 )    0.03:0.68     av=     0.20   sum=  3727.97
# | ____lcombinations:  (18363 )    0.00:0.11     av=     0.04   sum=   682.19
# | _____qrdLLS:        (18363 )    0.00:0.23     av=     0.04   sum=   770.81
# | ____lsolve:         (18363 )    0.00:0.26     av=     0.05   sum=   978.43
# | ___loptimize:       (18363 )    0.04:1.04     av=     0.31   sum=  5761.73
# | __tryecol:          (2122  )    0.57:9.01     av=     2.76   sum=  5860.63
# | _stoc:              (3     ) 2439.80:5895.32  av=  3833.43   sum= 11500.30
# | __tryesha:          (1836  )    0.55:9.39     av=     2.39   sum=  4381.12
# | __tryeswa:          (871   )    0.49:5.03     av=     1.24   sum=  1079.97
# | Subdivfit:          (1     )        :         av= 12577.45   sum= 12577.45
# |Summary of statistics:
# |Sospobcells:(403424 )          1:12          av=2.60816     sd=1.26044
# |Sssncellsv: (533857 )          1:64          av=1.82952     sd=1.70393
# |Sssnelemsv: (533857 )          1:162         av=15.5951     sd=9.45415
# |Sospcelln:  (128572 )          1:76          av=8.1837      sd=6.44198
# |Sprojquick: (27829585)          0:1           av=0.497184    sd=0.499992
# |Sprojnei:   (13993151)          0:8           av=0.0913734   sd=0.311359
# |Sprojf:     (13993151)          3:58          av=10.8497     sd=2.4308
# |Sprojunexp: (1193616)          0:1           av=0.00112599  sd=0.0335369
# |Sneval:     (70     )          6:9           av=6.72857     sd=0.679331
# |Stmin:      (70     )  0.0123978:0.0416931   av=0.0325597   sd=0.00528753
# |Ssetfrem:   (4829   )        304:1536        av=805.136     sd=238.755
# |Ssetvrem:   (4829   )        162:812         av=417.807     sd=124.964
# |Secolpts:   (2122   )        304:2885        av=1348.56     sd=540.149
# |Secolmf:    (2122   )         22:116         av=70.3864     sd=15.5116
# |Secolmv:    (2122   )          5:17          av=9.39114     sd=1.91194
# |Secolsmv:   (2122   )        205:997         av=612.069     sd=132.3
# |Soptnit:    (4363   )          2:10          av=2.9961      sd=2.16708
# |Soptnig:    (352    )         11:12          av=11.1506     sd=0.358137
# |Sechange:   (350    )-0.000188346:-6.16028e-07 av=-1.53861e-05 sd=2.46489e-05
# |Seshapts:   (1836   )        302:2813        av=1337.94     sd=507.722
# |Seshamf:    (1836   )         24:117         av=71.7614     sd=14.6019
# |Seshamv:    (1836   )          6:18          av=10.2908     sd=1.8317
# |Seshasmv:   (1836   )        221:1011        av=622.793     sd=125.115
# |Seswapts:   (871    )        250:1782        av=840.393     sd=350.972
# |Seswamf:    (871    )         21:67          av=45.2388     sd=8.21607
# |Seswamv:    (871    )          4:4           av=4           sd=0
# |Seswasmv:   (871    )        195:595         av=399.959     sd=71.2158
# Created using:
#  Filtermesh cat10.nsub2.crep1e-5p.0.m -renumber
# (Timing on cpu=sgi host=belvedere.microsoft.com)
#  (_readmesh:               0.05)
#  (_renumber:               0.00)
#  (Filtermesh:              0.05)
Vertex 1  0.587712 0.693128 0.149409
Vertex 2  0.545355 0.715982 0.309003
Vertex 3  0.615237 0.682877 0.256528
Vertex 4  0.546623 0.706549 0.170484
Vertex 5  0.667897 0.650635 0.339981
Vertex 6  0.62098 0.642571 0.22918
Vertex 7  0.573529 0.712352 0.160877
Vertex 8  0.622536 0.607103 0.292255
Vertex 9  0.606047 0.656662 0.149258
Vertex 10  0.642911 0.719531 0.383933
Vertex 11  0.569285 0.609396 0.186888
Vertex 12  0.482426 0.685925 0.149298
Vertex 13  0.451812 0.676403 0.320411
Vertex 14  0.545517 0.67006 0.290698
Vertex 15  0.599895 0.704981 0.131139
Vertex 16  0.658008 0.601951 0.383286
Vertex 17  0.438925 0.682612 0.142599
Vertex 18  0.574003 0.737897 0.385664
Vertex 19  0.483493 0.70221 0.138507
Vertex 20  0.539418 0.741253 0.128638
Vertex 21  0.577701 0.729905 0.110072
Vertex 22  0.611663 0.541777 0.250734
Vertex 23  0.585795 0.545311 0.186469
Vertex 24  0.685144 0.651881 0.372209
Vertex 25  0.573796 0.579826 0.168558
Vertex 26  0.627122 0.539265 0.22807
Vertex 27  0.628552 0.538773 0.291184
Vertex 28  0.453937 0.693367 0.148653
Vertex 29  0.468114 0.719929 0.163422
Vertex 30  0.487774 0.722429 0.116492
Vertex 31  0.538719 0.743293 0.108831
Vertex 32  0.648689 0.524536 0.312557
Vertex 33  0.668493 0.632615 0.41431
Vertex 34  0.605156 0.51236 0.186623
Vertex 35  0.624318 0.568498 0.154359
Vertex 36  0.693632 0.696422 0.476492
Vertex 37  0.645384 0.742936 0.46248
Vertex 38  0.565386 0.756391 0.462208
Vertex 39  0.427782 0.623363 0.188657
Vertex 40  0.401749 0.633145 0.382049
Vertex 41  0.562271 0.62303 0.113699
Vertex 42  0.561862 0.594215 0.115694
Vertex 43  0.581115 0.657222 0.109948
Vertex 44  0.677824 0.504238 0.265503
Vertex 45  0.403341 0.715649 0.130422
Vertex 46  0.500359 0.73466 0.408193
Vertex 47  0.675647 0.518263 0.313001
Vertex 48  0.684268 0.633782 0.470535
Vertex 49  0.594502 0.584445 0.107459
Vertex 50  0.453654 0.587562 0.209116
Vertex 51  0.442464 0.688077 0.398912
Vertex 52  0.456858 0.741213 0.114531
Vertex 53  0.617955 0.760009 0.512563
Vertex 54  0.396136 0.624448 0.158217
Vertex 55  0.425567 0.639677 0.162398
Vertex 56  0.666545 0.547213 0.412566
Vertex 57  0.666237 0.518535 0.357474
Vertex 58  0.665831 0.484221 0.209292
Vertex 59  0.655123 0.473891 0.187889
Vertex 60  0.648391 0.570021 0.12708
Vertex 61  0.710583 0.46697 0.300063
Vertex 62  0.424554 0.526564 0.196497
Vertex 63  0.695642 0.429107 0.232234
Vertex 64  0.68103 0.718915 0.563314
Vertex 65  0.430744 0.690876 0.447285
Vertex 66  0.52431 0.763342 0.551888
Vertex 67  0.674812 0.449639 0.398043
Vertex 68  0.657173 0.503468 0.173009
Vertex 69  0.651027 0.577997 0.119248
Vertex 70  0.409552 0.522196 0.353709
Vertex 71  0.412543 0.572827 0.369757
Vertex 72  0.382959 0.563092 0.169237
Vertex 73  0.396175 0.588805 0.169797
Vertex 74  0.397934 0.619815 0.115657
Vertex 75  0.582707 0.760331 0.57821
Vertex 76  0.699194 0.461451 0.397378
Vertex 77  0.711595 0.441015 0.330981
Vertex 78  0.705765 0.352135 0.239648
Vertex 79  0.372315 0.623333 0.136139
Vertex 80  0.491097 0.736434 0.584923
Vertex 81  0.434183 0.709617 0.486333
Vertex 82  0.427616 0.686242 0.535965
Vertex 83  0.669441 0.385841 0.177195
Vertex 84  0.675094 0.642189 0.64126
Vertex 85  0.409622 0.581736 0.426223
Vertex 86  0.692707 0.607073 0.554091
Vertex 87  0.393603 0.536514 0.28229
Vertex 88  0.405508 0.557541 0.461564
Vertex 89  0.391311 0.515929 0.192437
Vertex 90  0.384912 0.576552 0.143312
Vertex 91  0.434663 0.660388 0.556766
Vertex 92  0.715652 0.389431 0.32517
Vertex 93  0.663097 0.445349 0.417019
Vertex 94  0.68993 0.501235 0.471429
Vertex 95  0.660315 0.444404 0.118184
Vertex 96  0.555243 0.757603 0.624953
Vertex 97  0.418785 0.526999 0.36037
Vertex 98  0.694719 0.39264 0.399469
Vertex 99  0.383 0.625471 0.453225
Vertex 100  0.684615 0.549227 0.530428
Vertex 101  0.606793 0.732434 0.705245
Vertex 102  0.514652 0.767714 0.652077
Vertex 103  0.407441 0.594167 0.458538
Vertex 104  0.310838 0.497233 0.156892
Vertex 105  0.310655 0.515329 0.129581
Vertex 106  0.658994 0.494939 0.571852
Vertex 107  0.641683 0.676154 0.700483
Vertex 108  0.357272 0.473835 0.3834
Vertex 109  0.342384 0.450126 0.179778
Vertex 110  0.515092 0.751013 0.632512
Vertex 111  0.682804 0.305059 0.238927
Vertex 112  0.345972 0.495406 0.317663
Vertex 113  0.391907 0.493142 0.39814
Vertex 114  0.497887 0.762362 0.691762
Vertex 115  0.32497 0.440491 0.334006
Vertex 116  0.443657 0.557675 0.53026
Vertex 117  0.436827 0.575474 0.592412
Vertex 118  0.445091 0.597367 0.610932
Vertex 119  0.488692 0.784928 0.704372
Vertex 120  0.677156 0.285167 0.291179
Vertex 121  0.689373 0.30743 0.216552
Vertex 122  0.665509 0.29625 0.173915
Vertex 123  0.662987 0.563849 0.628391
Vertex 124  0.617545 0.551577 0.677388
Vertex 125  0.43021 0.456419 0.471069
Vertex 126  0.414573 0.557255 0.479648
Vertex 127  0.64553 0.279857 0.361175
Vertex 128  0.665949 0.372747 0.125057
Vertex 129  0.330125 0.387435 0.23786
Vertex 130  0.411648 0.426697 0.421678
Vertex 131  0.329243 0.403511 0.176977
Vertex 132  0.429515 0.615368 0.633626
Vertex 133  0.424986 0.654675 0.619774
Vertex 134  0.348119 0.651106 0.631783
Vertex 135  0.382456 0.73071 0.654255
Vertex 136  0.398994 0.703707 0.632348
Vertex 137  0.443282 0.756486 0.655422
Vertex 138  0.542222 0.775169 0.762408
Vertex 139  0.694774 0.353131 0.387401
Vertex 140  0.660588 0.45149 0.541065
Vertex 141  0.655779 0.276703 0.16494
Vertex 142  0.658021 0.295403 0.118823
Vertex 143  0.587488 0.67223 0.806402
Vertex 144  0.325285 0.405306 0.304093
Vertex 145  0.348934 0.294116 0.261936
Vertex 146  0.334148 0.407305 0.350589
Vertex 147  0.409156 0.69943 0.626161
Vertex 148  0.576417 0.733133 0.767731
Vertex 149  0.606435 0.21912 0.247811
Vertex 150  0.61862 0.313122 0.391829
Vertex 151  0.369855 0.383585 0.40054
Vertex 152  0.423738 0.47969 0.515928
Vertex 153  0.412848 0.447065 0.469815
Vertex 154  0.331588 0.377925 0.173122
Vertex 155  0.294929 0.463651 0.117126
Vertex 156  0.448776 0.492354 0.56993
Vertex 157  0.5692 0.749663 0.781592
Vertex 158  0.654137 0.253166 0.264397
Vertex 159  0.358065 0.301833 0.216813
Vertex 160  0.410011 0.337593 0.358979
Vertex 161  0.441751 0.385473 0.470589
Vertex 162  0.293155 0.421198 0.148863
Vertex 163  0.474588 0.563835 0.647106
Vertex 164  0.346911 0.628313 0.647358
Vertex 165  0.612625 0.596546 0.719386
Vertex 166  0.436756 0.573578 0.688776
Vertex 167  0.378086 0.5757 0.705436
Vertex 168  0.449357 0.800035 0.769009
Vertex 169  0.520156 0.746995 0.838511
Vertex 170  0.614883 0.409409 0.573726
Vertex 171  0.493811 0.308616 0.466664
Vertex 172  0.299549 0.309374 0.139222
Vertex 173  0.289827 0.36606 0.144453
Vertex 174  0.280486 0.414972 0.118777
Vertex 175  0.450058 0.549765 0.747833
Vertex 176  0.333035 0.700002 0.655787
Vertex 177  0.310422 0.655209 0.701357
Vertex 178  0.340801 0.653812 0.717419
Vertex 179  0.368004 0.691483 0.718693
Vertex 180  0.668095 0.395512 0.474374
Vertex 181  0.593137 0.311112 0.476419
Vertex 182  0.606966 0.236442 0.129229
Vertex 183  0.594306 0.216032 0.232008
Vertex 184  0.382623 0.315809 0.359227
Vertex 185  0.34796 0.304718 0.177726
Vertex 186  0.50651 0.531268 0.649381
Vertex 187  0.467443 0.568045 0.676565
Vertex 188  0.50961 0.555966 0.690331
Vertex 189  0.355685 0.609803 0.66316
Vertex 190  0.363973 0.744323 0.738775
Vertex 191  0.504874 0.673021 0.855757
Vertex 192  0.598483 0.64831 0.779945
Vertex 193  0.604923 0.28713 0.407198
Vertex 194  0.541561 0.469315 0.646197
Vertex 195  0.297672 0.345874 0.0983982
Vertex 196  0.504587 0.430279 0.591615
Vertex 197  0.506435 0.498599 0.633776
Vertex 198  0.362076 0.751378 0.767426
Vertex 199  0.351291 0.672421 0.768829
Vertex 200  0.482999 0.793293 0.818299
Vertex 201  0.577268 0.254996 0.397823
Vertex 202  0.486754 0.362727 0.538807
Vertex 203  0.386655 0.604659 0.709401
Vertex 204  0.358267 0.626104 0.714806
Vertex 205  0.324573 0.624372 0.664595
Vertex 206  0.372272 0.715644 0.795953
Vertex 207  0.34026 0.714322 0.727859
Vertex 208  0.403211 0.776384 0.71738
Vertex 209  0.417134 0.786292 0.773669
Vertex 210  0.560991 0.683468 0.831172
Vertex 211  0.61107 0.252097 0.366746
Vertex 212  0.530217 0.202532 0.258572
Vertex 213  0.519565 0.194617 0.148775
Vertex 214  0.558325 0.545089 0.690518
Vertex 215  0.514545 0.557346 0.710451
Vertex 216  0.420001 0.28431 0.362082
Vertex 217  0.352606 0.647869 0.745434
Vertex 218  0.371628 0.670337 0.813866
Vertex 219  0.447641 0.808584 0.807941
Vertex 220  0.487262 0.791453 0.817453
Vertex 221  0.494448 0.760805 0.84467
Vertex 222  0.563609 0.356646 0.559985
Vertex 223  0.560165 0.580138 0.750241
Vertex 224  0.546498 0.577898 0.774505
Vertex 225  0.473994 0.283412 0.421844
Vertex 226  0.390633 0.214915 0.146429
Vertex 227  0.32811 0.254757 0.131749
Vertex 228  0.375157 0.25704 0.0962956
Vertex 229  0.431294 0.564426 0.795596
Vertex 230  0.382218 0.578611 0.751252
Vertex 231  0.444091 0.775775 0.805675
Vertex 232  0.437832 0.756049 0.826891
Vertex 233  0.405665 0.721662 0.828683
Vertex 234  0.44196 0.806437 0.865209
Vertex 235  0.538711 0.629137 0.847118
Vertex 236  0.48633 0.20527 0.268516
Vertex 237  0.408571 0.231249 0.257378
Vertex 238  0.39308 0.2604 0.276408
Vertex 239  0.378514 0.267177 0.198683
Vertex 240  0.476603 0.556395 0.796384
Vertex 241  0.359772 0.593961 0.775167
Vertex 242  0.368235 0.599478 0.768172
Vertex 243  0.433893 0.784933 0.886767
Vertex 244  0.459563 0.79088 0.88488
Vertex 245  0.508499 0.225542 0.346362
Vertex 246  0.47757 0.198358 0.211886
Vertex 247  0.446903 0.215464 0.231386
Vertex 248  0.449369 0.245647 0.340203
Vertex 249  0.517933 0.272067 0.443749
Vertex 250  0.420948 0.754991 0.870612
Vertex 251  0.457602 0.720712 0.853357
Vertex 252  0.490053 0.191999 0.14719
Vertex 253  0.434444 0.201017 0.170682
Vertex 254  0.339959 0.257169 0.124928
Vertex 255  0.448085 0.590332 0.834819
Vertex 256  0.41013 0.622832 0.831689
Vertex 257  0.403592 0.665148 0.838966
Vertex 258  0.504771 0.578812 0.828733
Vertex 259  0.464703 0.200223 0.136088
Vertex 260  0.487487 0.55784 0.851874
Vertex 261  0.456204 0.536101 0.851936
Vertex 262  0.460632 0.632958 0.864599
Vertex 263  0.488248 0.584602 0.877819
Vertex 264  0.423685 0.589142 0.88312
Vertex 265  0.457418 0.588151 0.895893
Vertex 266  0.446267 0.556052 0.902962
Vertex 267  0.507904 0.686729 0.395738
Vertex 268  0.416053 0.714573 0.109983
Vertex 269  0.438588 0.62905 0.101002
Vertex 270  0.422039 0.526678 0.247251
Vertex 271  0.407198 0.575446 0.0969346
Vertex 272  0.377134 0.518454 0.365453
Vertex 273  0.48025 0.706857 0.572671
Vertex 274  0.651428 0.632461 0.685997
Vertex 275  0.442152 0.720585 0.633532
Vertex 276  0.66354 0.503918 0.117989
Vertex 277  0.344467 0.47423 0.242814
Vertex 278  0.65265 0.365067 0.424924
Vertex 279  0.393368 0.473948 0.412106
Vertex 280  0.323741 0.4817 0.0960681
Vertex 281  0.342434 0.711151 0.674684
Vertex 282  0.38696 0.763248 0.699381
Vertex 283  0.42304 0.781683 0.691805
Vertex 284  0.348599 0.713877 0.705936
Vertex 285  0.577381 0.618448 0.790723
Vertex 286  0.530886 0.591963 0.812854
Vertex 287  0.604384 0.375128 0.549892
Vertex 288  0.355272 0.59935 0.740264
Vertex 289  0.45694 0.742609 0.872937
Vertex 290  0.539319 0.204961 0.140142
Vertex 291  0.504702 0.606721 0.850634
Vertex 292  0.404636 0.227433 0.111132
Vertex 293  0.46508 0.548223 0.894792
Vertex 294  0.457969 0.205144 0.107855
Face 1  3 5 6
Face 2  2 7 4
Face 3  2 4 12
Face 4  12 13 14
Face 5  31 30 20
Face 6  16 32 27
Face 7  25 23 34
Face 8  41 25 42
Face 9  44 26 27
Face 10  69 49 35
Face 11  30 52 29
Face 12  16 56 57
Face 13  34 44 58
Face 14  60 35 34
Face 15  47 61 44
Face 16  35 60 69
Face 17  40 39 71
Face 18  76 77 61
Face 19  58 63 83
Face 20  76 92 77
Face 21  33 94 67
Face 22  76 98 92
Face 23  78 121 122
Face 24  116 88 126
Face 25  122 128 83
Face 26  122 141 142
Face 27  104 109 89
Face 28  140 106 124
Face 29  130 108 151
Face 30  157 143 148
Face 31  146 144 145
Face 32  156 152 153
Face 33  117 152 156
Face 34  177 178 179
Face 35  182 158 183
Face 36  186 163 156
Face 37  199 179 178
Face 38  171 161 160
Face 39  213 183 212
Face 40  214 215 186
Face 41  217 178 204
Face 42  175 229 230
Face 43  243 231 232
Face 44  248 225 160
Face 45  216 237 245
Face 46  245 248 216
Face 47  294 252 259
Face 48  259 253 226
Face 49  240 260 261
Face 50  1 2 3
Face 51  7 2 1
Face 52  3 10 5
Face 53  2 12 14
Face 54  9 6 11
Face 55  9 15 1
Face 56  18 2 267
Face 57  4 19 12
Face 58  9 43 15
Face 59  23 11 8
Face 60  27 26 22
Face 61  16 27 22
Face 62  12 28 13
Face 63  12 19 29
Face 64  29 28 12
Face 65  20 30 19
Face 66  267 38 18
Face 67  16 5 24
Face 68  22 26 23
Face 69  10 37 36
Face 70  24 10 36
Face 71  20 21 31
Face 72  46 38 267
Face 73  18 38 37
Face 74  11 25 41
Face 75  30 29 19
Face 76  23 26 34
Face 77  40 17 39
Face 78  33 24 36
Face 79  34 26 44
Face 80  25 34 35
Face 81  44 27 47
Face 82  47 27 32
Face 83  39 54 50
Face 84  17 45 55
Face 85  55 54 39
Face 86  46 66 38
Face 87  32 57 47
Face 88  269 54 55
Face 89  45 268 55
Face 90  53 64 36
Face 91  59 68 34
Face 92  60 34 68
Face 93  51 40 65
Face 94  268 269 55
Face 95  82 81 65
Face 96  76 57 67
Face 97  67 57 56
Face 98  64 48 36
Face 99  64 53 75
Face 100  89 62 72
Face 101  79 54 74
Face 102  54 269 74
Face 103  46 81 80
Face 104  61 77 63
Face 105  64 86 48
Face 106  83 59 58
Face 107  70 270 87
Face 108  71 88 85
Face 109  46 80 66
Face 110  80 75 66
Face 111  276 60 68
Face 112  90 72 73
Face 113  74 271 79
Face 114  40 85 99
Face 115  91 80 82
Face 116  78 63 77
Face 117  84 86 64
Face 118  68 59 83
Face 119  271 105 90
Face 120  67 93 76
Face 121  274 86 84
Face 122  78 83 63
Face 123  70 87 272
Face 124  97 70 272
Face 125  103 85 88
Face 126  85 103 99
Face 127  89 72 104
Face 128  79 271 90
Face 129  133 275 273
Face 130  275 80 273
Face 131  102 96 110
Face 132  93 98 76
Face 133  33 48 100
Face 134  64 96 101
Face 135  107 84 64
Face 136  102 101 96
Face 137  272 87 112
Face 138  114 102 110
Face 139  94 33 100
Face 140  107 64 101
Face 141  91 133 273
Face 142  110 80 275
Face 143  93 278 98
Face 144  86 274 123
Face 145  102 148 101
Face 146  277 109 129
Face 147  112 277 129
Face 148  109 277 89
Face 149  89 277 87
Face 150  116 117 99
Face 151  133 147 275
Face 152  110 137 114
Face 153  98 278 139
Face 154  78 111 121
Face 155  107 101 148
Face 156  112 129 115
Face 157  279 125 113
Face 158  91 117 118
Face 159  118 132 91
Face 160  133 91 132
Face 161  110 275 137
Face 162  122 83 78
Face 163  113 108 279
Face 164  280 105 271
Face 165  147 136 275
Face 166  119 138 102
Face 167  127 120 139
Face 168  139 278 150
Face 169  93 140 180
Face 170  94 140 93
Face 171  106 140 94
Face 172  141 122 121
Face 173  124 274 107
Face 174  115 129 144
Face 175  108 112 115
Face 176  279 108 130
Face 177  125 152 113
Face 178  155 104 105
Face 179  136 281 135
Face 180  136 176 281
Face 181  139 150 127
Face 182  93 180 278
Face 183  142 128 122
Face 184  113 152 126
Face 185  126 117 116
Face 186  282 137 135
Face 187  102 138 148
Face 188  158 141 121
Face 189  109 131 129
Face 190  125 153 152
Face 191  156 163 117
Face 192  118 117 163
Face 193  135 281 282
Face 194  283 114 137
Face 195  150 278 180
Face 196  124 107 165
Face 197  144 146 115
Face 198  152 117 126
Face 199  154 131 162
Face 200  167 189 132
Face 201  283 282 208
Face 202  148 138 157
Face 203  124 170 140
Face 204  149 183 158
Face 205  160 161 130
Face 206  153 130 161
Face 207  177 281 176
Face 208  137 282 283
Face 209  283 168 119
Face 210  114 283 119
Face 211  172 154 173
Face 212  173 154 162
Face 213  281 179 284
Face 214  190 208 282
Face 215  208 168 283
Face 216  179 281 177
Face 217  138 119 200
Face 218  157 169 210
Face 219  143 157 210
Face 220  184 151 146
Face 221  195 173 174
Face 222  162 174 173
Face 223  205 164 189
Face 224  176 134 205
Face 225  205 177 176
Face 226  179 199 207
Face 227  168 200 119
Face 228  107 143 192
Face 229  193 150 181
Face 230  124 214 194
Face 231  159 238 145
Face 232  184 146 145
Face 233  227 185 172
Face 234  172 185 154
Face 235  155 195 174
Face 236  167 203 189
Face 237  198 190 207
Face 238  168 208 209
Face 239  220 221 169
Face 240  245 212 149
Face 241  212 183 149
Face 242  223 214 165
Face 243  195 172 173
Face 244  175 167 166
Face 245  189 203 205
Face 246  204 205 203
Face 247  207 199 206
Face 248  231 168 209
Face 249  178 217 199
Face 250  199 218 206
Face 251  211 245 149
Face 252  181 249 201
Face 253  181 201 193
Face 254  181 170 287
Face 255  171 202 161
Face 256  227 172 195
Face 257  186 215 163
Face 258  230 167 175
Face 259  168 219 200
Face 260  223 224 188
Face 261  197 194 186
Face 262  171 160 225
Face 263  185 227 226
Face 264  227 195 228
Face 265  230 288 203
Face 266  167 230 203
Face 267  242 288 230
Face 268  232 231 209
Face 269  191 221 251
Face 270  200 244 221
Face 271  245 201 249
Face 272  181 287 222
Face 273  183 290 182
Face 274  238 247 237
Face 275  240 175 188
Face 276  230 241 242
Face 277  232 250 243
Face 278  241 256 218
Face 279  218 257 233
Face 280  219 234 200
Face 281  244 234 243
Face 282  244 200 234
Face 283  289 251 221
Face 284  211 201 245
Face 285  222 249 181
Face 286  252 213 212
Face 287  240 188 224
Face 288  225 249 171
Face 289  227 254 226
Face 290  230 229 241
Face 291  218 256 257
Face 292  251 289 250
Face 293  243 250 289
Face 294  224 258 240
Face 295  202 171 249
Face 296  249 222 202
Face 297  254 227 228
Face 298  241 229 255
Face 299  232 233 250
Face 300  235 191 291
Face 301  286 291 258
Face 302  235 291 286
Face 303  253 252 246
Face 304  185 253 239
Face 305  261 255 229
Face 306  250 233 251
Face 307  253 259 252
Face 308  253 185 226
Face 309  241 255 256
Face 310  266 255 261
Face 311  266 264 255
Face 312  262 191 251
Face 313  226 254 259
Face 314  261 229 240
Face 315  256 255 264
Face 316  257 262 251
Face 317  293 261 260
Face 318  264 266 265
Face 319  256 262 257
Face 320  264 262 256
Face 321  262 264 265
Face 322  134 164 205
Face 323  191 235 210
Face 324  293 266 261
Face 325  127 150 193
Face 326  100 106 94
Face 327  203 288 204
Face 328  206 198 207
Face 329  83 95 68
Face 330  188 166 187
Face 331  258 260 240
Face 332  5 8 6
Face 333  11 6 8
Face 334  186 194 214
Face 335  133 134 147
Face 336  43 9 41
Face 337  251 233 257
Face 338  36 48 33
Face 339  183 213 290
Face 340  91 82 99
Face 341  80 81 82
Face 342  179 207 284
Face 343  13 40 51
Face 344  273 80 91
Face 345  156 153 197
Face 346  196 197 153
Face 347  267 65 46
Face 348  242 241 217
Face 349  2 14 267
Face 350  84 107 274
Face 351  213 252 290
Face 352  294 290 252
Face 353  89 87 62
Face 354  270 62 87
Face 355  156 197 186
Face 356  114 119 102
Face 357  75 96 64
Face 358  59 34 58
Face 359  38 53 37
Face 360  36 37 53
Face 361  68 95 276
Face 362  155 105 280
Face 363  164 132 189
Face 364  192 285 165
Face 365  54 62 50
Face 366  19 4 20
Face 367  61 63 44
Face 368  100 48 86
Face 369  229 175 240
Face 370  272 112 108
Face 371  83 128 95
Face 372  142 141 182
Face 373  131 154 129
Face 374  165 285 223
Face 375  56 33 67
Face 376  281 284 282
Face 377  44 63 58
Face 378  11 41 9
Face 379  243 289 244
Face 380  221 244 289
Face 381  166 188 175
Face 382  200 220 138
Face 383  25 11 23
Face 384  56 16 33
Face 385  65 81 46
Face 386  16 24 33
Face 387  21 15 43
Face 388  35 49 25
Face 389  42 25 49
Face 390  228 292 254
Face 391  123 274 124
Face 392  99 103 116
Face 393  88 116 103
Face 394  3 2 10
Face 395  236 212 245
Face 396  85 40 71
Face 397  24 5 10
Face 398  136 147 176
Face 399  134 176 147
Face 400  8 5 16
Face 401  178 177 204
Face 402  205 204 177
Face 403  98 139 92
Face 404  120 92 139
Face 405  62 270 50
Face 406  192 165 107
Face 407  193 149 127
Face 408  191 262 291
Face 409  112 87 277
Face 410  235 286 210
Face 411  107 148 143
Face 412  117 91 99
Face 413  120 127 158
Face 414  149 158 127
Face 415  254 292 259
Face 416  294 259 292
Face 417  143 210 192
Face 418  104 162 109
Face 419  131 109 162
Face 420  199 217 218
Face 421  241 218 217
Face 422  113 126 97
Face 423  28 29 17
Face 424  45 17 29
Face 425  163 215 187
Face 426  188 187 215
Face 427  93 67 94
Face 428  106 123 124
Face 429  75 80 96
Face 430  110 96 80
Face 431  150 180 181
Face 432  57 32 16
Face 433  159 185 239
Face 434  54 73 62
Face 435  72 62 73
Face 436  53 38 75
Face 437  66 75 38
Face 438  204 288 217
Face 439  242 217 288
Face 440  200 221 220
Face 441  1 15 7
Face 442  21 7 15
Face 443  196 202 194
Face 444  222 194 202
Face 445  135 137 136
Face 446  275 136 137
Face 447  237 216 238
Face 448  13 51 14
Face 449  100 86 106
Face 450  123 106 86
Face 451  159 239 246
Face 452  253 246 239
Face 453  55 39 17
Face 454  73 54 90
Face 455  79 90 54
Face 456  153 161 196
Face 457  202 196 161
Face 458  1 3 9
Face 459  6 9 3
Face 460  72 90 104
Face 461  105 104 90
Face 462  88 70 126
Face 463  97 126 70
Face 464  111 120 121
Face 465  158 121 120
Face 466  237 247 245
Face 467  92 78 77
Face 468  212 236 252
Face 469  246 252 236
Face 470  8 16 23
Face 471  22 23 16
Face 472  13 28 40
Face 473  17 40 28
Face 474  69 60 276
Face 475  125 279 153
Face 476  130 153 279
Face 477  262 265 291
Face 478  263 291 265
Face 479  243 234 231
Face 480  193 201 149
Face 481  211 149 201
Face 482  141 158 182
Face 483  197 196 194
Face 484  258 291 260
Face 485  221 191 169
Face 486  210 169 191
Face 487  188 215 223
Face 488  214 223 215
Face 489  157 138 169
Face 490  220 169 138
Face 491  4 7 20
Face 492  21 20 7
Face 493  210 286 192
Face 494  285 192 286
Face 495  124 165 214
Face 496  170 124 287
Face 497  132 187 167
Face 498  166 167 187
Face 499  285 286 223
Face 500  151 184 130
Face 501  160 130 184
Face 502  51 65 14
Face 503  267 14 65
Face 504  159 246 238
Face 505  247 238 246
Face 506  47 57 61
Face 507  76 61 57
Face 508  170 181 140
Face 509  180 140 181
Face 510  50 270 88
Face 511  70 88 270
Face 512  50 88 39
Face 513  71 39 88
Face 514  129 159 144
Face 515  145 144 159
Face 516  263 265 293
Face 517  266 293 265
Face 518  108 115 151
Face 519  146 151 115
Face 520  198 233 209
Face 521  232 209 233
Face 522  224 223 258
Face 523  286 258 223
Face 524  198 209 190
Face 525  208 190 209
Face 526  260 291 293
Face 527  263 293 291
Face 528  160 184 248
Face 529  216 248 184
Face 530  65 40 82
Face 531  99 82 40
Face 532  236 245 246
Face 533  247 246 245
Face 534  206 218 198
Face 535  233 198 218
Face 536  155 174 104
Face 537  162 104 174
Face 538  190 282 207
Face 539  284 207 282
Face 540  29 52 45
Face 541  268 45 52
Face 542  219 168 234
Face 543  231 234 168
Face 544  97 272 113
Face 545  108 113 272
Face 546  132 164 133
Face 547  134 133 164
Face 548  248 245 225
Face 549  249 225 245
Face 550  129 154 159
Face 551  185 159 154
Face 552  145 238 184
Face 553  216 184 238
Face 554  132 118 187
Face 555  163 187 118
Face 556  78 92 111
Face 557  120 111 92
Face 558  194 222 124
Face 559  287 124 222
Face 560  2 18 10
Face 561  37 10 18
Edge 226 253 {sharp}
Edge 226 227 {sharp}
Edge 113 152 {sharp}
Edge 113 125 {sharp}
Edge 113 279 {sharp}
Edge 1 3 {sharp}
Edge 1 9 {sharp}
Edge 1 7 {sharp}
Edge 115 146 {sharp}
Edge 2 18 {sharp}
Edge 2 10 {sharp}
Edge 229 240 {sharp}
Edge 229 261 {sharp}
Edge 229 255 {sharp}
Edge 3 10 {sharp}
Edge 230 242 {sharp}
Edge 230 288 {sharp}
Edge 117 126 {sharp}
Edge 117 118 {sharp}
Edge 4 7 {sharp}
Edge 4 20 {sharp}
Edge 4 12 {sharp}
Edge 231 232 {sharp}
Edge 118 132 {sharp}
Edge 5 24 {sharp}
Edge 5 6 {sharp}
Edge 232 233 {sharp}
Edge 6 9 {sharp}
Edge 233 251 {sharp}
Edge 233 250 {sharp}
Edge 234 243 {sharp}
Edge 8 16 {sharp}
Edge 8 11 {sharp}
Edge 235 286 {sharp}
Edge 9 15 {sharp}
Edge 236 245 {sharp}
Edge 123 274 {sharp}
Edge 10 37 {sharp}
Edge 237 238 {sharp}
Edge 124 165 {sharp}
Edge 124 274 {sharp}
Edge 11 41 {sharp}
Edge 238 246 {sharp}
Edge 12 14 {sharp}
Edge 239 253 {sharp}
Edge 13 28 {sharp}
Edge 13 51 {sharp}
Edge 13 40 {sharp}
Edge 240 258 {sharp}
Edge 240 261 {sharp}
Edge 127 149 {sharp}
Edge 127 139 {sharp}
Edge 15 21 {sharp}
Edge 16 22 {sharp}
Edge 243 289 {sharp}
Edge 243 250 {sharp}
Edge 130 160 {sharp}
Edge 130 279 {sharp}
Edge 17 40 {sharp}
Edge 17 55 {sharp}
Edge 131 154 {sharp}
Edge 18 38 {sharp}
Edge 245 249 {sharp}
Edge 132 164 {sharp}
Edge 132 187 {sharp}
Edge 132 133 {sharp}
Edge 246 247 {sharp}
Edge 246 253 {sharp}
Edge 133 275 {sharp}
Edge 20 30 {sharp}
Edge 20 31 {sharp}
Edge 134 176 {sharp}
Edge 134 164 {sharp}
Edge 135 137 {sharp}
Edge 135 282 {sharp}
Edge 135 136 {sharp}
Edge 22 23 {sharp}
Edge 136 176 {sharp}
Edge 136 281 {sharp}
Edge 23 25 {sharp}
Edge 137 283 {sharp}
Edge 251 289 {sharp}
Edge 138 220 {sharp}
Edge 138 200 {sharp}
Edge 25 42 {sharp}
Edge 252 259 {sharp}
Edge 140 180 {sharp}
Edge 27 32 {sharp}
Edge 254 292 {sharp}
Edge 254 259 {sharp}
Edge 28 29 {sharp}
Edge 255 256 {sharp}
Edge 256 264 {sharp}
Edge 256 262 {sharp}
Edge 143 210 {sharp}
Edge 258 260 {sharp}
Edge 145 159 {sharp}
Edge 32 57 {sharp}
Edge 32 47 {sharp}
Edge 260 293 {sharp}
Edge 34 59 {sharp}
Edge 261 293 {sharp}
Edge 261 266 {sharp}
Edge 148 157 {sharp}
Edge 262 265 {sharp}
Edge 262 291 {sharp}
Edge 149 193 {sharp}
Edge 149 211 {sharp}
Edge 36 64 {sharp}
Edge 263 291 {sharp}
Edge 150 193 {sharp}
Edge 37 53 {sharp}
Edge 264 266 {sharp}
Edge 38 46 {sharp}
Edge 38 267 {sharp}
Edge 265 266 {sharp}
Edge 39 50 {sharp}
Edge 39 55 {sharp}
Edge 39 54 {sharp}
Edge 153 197 {sharp}
Edge 40 99 {sharp}
Edge 154 185 {sharp}
Edge 156 163 {sharp}
Edge 157 169 {sharp}
Edge 45 268 {sharp}
Edge 159 246 {sharp}
Edge 159 239 {sharp}
Edge 47 57 {sharp}
Edge 162 173 {sharp}
Edge 163 187 {sharp}
Edge 50 88 {sharp}
Edge 50 62 {sharp}
Edge 51 65 {sharp}
Edge 165 285 {sharp}
Edge 166 187 {sharp}
Edge 53 75 {sharp}
Edge 167 175 {sharp}
Edge 167 189 {sharp}
Edge 54 73 {sharp}
Edge 54 55 {sharp}
Edge 168 231 {sharp}
Edge 168 219 {sharp}
Edge 55 269 {sharp}
Edge 282 284 {sharp}
Edge 169 220 {sharp}
Edge 170 181 {sharp}
Edge 170 287 {sharp}
Edge 57 67 {sharp}
Edge 171 225 {sharp}
Edge 171 202 {sharp}
Edge 285 286 {sharp}
Edge 172 173 {sharp}
Edge 59 83 {sharp}
Edge 62 270 {sharp}
Edge 62 89 {sharp}
Edge 177 205 {sharp}
Edge 64 101 {sharp}
Edge 65 81 {sharp}
Edge 66 80 {sharp}
Edge 181 201 {sharp}
Edge 68 83 {sharp}
Edge 70 272 {sharp}
Edge 185 253 {sharp}
Edge 72 104 {sharp}
Edge 72 73 {sharp}
Edge 186 215 {sharp}
Edge 188 215 {sharp}
Edge 188 223 {sharp}
Edge 75 80 {sharp}
Edge 75 96 {sharp}
Edge 190 282 {sharp}
Edge 192 210 {sharp}
Edge 80 275 {sharp}
Edge 80 273 {sharp}
Edge 194 222 {sharp}
Edge 84 274 {sharp}
Edge 200 220 {sharp}
Edge 88 116 {sharp}
Edge 89 109 {sharp}
Edge 203 204 {sharp}
Edge 90 105 {sharp}
Edge 204 217 {sharp}
Edge 91 132 {sharp}
Edge 91 133 {sharp}
Edge 93 278 {sharp}
Edge 96 102 {sharp}
Edge 97 113 {sharp}
Edge 213 252 {sharp}
Edge 214 223 {sharp}
Edge 101 148 {sharp}
Edge 216 248 {sharp}
Edge 216 245 {sharp}
Edge 217 241 {sharp}
Edge 217 242 {sharp}
Edge 104 162 {sharp}
Edge 219 234 {sharp}
Edge 106 123 {sharp}
Edge 106 140 {sharp}
Edge 107 274 {sharp}
Edge 107 143 {sharp}
Edge 221 251 {sharp}
Edge 108 113 {sharp}
Edge 108 279 {sharp}
Edge 108 151 {sharp}
Edge 222 249 {sharp}
Edge 109 131 {sharp}
Edge 109 277 {sharp}
Edge 223 224 {sharp}
Edge 225 248 {sharp}
Edge 112 115 {sharp}
Edge 112 277 {sharp}
Edge 112 272 {sharp}
