# geniza-csv.rb

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

 And a CSV with a column of folder names (the column name is configurable):

```csv
...,folder_base,...
...,h001,...
...,h002,...
...,h003,...
...,h004,...
```

Here's how to run it:

```shell
Usage: geniza-csv.rb SEARCH_DIRECTORY CSV_FILE


The following values can be changed as environment variables:

  GLOB_PATTERN          default: '*.jpg'
  FILE_PATH_COLUMN      default: 'file_name'
  OUTPUT_FILE           default: '/Users/emeryr/code/GIT/geniza-sheets/output.csv'
  FOLDER_COLUMN         default: 'folder_base'
```

The script will create a new CSV `output.csv` with one row per image and data
repeated as necessary.

Test the script by running:

```shell
$ ruby geniza-csv.rb data/HalperMaterial data/Halper-Marc-with-folder_base-short.csv
```
