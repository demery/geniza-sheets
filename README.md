# Geniza::Sheets

The script assumes you have a folder of folders with images:

```
    /path/to/data/HalperMaterial/
    ├── h001
    │   ├── h001_wk1_body0001.tif
    │   └── h001_wk1_body0002.tif
    ├── h002
    │   ├── h002_wk1_body0001.tif
    │   ├── h002_wk1_body0002.tif
    │   ├── h002_wk1_body0003.tif
    │   ├── h002_wk1_body0004.tif
    │   ├── h002_wk1_body0005.tif
    │   └── h002_wk1_body0006.tif
    └── h020
        ├── h020_wk1_body0001.tif
        ├── h020_wk1_body0002.tif
        ├── h020_wk1_body0003.tif
        └── h020_wk1_body0004.tif
```

 And a CSV with a column of folder that contains column names:

```csv
...,Folder_Base,...
...,h001,...
...,h002,...
...,h003,...
...,h004,...
```

Here's how to run it:

```shell
ruby the_script.rb path/to/HalperMaterial path/to/halper.csv Folder_Base
```

The script will create a new CSV `output.csv` with one row per image and data
repeated as necessary.
