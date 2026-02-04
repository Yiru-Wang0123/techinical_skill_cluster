# Techinical Skill Cluster Workshop #1: File Paths

2026-02-3

---

## 1. Path Syntax by Operating System

| System      | Separator         | Example Path (Absolute)          |
|-------------|-------------------|----------------------------------|
| Windows     | Backslash `\`     | `C:\Users\name\data.csv`         |
| Mac / Linux | Forward slash `/` | `/Users/name/data.csv`           |

**Fun fact:** Both Python and R accept forward slashes `/` on ALL operating systems. Use forward slashes and your code will work everywhere!

## 2. How to Copy a File Path

**Windows:**

- Hold Shift + Right-click the file → "Copy as path"
- Or: Click the address bar in File Explorer and copy

**Mac:**

- Right-click the file → Hold Option → "Copy as Pathname"
- Or: Drag file into Terminal to see path

## 3. Python (with pandas)

### Check your working directory
```python
import os
print(os.getcwd())    # shows current folder
```

### Import data
```python
import pandas as pd

# option 1: forward slashes (recommended, works everywhere)
df = pd.read_csv("C:/Users/name/Documents/data.csv")

# option 2: raw string with backslashes (windows only)
df = pd.read_csv(r"C:\Users\name\Documents\data.csv")

# option 3: relative path (file in working directory)
df = pd.read_csv("data.csv")
```

### View your data
```python
df.head()        # first 5 rows
df.shape         # (rows, columns)
df.columns       # column names
```

## 4. R

### Check your working directory
```r
getwd()              # shows current folder
setwd("C:/path")     # change working directory
```

### Import data
```r
# option 1: forward slashes (recommended, works everywhere)
df <- read.csv("C:/Users/name/Documents/data.csv")

# option 2: relative path (file in working directory)
df <- read.csv("data.csv")
```

### View your data
```r
head(df)         # first 6 rows
dim(df)          # rows and columns
names(df)        # column names
View(df)         # open in spreadsheet viewer (RStudio)
```

## 5. Absolute vs. Relative Paths

+----------+------------------------------------+----------------------------------+
| Type     | Example                            | When to Use                      |
+==========+====================================+==================================+
| Absolute | `C:/Users/name/project/data.csv`   | One-off scripts, quick tasks     |
+----------+------------------------------------+----------------------------------+
| Relative | `./data.csv`                       | Shared projects, reproducibility |
+----------+------------------------------------+----------------------------------+

**Tip:** Relative paths make your code portable. If you share your project folder, others can run it without changing paths.

### Dot Notation

+--------+--------------------------------------------------+--------------+
| Symbol | Meaning                                          | Example      |
+========+==================================================+==============+
| `.`    | Current directory (where your script is running) | `./data.csv` |
+--------+--------------------------------------------------+--------------+
| `..`   | Parent directory (one folder up)                 | `../data.csv`|
+--------+--------------------------------------------------+--------------+

You can chain `..` to go up multiple levels: `../../file.csv` goes up two folders.

### Example: Navigating a Project Folder

Imagine your project has this structure:

```
my_project/
+-- code/
|   +-- analysis.py
|   +-- helpers/
|       +-- utils.py
+-- data/
|   +-- raw/
|   |   +-- survey.csv
|   +-- cleaned/
|       +-- survey_clean.csv
+-- output/
    +-- results.csv
```

If your **working directory** is `my_project/code/`, here's how to access different files:

+--------------------+------------------------------------+---------------------------------------------------+
| Target File        | Relative Path                      | Explanation                                       |
+====================+====================================+===================================================+
| `survey.csv`       | `../data/raw/survey.csv`           | Go up to `my_project/`, then into `data/raw/`     |
+--------------------+------------------------------------+---------------------------------------------------+
| `survey_clean.csv` | `../data/cleaned/survey_clean.csv` | Go up to `my_project/`, then into `data/cleaned/` |
+--------------------+------------------------------------+---------------------------------------------------+
| `results.csv`      | `../output/results.csv`            | Go up to `my_project/`, then into `output/`       |
+--------------------+------------------------------------+---------------------------------------------------+

If your **working directory** is `my_project/code/helpers/`, accessing `survey.csv`:

```
../../data/raw/survey.csv
   |  |
   |  +-- First `..` goes from helpers/ up to code/
   +----- Second `..` goes from code/ up to my_project/
```

### Examples

###### python 

```python
# from code/ folder, read raw data
df = pd.read_csv("../data/raw/survey.csv")

# ___some data cleaning process____ #

# save cleaned data
df.to_csv("../data/cleaned/survey_clean.csv", index=False)
```


###### R

``` R
# from code/ folder, read raw data
df <- read.csv("../data/raw/survey.csv")

# ____some data cleaning process____ #

# save cleaned data
write.csv(df, "../data/cleaned/survey_clean.csv", row.names = FALSE)
```

## 6. Common Mistakes to Avoid

+------------------------+-------------------------------+----------------------------------------+
| Mistake                | Problem                       | Fix                                    |
+========================+===============================+========================================+
| Forgetting quotes      | `read.csv(data.csv)`          | Add quotes: `"data.csv"`               |
+------------------------+-------------------------------+----------------------------------------+
| Backslashes in Python  | `\U` and `\n` are escape codes| Use `/` or raw string `r"..."`         |
+------------------------+-------------------------------+----------------------------------------+
| File not found         | Wrong working directory       | Check with `getwd()` or `os.getcwd()`  |
+------------------------+-------------------------------+----------------------------------------+
| Typos in path          | Misspelled folder name        | Copy path directly from file explorer  |
+------------------------+-------------------------------+----------------------------------------+


## Quick Reference

| Task                        | Python                           | R                        |
|-----------------------------|----------------------------------|--------------------------|
| Check working directory     | `os.getcwd()`                    | `getwd()`                |
| Change working directory    | `os.chdir("path")`               | `setwd("path")`          |
| Read CSV                    | `pd.read_csv("file.csv")`        | `read.csv("file.csv")`   |
| View first rows             | `df.head()`                      | `head(df)`               |
| View dimensions             | `df.shape`                       | `dim(df)`                |

