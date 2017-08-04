# JTS odd cases

## MS

Typical pattern:

```

## ENA

Typical pattern:

```
ENA_1872_001_r.tif.jpg
ENA_1872_001_v.tif.jpg
ENA_1872_002_r.tif.jpg
ENA_1872_002_v.tif.jpg
ENA_1872_003_r.tif.jpg
ENA_1872_003_v.tif.jpg
ENA_1872_004_r.tif.jpg
ENA_1872_004_v.tif.jpg
ENA_1872_009.tif.jpg
```

- **ENA_2947**

Confirm the first of these (0001-0012) are the same as 1r to 6v.

```
ENA_2947_00001.tif.jpg
ENA_2947_00002.tif.jpg
ENA_2947_00003.tif.jpg
ENA_2947_00004.tif.jpg
ENA_2947_00005.tif.jpg
ENA_2947_00006.tif.jpg
ENA_2947_00007.tif.jpg
ENA_2947_00008.tif.jpg
ENA_2947_00009.tif.jpg
ENA_2947_00010.tif.jpg
ENA_2947_00011.tif.jpg
ENA_2947_00012.tif.jpg
ENA_2947_001_r.tif.jpg
ENA_2947_001_v.tif.jpg
ENA_2947_002_r.tif.jpg
ENA_2947_002_v.tif.jpg
ENA_2947_003_r.tif.jpg
ENA_2947_003_v.tif.jpg
ENA_2947_004_r.tif.jpg
ENA_2947_004_v.tif.jpg
ENA_2947_005_r.tif.jpg
ENA_2947_005_v.tif.jpg
ENA_2947_006_r.tif.jpg
ENA_2947_006_v.tif.jpg
```

Decision: skip these 12:

```
ENA_2947_00001.tif.jpg
ENA_2947_00002.tif.jpg
ENA_2947_00003.tif.jpg
ENA_2947_00004.tif.jpg
ENA_2947_00005.tif.jpg
ENA_2947_00006.tif.jpg
ENA_2947_00007.tif.jpg
ENA_2947_00008.tif.jpg
ENA_2947_00009.tif.jpg
ENA_2947_00010.tif.jpg
ENA_2947_00011.tif.jpg
ENA_2947_00012.tif.jpg
```

- **ENA_3385**

Confirm the `_1`, `_2` images are the parts for stitching.

ENA_3385_001_r.tif.jpg
ENA_3385_001_r_1.tif.jpg
ENA_3385_001_r_2.tif.jpg
ENA_3385_001_v.tif.jpg
ENA_3385_001_v_1.tif.jpg
ENA_3385_001_v_2.tif.jpg

Decsion: skip these

```
ENA_3385_001_r_1.tif.jpg
ENA_3385_001_r_2.tif.jpg
ENA_3385_001_v_1.tif.jpg
ENA_3385_001_v_2.tif.jpg
```

- **ENA_3503**

Figure out what these are.

```
ENA_3503_A_001.tif.jpg
ENA_3503_A_002.tif.jpg
ENA_3503_A_003.tif.jpg
ENA_3503_A_004.tif.jpg
ENA_3503_A_005.tif.jpg
ENA_3503_A_006.tif.jpg
ENA_3503_A_007.tif.jpg
ENA_3503_A_008.tif.jpg
ENA_3503_A_009.tif.jpg
ENA_3503_A_010.tif.jpg
ENA_3503_A_011.tif.jpg
ENA_3503_A_012.tif.jpg
ENA_3503_A_013.tif.jpg
ENA_3503_A_014.tif.jpg
ENA_3503_A_015.tif.jpg
ENA_3503_A_016.tif.jpg
ENA_3503_A_017.tif.jpg
ENA_3503_A_018.tif.jpg
ENA_3503_A_019.tif.jpg
ENA_3503_A_020.tif.jpg
ENA_3503_A_021.tif.jpg
ENA_3503_A_022.tif.jpg
ENA_3503_A_023.tif.jpg
ENA_3503_A_024.tif.jpg
ENA_3503_A_025.tif.jpg
ENA_3503_A_026.tif.jpg
ENA_3503_A_027.tif.jpg
ENA_3503_A_028.tif.jpg
ENA_3503_A_029.tif.jpg
ENA_3503_A_030.tif.jpg
ENA_3503_B_001.tif.jpg
ENA_3503_B_002.tif.jpg
ENA_3503_B_003.tif.jpg
ENA_3503_B_004.tif.jpg
ENA_3503_B_005.tif.jpg
ENA_3503_B_006.tif.jpg
ENA_3503_B_007.tif.jpg
ENA_3503_B_008.tif.jpg
ENA_3503_B_009.tif.jpg
ENA_3503_B_010.tif.jpg
ENA_3503_B_011.tif.jpg
ENA_3503_B_012.tif.jpg
ENA_3503_B_013.tif.jpg
ENA_3503_B_014.tif.jpg
```
- **ENA_3598**

What are these 'a' and 'b' images?

```
ENA_3598_002a_r.tif.jpg
ENA_3598_002a_v.tif.jpg
```

**Decision: keep these images.**

- **ENA_3649**

What are these 'a' and 'b' images?


```
ENA_3649_013a_r.tif.jpg
ENA_3649_013a_v.tif.jpg
```

**Decision: keep these images.**