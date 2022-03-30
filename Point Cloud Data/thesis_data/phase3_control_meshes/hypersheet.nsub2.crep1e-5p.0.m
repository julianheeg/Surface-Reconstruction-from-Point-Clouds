# |Created using:
# | Subdivfit -fi - -mf - -record hypersheet.nsub2.crep1e-5p.rec -crep 1e-5
# |  -csharp .2e-5 -reconstruct
# |12752 points read
# |Initial mesh:
# |Genus: c=1 b=3  v=487 f=917 e=1407  genus=1
# |Starting reconstruction sequence
# | crep=1e-05, csharp=2e-06
# | internal xform: F 1  1 0 0  0 1 0  0 0 1  0 0 0  0
# |
# |fgfit_before: v=487 nse=0/1407  edis=0.00564143 etot=0.0105114
# |fgfit_after : v=487 nse=0/1407  edis=0.000499945 etot=0.00536995
# | (_fgfit:                710.95)
# |
# |Stoc, crep=1e-05 csharp=2e-06 wcrep=1e-05 wcsharp=2e-06
# |stoc_before: v=487 nse=0/1407  edis=0.000499944 etot=0.00536994
# |it 1774, last search: 14 wasted attempts
# |New mesh:
# |Genus: c=1 b=3  v=252 f=447 e=702  genus=1
# |Summary of attempts and results:
# |                          ecol      espl      eswa      esha
# |      total_attempts      1774         0         0         0
# |             success       235         0         0         0
# |     positive_energy      1420         0         0         0
# |        bad_dihedral        30         0         0         0
# |           bad_sharp        88         0         0         0
# |        illegal_move         1         0         0         0
# | last cedis=0.000966174 cetot=0.00348617
# |stoc_after : v=252 nse=0/702  edis=0.000966167 etot=0.00348617
# | (_stoc:                6084.22)
# |
# |fgfit_before: v=252 nse=0/702  edis=0.000966165 etot=0.00348616
# |fgfit_after : v=252 nse=0/702  edis=0.000829756 etot=0.00334976
# | (_fgfit:                202.04)
# |
# |Stoc, crep=1e-05 csharp=2e-06 wcrep=1e-05 wcsharp=2e-06
# |stoc_before: v=252 nse=0/702  edis=0.000829759 etot=0.00334976
# |it 702, last search: 702 wasted attempts
# |New mesh:
# |Genus: c=1 b=3  v=252 f=447 e=702  genus=1
# |Summary of attempts and results:
# |                          ecol      espl      eswa      esha
# |      total_attempts         0         0         0       702
# |             success         0         0         0         0
# |     positive_energy         0         0         0       131
# |        bad_dihedral         0         0         0         0
# |           bad_sharp         0         0         0       508
# |        illegal_move         0         0         0        63
# | last cedis=0.000829759 cetot=0.00334976
# |stoc_after : v=252 nse=0/702  edis=0.000829757 etot=0.00334976
# | (_stoc:                 342.07)
# |
# |fgfit_before: v=252 nse=0/702  edis=0.000829758 etot=0.00334976
# |fgfit_after : v=252 nse=0/702  edis=0.000778941 etot=0.00329894
# | (_fgfit:                187.46)
# |
# |Stoc, crep=1e-05 csharp=2e-06 wcrep=1e-05 wcsharp=2e-06
# |stoc_before: v=252 nse=0/702  edis=0.000778946 etot=0.00329895
# |it 782, last search: 57 wasted attempts
# |New mesh:
# |Genus: c=1 b=3  v=241 f=433 e=677  genus=1
# |Summary of attempts and results:
# |                          ecol      espl      eswa      esha
# |      total_attempts       782         0       769       771
# |             success        11         0         5         2
# |     positive_energy       759         0       635       154
# |        bad_dihedral        12         0        68         0
# |           bad_sharp         0         0         0       554
# |        illegal_move         0         0        61        61
# | last cedis=0.000808486 cetot=0.00321849
# |stoc_after : v=241 nse=0/677  edis=0.000808481 etot=0.00321848
# | (_stoc:                4097.55)
# |
# |fgfit_before: v=241 nse=0/677  edis=0.000808483 etot=0.00321848
# |fgfit_after : v=241 nse=0/677  edis=0.00075426 etot=0.00316426
# | (_fgfit:                193.49)
# | (Subdivfit:           11822.46)
# |Summary of timers (cpu=sgi host=espresso.cs.washington.edu):
# | ___submesh:         (3404  )    0.28:8.85     av=     0.86   sum=  2936.03
# | ____gmakeSpatial:   (10    )    5.51:10.01    av=     6.47   sum=    64.74
# | ____gspatialproject:(10    )    4.51:7.77     av=     5.11   sum=    51.09
# | ___gallproject:     (10    )   10.12:17.92    av=    11.69   sum=   116.92
# | ___computegrad:     (293   )    1.20:1.78     av=     1.34   sum=   393.00
# | ___gneighproject:   (478   )    1.34:1.88     av=     1.51   sum=   722.24
# | __fgfit_iter:       (70    )   13.06:22.26    av=    17.36   sum=  1215.43
# | _fgfit:             (4     )  187.46:710.95   av=   323.49   sum=  1293.94
# | _initial_fit:       (3     )   14.47:23.15    av=    17.46   sum=    52.38
# | ____lmakespatial:   (3394  )    0.00:0.21     av=     0.09   sum=   305.45
# | ____lspatialproject:(3394  )    0.01:0.24     av=     0.09   sum=   315.64
# | ___lallproject:     (3394  )    0.01:0.44     av=     0.18   sum=   624.49
# | ____lneighproject:  (17530 )    0.06:0.63     av=     0.21   sum=  3686.14
# | ____lcombinations:  (17530 )    0.00:0.21     av=     0.05   sum=   788.90
# | _____qrdLLS:        (17530 )    0.00:0.16     av=     0.05   sum=   820.95
# | ____lsolve:         (17530 )    0.00:0.19     av=     0.06   sum=  1053.78
# | ___loptimize:       (17530 )    0.10:0.96     av=     0.34   sum=  6011.46
# | __tryecol:          (2467  )    0.85:9.02     av=     3.59   sum=  8867.63
# | __lattempt:         (3258  )    0.00:10.94    av=     3.20   sum= 10427.77
# | _stoc:              (3     )  342.07:6084.22  av=  3507.95   sum= 10523.84
# | __tryesha:          (287   )    1.77:7.14     av=     2.38   sum=   683.19
# | __tryeswa:          (640   )    0.64:3.03     av=     1.29   sum=   827.04
# | Subdivfit:          (1     )        :         av= 11822.46   sum= 11822.46
# |Summary of statistics:
# |Sospobcells:(423488 )          1:11          av=2.77866     sd=1.29399
# |Sssncellsv: (750091 )          1:100         av=1.73286     sd=2.57152
# |Sssnelemsv: (750091 )          1:110         av=12.0916     sd=7.85565
# |Sospcelln:  (166666 )          1:80          av=7.06041     sd=5.2931
# |Sprojquick: (32233053)          0:1           av=0.53575     sd=0.49872
# |Sprojnei:   (14964201)          0:4           av=0.134661    sd=0.349459
# |Sprojf:     (14964201)          3:36          av=9.73649     sd=2.32347
# |Sprojunexp: (1975094)          0:1           av=5.06305e-07 sd=0.000711551
# |Sneval:     (70     )          6:9           av=6.82857     sd=0.613175
# |Stmin:      (70     )  0.0125944:0.0424714   av=0.0281675   sd=0.00708465
# |Ssetfrem:   (3394   )        224:1568        av=807.378     sd=263.884
# |Ssetvrem:   (3394   )        120:824         av=427.142     sd=138.817
# |Secolpts:   (2467   )        569:2785        av=1563.88     sd=421.408
# |Secolmf:    (2467   )         22:111         av=66.3709     sd=17.0381
# |Secolmv:    (2467   )          4:14          av=9.18687     sd=1.52605
# |Secolsmv:   (2467   )        205:967         av=582.966     sd=144.877
# |Soptnit:    (3353   )          2:10          av=3.07814     sd=2.18325
# |Soptnig:    (254    )         11:12          av=11.0472     sd=0.212579
# |Sechange:   (253    )-2.2012e-05:-7.04185e-07 av=-7.76376e-06 sd=4.21301e-06
# |Seshapts:   (287    )       1356:2666        av=2012.87     sd=276.624
# |Seshamf:    (287    )         59:100         av=80.0906     sd=8.12181
# |Seshamv:    (287    )          7:13          av=10.4181     sd=1.04417
# |Seshasmv:   (287    )        519:873         av=699.383     sd=70.5301
# |Seswapts:   (640    )        585:1829        av=1124.87     sd=211.263
# |Seswamf:    (640    )         19:59          av=41.9813     sd=9.46022
# |Seswamv:    (640    )          4:4           av=4           sd=0
# |Seswamvcvih:(640    )        175:523         av=374.844     sd=80.9991
# Created using:
#  Filtermesh hypersheet.nsub2.crep1e-5p.0.m -renumber
# (Timing on cpu=sgi host=belvedere.microsoft.com)
#  (_readmesh:               0.04)
#  (_renumber:               0.00)
#  (Filtermesh:              0.04)
Vertex 1  0.490205 0.525877 0.383769
Vertex 2  0.448862 0.212099 0.656061
Vertex 3  0.513557 0.208643 0.656673
Vertex 4  0.422148 0.209655 0.103552
Vertex 5  0.488544 0.259995 0.134591
Vertex 6  0.556951 0.281897 0.620959
Vertex 7  0.800665 0.498585 0.651678
Vertex 8  0.793374 0.469132 0.0997058
Vertex 9  0.732316 0.450051 0.124236
Vertex 10  0.685236 0.503562 0.164558
Vertex 11  0.740864 0.454218 0.627182
Vertex 12  0.726459 0.528129 0.617096
Vertex 13  0.684901 0.510681 0.572693
Vertex 14  0.53141 0.349066 0.227389
Vertex 15  0.48468 0.313028 0.179108
Vertex 16  0.554573 0.272582 0.138179
Vertex 17  0.525624 0.205154 0.104765
Vertex 18  0.639382 0.503469 0.199274
Vertex 19  0.568951 0.342431 0.584874
Vertex 20  0.504276 0.484892 0.380635
Vertex 21  0.777094 0.390103 0.652768
Vertex 22  0.604969 0.221679 0.655934
Vertex 23  0.759332 0.352086 0.100805
Vertex 24  0.657371 0.49463 0.529876
Vertex 25  0.497371 0.354392 0.566346
Vertex 26  0.651011 0.323323 0.135669
Vertex 27  0.598803 0.220783 0.102853
Vertex 28  0.717125 0.292898 0.653768
Vertex 29  0.702188 0.392764 0.132508
Vertex 30  0.679974 0.263488 0.102876
Vertex 31  0.693455 0.410408 0.609835
Vertex 32  0.641133 0.333469 0.611801
Vertex 33  0.648302 0.52556 0.482478
Vertex 34  0.653796 0.489307 0.471539
Vertex 35  0.603367 0.502907 0.25297
Vertex 36  0.536596 0.501947 0.367354
Vertex 37  0.582376 0.333421 0.180623
Vertex 38  0.630127 0.42897 0.197515
Vertex 39  0.629174 0.429713 0.543963
Vertex 40  0.485227 0.335251 0.301751
Vertex 41  0.45039 0.416823 0.480128
Vertex 42  0.544405 0.407643 0.48382
Vertex 43  0.56523 0.0887271 0.364456
Vertex 44  0.714976 0.482234 0.418178
Vertex 45  0.475282 0.29031 0.330389
Vertex 46  0.587374 0.180708 0.361587
Vertex 47  0.814669 0.397874 0.393946
Vertex 48  0.82074 0.540922 0.397821
Vertex 49  0.605349 0.434435 0.491032
Vertex 50  0.539088 0.354941 0.283461
Vertex 51  0.441589 0.212187 0.355452
Vertex 52  0.499684 0.450742 0.404425
Vertex 53  0.59457 0.452674 0.252894
Vertex 54  0.741149 0.555298 0.408386
Vertex 55  0.901593 0.407687 0.389893
Vertex 56  0.680066 0.418155 0.405619
Vertex 57  0.58736 0.397109 0.238245
Vertex 58  0.542544 0.463268 0.376
Vertex 59  0.576745 0.456697 0.327178
Vertex 60  0.572848 0.507227 0.315116
Vertex 61  0.738223 0.163256 0.372875
Vertex 62  0.579128 0.30288 0.348672
Vertex 63  0.696344 0.272004 0.375776
Vertex 64  0.628407 0.448666 0.464972
Vertex 65  0.840369 0.270408 0.383675
Vertex 66  0.573484 0.391764 0.28202
Vertex 67  0.583088 0.384267 0.331872
Vertex 68  0.620615 0.380705 0.367866
Vertex 69  0.566136 0.423166 0.411368
Vertex 70  0.569536 0.428965 0.360676
Vertex 71  0.603873 0.411796 0.40411
Vertex 72  0.484115 0.738033 0.631938
Vertex 73  0.566141 0.733671 0.132426
Vertex 74  0.480155 0.73718 0.135871
Vertex 75  0.572173 0.787559 0.103818
Vertex 76  0.556978 0.743824 0.638119
Vertex 77  0.728848 0.526814 0.129156
Vertex 78  0.78633 0.562279 0.099315
Vertex 79  0.559613 0.686436 0.170674
Vertex 80  0.477633 0.682408 0.184604
Vertex 81  0.50329 0.683727 0.592034
Vertex 82  0.703193 0.572272 0.611148
Vertex 83  0.614992 0.686166 0.617501
Vertex 84  0.651691 0.754078 0.654991
Vertex 85  0.714855 0.62033 0.123777
Vertex 86  0.484466 0.64886 0.562509
Vertex 87  0.637078 0.758914 0.102981
Vertex 88  0.536747 0.653745 0.219191
Vertex 89  0.475518 0.649553 0.244732
Vertex 90  0.775813 0.613569 0.652509
Vertex 91  0.687974 0.632864 0.621877
Vertex 92  0.724486 0.693305 0.654393
Vertex 93  0.438539 0.607368 0.524801
Vertex 94  0.67218 0.582752 0.158626
Vertex 95  0.532689 0.540702 0.387882
Vertex 96  0.642516 0.672331 0.141193
Vertex 97  0.69515 0.722737 0.101955
Vertex 98  0.758155 0.644729 0.100555
Vertex 99  0.521057 0.65283 0.275952
Vertex 100  0.518797 0.602478 0.504965
Vertex 101  0.615171 0.558091 0.216485
Vertex 102  0.449924 0.826169 0.360225
Vertex 103  0.624503 0.585626 0.553618
Vertex 104  0.518141 0.681959 0.31325
Vertex 105  0.478094 0.662255 0.298312
Vertex 106  0.68028 0.525 0.437923
Vertex 107  0.502903 0.750102 0.34213
Vertex 108  0.903968 0.555757 0.391364
Vertex 109  0.869622 0.673804 0.386117
Vertex 110  0.574647 0.623138 0.551356
Vertex 111  0.596718 0.619991 0.200663
Vertex 112  0.647316 0.541062 0.540512
Vertex 113  0.550138 0.823331 0.360638
Vertex 114  0.498845 0.910474 0.364033
Vertex 115  0.589437 0.551095 0.260279
Vertex 116  0.62758 0.551426 0.478023
Vertex 117  0.573121 0.584229 0.285896
Vertex 118  0.556146 0.57926 0.455175
Vertex 119  0.443571 0.576885 0.449206
Vertex 120  0.500159 0.560096 0.419011
Vertex 121  0.585716 0.579889 0.488541
Vertex 122  0.556379 0.621957 0.276858
Vertex 123  0.636236 0.770011 0.367195
Vertex 124  0.770475 0.676107 0.385733
Vertex 125  0.653163 0.884374 0.367495
Vertex 126  0.693806 0.714016 0.376117
Vertex 127  0.791964 0.788915 0.37841
Vertex 128  0.566737 0.672797 0.338966
Vertex 129  0.575094 0.570318 0.400507
Vertex 130  0.571576 0.561216 0.345701
Vertex 131  0.655024 0.574983 0.423753
Vertex 132  0.692991 0.640618 0.38783
Vertex 133  0.611037 0.575038 0.431112
Vertex 134  0.578399 0.647478 0.336883
Vertex 135  0.617503 0.677868 0.361684
Vertex 136  0.585373 0.602111 0.349886
Vertex 137  0.624704 0.614002 0.37835
Vertex 138  0.546533 0.792464 0.656672
Vertex 139  0.256921 0.463369 0.626931
Vertex 140  0.287534 0.512443 0.142006
Vertex 141  0.280003 0.533433 0.612877
Vertex 142  0.324389 0.433047 0.572073
Vertex 143  0.45094 0.789582 0.656117
Vertex 144  0.466121 0.79844 0.104505
Vertex 145  0.353561 0.520362 0.193459
Vertex 146  0.221828 0.597636 0.651592
Vertex 147  0.404925 0.695417 0.617666
Vertex 148  0.284802 0.614612 0.123071
Vertex 149  0.235451 0.632318 0.100468
Vertex 150  0.331278 0.5099 0.546409
Vertex 151  0.345628 0.520749 0.520477
Vertex 152  0.366083 0.764011 0.103013
Vertex 153  0.334567 0.673981 0.628952
Vertex 154  0.295414 0.711563 0.653337
Vertex 155  0.248876 0.651081 0.653793
Vertex 156  0.36421 0.76112 0.656161
Vertex 157  0.292239 0.710591 0.101765
Vertex 158  0.325948 0.595339 0.597214
Vertex 159  0.359417 0.586655 0.179328
Vertex 160  0.404596 0.692494 0.148057
Vertex 161  0.35214 0.649243 0.144239
Vertex 162  0.38297 0.510851 0.23393
Vertex 163  0.401794 0.506614 0.258715
Vertex 164  0.375773 0.636906 0.58644
Vertex 165  0.352984 0.464556 0.49719
Vertex 166  0.340189 0.515291 0.471866
Vertex 167  0.313613 0.506627 0.449374
Vertex 168  0.413493 0.634996 0.199327
Vertex 169  0.36303 0.584139 0.555293
Vertex 170  0.269294 0.510861 0.42174
Vertex 171  0.199236 0.50891 0.39957
Vertex 172  0.0925698 0.421172 0.391327
Vertex 173  0.45738 0.630358 0.25897
Vertex 174  0.355766 0.884046 0.367803
Vertex 175  0.457409 0.469965 0.366479
Vertex 176  0.457299 0.529122 0.367121
Vertex 177  0.375386 0.565433 0.490823
Vertex 178  0.101816 0.60671 0.38997
Vertex 179  0.412142 0.595999 0.238067
Vertex 180  0.217035 0.614549 0.392261
Vertex 181  0.438874 0.714154 0.344362
Vertex 182  0.427305 0.57877 0.295591
Vertex 183  0.429717 0.545067 0.324167
Vertex 184  0.427676 0.472184 0.316506
Vertex 185  0.370148 0.777405 0.36467
Vertex 186  0.2491 0.818635 0.374868
Vertex 187  0.434057 0.614499 0.303388
Vertex 188  0.422681 0.643641 0.333497
Vertex 189  0.161146 0.729533 0.382914
Vertex 190  0.279208 0.706682 0.37945
Vertex 191  0.441594 0.561641 0.391728
Vertex 192  0.353319 0.554639 0.456923
Vertex 193  0.304165 0.610233 0.39824
Vertex 194  0.365982 0.689939 0.364958
Vertex 195  0.343574 0.58542 0.422271
Vertex 196  0.399325 0.585043 0.414454
Vertex 197  0.384795 0.613331 0.381332
Vertex 198  0.418254 0.592758 0.346249
Vertex 199  0.199711 0.502435 0.652882
Vertex 200  0.463375 0.285535 0.619824
Vertex 201  0.19896 0.503778 0.0994144
Vertex 202  0.35875 0.240558 0.655342
Vertex 203  0.382623 0.291313 0.629305
Vertex 204  0.388248 0.283143 0.12962
Vertex 205  0.303271 0.420625 0.141159
Vertex 206  0.218972 0.398174 0.652415
Vertex 207  0.273994 0.304855 0.654478
Vertex 208  0.321041 0.264856 0.102623
Vertex 209  0.285185 0.300239 0.100695
Vertex 210  0.23436 0.367274 0.10044
Vertex 211  0.306466 0.363633 0.622616
Vertex 212  0.339435 0.352068 0.141084
Vertex 213  0.408616 0.331357 0.17414
Vertex 214  0.38002 0.348605 0.596606
Vertex 215  0.438433 0.365073 0.567874
Vertex 216  0.473181 0.36148 0.256251
Vertex 217  0.433554 0.35293 0.200132
Vertex 218  0.365616 0.437478 0.198003
Vertex 219  0.398197 0.398821 0.544095
Vertex 220  0.353333 0.434238 0.547637
Vertex 221  0.404492 0.429816 0.254598
Vertex 222  0.218798 0.411214 0.395335
Vertex 223  0.158693 0.274804 0.383098
Vertex 224  0.432674 0.390673 0.292236
Vertex 225  0.393218 0.105536 0.365612
Vertex 226  0.440638 0.331564 0.331072
Vertex 227  0.394684 0.427221 0.481658
Vertex 228  0.305554 0.433367 0.416856
Vertex 229  0.382766 0.266345 0.364193
Vertex 230  0.262149 0.161137 0.373763
Vertex 231  0.274775 0.266308 0.377604
Vertex 232  0.301919 0.376228 0.394801
Vertex 233  0.333546 0.457796 0.444636
Vertex 234  0.440979 0.431218 0.42535
Vertex 235  0.383425 0.423498 0.439995
Vertex 236  0.426872 0.431258 0.320988
Vertex 237  0.366918 0.350853 0.370865
Vertex 238  0.44539 0.441133 0.394024
Vertex 239  0.352419 0.403304 0.406719
Vertex 240  0.416322 0.368381 0.338092
Vertex 241  0.405104 0.409632 0.383676
Face 1  3 2 6
Face 2  11 12 7
Face 3  11 13 12
Face 4  15 16 5
Face 5  8 23 9
Face 6  25 19 6
Face 7  27 16 26
Face 8  26 30 27
Face 9  9 29 10
Face 10  6 28 22
Face 11  29 9 23
Face 12  23 30 29
Face 13  21 31 11
Face 14  6 32 28
Face 15  24 34 33
Face 16  36 20 1
Face 17  19 32 6
Face 18  15 37 16
Face 19  30 26 29
Face 20  31 24 13
Face 21  14 37 15
Face 22  37 38 29
Face 23  26 37 29
Face 24  16 37 26
Face 25  19 39 32
Face 26  24 39 34
Face 27  49 19 25
Face 28  42 49 25
Face 29  41 42 25
Face 30  50 14 40
Face 31  43 46 51
Face 32  49 39 19
Face 33  38 53 18
Face 34  53 35 18
Face 35  44 48 54
Face 36  36 58 20
Face 37  57 38 37
Face 38  48 44 47
Face 39  58 52 20
Face 40  50 57 14
Face 41  38 57 53
Face 42  61 63 46
Face 43  49 64 39
Face 44  65 63 61
Face 45  47 63 65
Face 46  56 47 44
Face 47  66 57 50
Face 48  64 34 39
Face 49  62 45 46
Face 50  63 62 46
Face 51  45 62 50
Face 52  59 58 36
Face 53  67 66 50
Face 54  34 64 56
Face 55  47 56 63
Face 56  63 68 62
Face 57  42 69 49
Face 58  56 68 63
Face 59  70 58 59
Face 60  58 69 52
Face 61  67 70 59
Face 62  64 68 56
Face 63  71 64 49
Face 64  69 71 49
Face 65  64 71 68
Face 66  70 69 58
Face 67  70 71 69
Face 68  71 67 68
Face 69  67 71 70
Face 70  76 72 138
Face 71  8 77 78
Face 72  72 76 81
Face 73  7 82 90
Face 74  7 12 82
Face 75  78 85 98
Face 76  78 77 85
Face 77  90 91 92
Face 78  76 83 81
Face 79  12 13 82
Face 80  90 82 91
Face 81  1 95 36
Face 82  89 88 99
Face 83  73 96 79
Face 84  85 94 96
Face 85  82 103 91
Face 86  18 101 94
Face 87  108 48 55
Face 88  93 86 100
Face 89  79 111 88
Face 90  79 96 111
Face 91  24 112 13
Face 92  24 33 112
Face 93  82 13 112
Face 94  102 113 114
Face 95  86 110 100
Face 96  44 54 106
Face 97  48 108 109
Face 98  44 106 34
Face 99  33 116 112
Face 100  101 115 117
Face 101  112 116 103
Face 102  1 120 95
Face 103  110 121 100
Face 104  88 111 122
Face 105  88 122 99
Face 106  34 106 33
Face 107  125 123 127
Face 108  113 123 125
Face 109  48 124 54
Face 110  123 126 127
Face 111  127 124 109
Face 112  126 124 127
Face 113  116 121 103
Face 114  110 103 121
Face 115  107 104 128
Face 116  106 116 33
Face 117  60 130 115
Face 118  60 36 130
Face 119  104 99 128
Face 120  106 54 131
Face 121  100 121 118
Face 122  124 126 132
Face 123  124 132 54
Face 124  116 133 121
Face 125  54 132 131
Face 126  99 134 128
Face 127  99 122 134
Face 128  123 128 135
Face 129  121 133 118
Face 130  134 122 136
Face 131  128 134 135
Face 132  132 137 131
Face 133  95 130 36
Face 134  95 129 130
Face 135  118 133 129
Face 136  117 130 136
Face 137  72 143 138
Face 138  199 141 139
Face 139  141 142 139
Face 140  146 141 199
Face 141  143 72 147
Face 142  143 147 156
Face 143  148 140 201
Face 144  153 155 154
Face 145  81 147 72
Face 146  74 152 144
Face 147  153 158 155
Face 148  147 153 156
Face 149  153 154 156
Face 150  159 140 148
Face 151  80 160 74
Face 152  152 161 157
Face 153  161 159 148
Face 154  160 152 74
Face 155  160 161 152
Face 156  159 145 140
Face 157  147 164 153
Face 158  86 147 81
Face 159  158 150 141
Face 160  164 158 153
Face 161  168 160 80
Face 162  158 169 150
Face 163  168 161 160
Face 164  171 178 172
Face 165  86 164 147
Face 166  164 169 158
Face 167  89 168 80
Face 168  104 105 99
Face 169  151 166 165
Face 170  105 89 99
Face 171  164 93 169
Face 172  159 162 145
Face 173  86 93 164
Face 174  175 176 20
Face 175  168 159 161
Face 176  176 1 20
Face 177  177 166 151
Face 178  179 162 159
Face 179  173 168 89
Face 180  107 181 104
Face 181  181 105 104
Face 182  177 169 93
Face 183  163 183 184
Face 184  182 183 163
Face 185  185 107 102
Face 186  188 173 105
Face 187  189 190 186
Face 188  186 190 185
Face 189  170 180 171
Face 190  187 179 173
Face 191  185 181 107
Face 192  1 191 120
Face 193  191 119 120
Face 194  166 192 167
Face 195  167 193 170
Face 196  193 180 170
Face 197  179 182 162
Face 198  183 176 184
Face 199  93 119 177
Face 200  194 181 185
Face 201  195 193 167
Face 202  182 179 187
Face 203  192 195 167
Face 204  190 194 185
Face 205  193 190 180
Face 206  181 188 105
Face 207  188 187 173
Face 208  196 195 192
Face 209  177 196 192
Face 210  119 196 177
Face 211  176 191 1
Face 212  183 191 176
Face 213  188 182 187
Face 214  196 197 195
Face 215  195 197 193
Face 216  194 197 188
Face 217  198 183 182
Face 218  188 198 182
Face 219  198 191 183
Face 220  197 198 188
Face 221  198 196 191
Face 222  198 197 196
Face 223  2 200 6
Face 224  199 139 206
Face 225  6 200 25
Face 226  208 204 4
Face 227  141 150 142
Face 228  210 205 209
Face 229  203 202 207
Face 230  206 211 207
Face 231  207 211 203
Face 232  5 204 213
Face 233  203 215 200
Face 234  203 214 215
Face 235  200 215 25
Face 236  5 213 15
Face 237  139 142 211
Face 238  140 145 205
Face 239  212 213 204
Face 240  15 216 14
Face 241  213 217 15
Face 242  145 218 205
Face 243  145 162 218
Face 244  205 218 212
Face 245  214 219 215
Face 246  151 165 150
Face 247  212 218 213
Face 248  142 150 220
Face 249  46 45 51
Face 250  142 219 214
Face 251  142 220 219
Face 252  215 41 25
Face 253  162 221 218
Face 254  150 165 220
Face 255  222 171 172
Face 256  172 223 222
Face 257  50 40 45
Face 258  213 221 217
Face 259  216 217 224
Face 260  162 163 221
Face 261  220 165 219
Face 262  215 219 41
Face 263  221 224 217
Face 264  163 184 221
Face 265  165 227 219
Face 266  170 228 167
Face 267  225 229 230
Face 268  230 231 223
Face 269  167 228 233
Face 270  52 42 234
Face 271  225 51 229
Face 272  40 216 226
Face 273  42 41 234
Face 274  167 233 166
Face 275  170 222 228
Face 276  40 226 45
Face 277  166 233 165
Face 278  165 235 227
Face 279  219 227 41
Face 280  51 45 229
Face 281  165 233 235
Face 282  184 236 221
Face 283  229 237 231
Face 284  222 232 228
Face 285  231 237 232
Face 286  45 226 229
Face 287  176 175 184
Face 288  226 216 224
Face 289  229 226 237
Face 290  233 228 235
Face 291  20 238 175
Face 292  227 235 41
Face 293  232 239 228
Face 294  41 235 234
Face 295  175 238 184
Face 296  226 224 240
Face 297  228 239 235
Face 298  184 238 236
Face 299  226 240 237
Face 300  232 237 239
Face 301  235 239 241
Face 302  236 238 241
Face 303  235 241 234
Face 304  234 241 238
Face 305  239 237 241
Face 306  237 240 241
Face 307  229 231 230
Face 308  47 55 48
Face 309  216 15 217
Face 310  21 11 7
Face 311  48 109 124
Face 312  44 34 56
Face 313  43 51 225
Face 314  120 129 95
Face 315  14 216 40
Face 316  18 94 10
Face 317  136 122 117
Face 318  171 222 170
Face 319  8 9 77
Face 320  10 77 9
Face 321  52 234 238
Face 322  113 125 114
Face 323  116 106 131
Face 324  59 66 67
Face 325  171 180 178
Face 326  189 178 180
Face 327  196 119 191
Face 328  31 39 24
Face 329  69 42 52
Face 330  89 80 88
Face 331  194 188 181
Face 332  133 137 129
Face 333  136 129 137
Face 334  201 149 148
Face 335  114 174 102
Face 336  177 192 166
Face 337  52 238 20
Face 338  213 218 221
Face 339  89 105 173
Face 340  135 134 136
Face 341  224 221 236
Face 342  205 212 209
Face 343  79 88 80
Face 344  204 5 4
Face 345  93 100 119
Face 346  129 120 118
Face 347  84 83 138
Face 348  76 138 83
Face 349  13 11 31
Face 350  118 120 100
Face 351  119 100 120
Face 352  68 67 62
Face 353  96 97 85
Face 354  98 85 97
Face 355  211 206 139
Face 356  86 81 110
Face 357  83 110 81
Face 358  132 126 137
Face 359  135 137 126
Face 360  4 5 17
Face 361  62 67 50
Face 362  148 149 161
Face 363  157 161 149
Face 364  35 53 60
Face 365  59 60 53
Face 366  208 209 204
Face 367  212 204 209
Face 368  135 126 123
Face 369  73 79 74
Face 370  80 74 79
Face 371  168 173 159
Face 372  179 159 173
Face 373  57 37 14
Face 374  151 150 177
Face 375  169 177 150
Face 376  112 103 82
Face 377  16 27 5
Face 378  17 5 27
Face 379  129 136 130
Face 380  35 115 18
Face 381  101 18 115
Face 382  31 32 39
Face 383  73 74 75
Face 384  144 75 74
Face 385  75 87 73
Face 386  10 29 18
Face 387  38 18 29
Face 388  28 32 21
Face 389  31 21 32
Face 390  201 140 210
Face 391  205 210 140
Face 392  180 190 189
Face 393  115 130 117
Face 394  102 107 113
Face 395  223 231 222
Face 396  232 222 231
Face 397  2 202 200
Face 398  203 200 202
Face 399  35 60 115
Face 400  224 236 240
Face 401  241 240 236
Face 402  22 3 6
Face 403  107 128 113
Face 404  123 113 128
Face 405  111 101 122
Face 406  117 122 101
Face 407  83 91 110
Face 408  103 110 91
Face 409  43 61 46
Face 410  182 163 162
Face 411  116 131 133
Face 412  96 94 111
Face 413  101 111 94
Face 414  194 190 197
Face 415  193 197 190
Face 416  146 155 141
Face 417  158 141 155
Face 418  87 97 73
Face 419  96 73 97
Face 420  65 55 47
Face 421  53 57 59
Face 422  66 59 57
Face 423  137 135 136
Face 424  36 60 59
Face 425  77 10 85
Face 426  94 85 10
Face 427  83 84 91
Face 428  92 91 84
Face 429  211 142 203
Face 430  214 203 142
Face 431  102 174 185
Face 432  186 185 174
Face 433  131 137 133
