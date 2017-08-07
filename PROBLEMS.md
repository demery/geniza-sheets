# Problems

## Problems with `JTS_ENA.csv`

The original `JTS_ENA.csv` caught some files that should not have been listed.

```
✔ 10:50 ~/code/GIT/geniza-sheets [ADAPT-for-single-dir L|✚ 1…10] $ diff JTS_ENA.csv test1.csv
5061c5061
< ENA 2857,ENA_2857_tocontinue.tif.jpg,
---
> ENA 2857,,
6407,6412d6406
< ENA 2947,ENA_2947_00001.tif.jpg,ENA_2947_00002.tif.jpg
< ENA 2947,ENA_2947_00003.tif.jpg,ENA_2947_00004.tif.jpg
< ENA 2947,ENA_2947_00005.tif.jpg,ENA_2947_00006.tif.jpg
< ENA 2947,ENA_2947_00007.tif.jpg,ENA_2947_00008.tif.jpg
< ENA 2947,ENA_2947_00009.tif.jpg,ENA_2947_00010.tif.jpg
< ENA 2947,ENA_2947_00011.tif.jpg,ENA_2947_00012.tif.jpg
9904,9906c9898,9899
< ENA 3385,ENA_3385_001_r.tif.jpg,ENA_3385_001_r_1.tif.jpg
< ENA 3385,ENA_3385_001_r_2.tif.jpg,ENA_3385_001_v.tif.jpg
< ENA 3385,ENA_3385_001_v_1.tif.jpg,ENA_3385_001_v_2.tif.jpg
---
> ENA 3385,ENA_3385_001_r.tif.jpg,
> ENA 3385,ENA_3385_001_v.tif.jpg,
```