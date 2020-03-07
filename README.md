# ETL_netflix_movie_db
This is a mock project built for practicing ETL processes.

## Background

## Prerequisites
The project was completed using the following `Python` packages:-
```
os
pandas
json
sqlAlchemy
```
`PostgreSQL` was used to create the final database: `ETL_project`.
## Data Sources
`https://www.kaggle.com/rounakbanik/the-movies-dataset#movies_metadata.csv`

`https://www.kaggle.com/shivamb/netflix-shows`
## Data Clean-up

### 1. Movie metadata
The main movie metadata file `movies_metadata.csv` contains information on approximately 45,000 movies. The following image displays the data is included in the original `.csv`file. 
<p align="center">
  <img src="Images/movie_metadata_data.png">
</p>

For the purpose of this _fictional_ project, only the data regarding **budget, id, original_title, revenue** and **title** was included, as shown below.
<p align="center">
  <img src="Images/movie_metadata_sliced.png">
</p>

The following process flow was adopte to clean-up the sliced `movie_metadata_df` before exporting it as a `.csv` to be loaded in `PostgreSQL`.

* Import all columns of raw data file as `str` datatype in Python using `pandas` dataframe.  
* Slice the dataframe to obtain the required columns.
* Convert the **budget** and **revenue** columns to numeric datatype.

   Whilte, there were no challenges in converting the datatype of **revenue** column to numeric values using `pd.numeric`, the **budget** column had inconsistent datatypes which returned an error. Upon more investigation it was found that three rows did not contain integer values which could be accurately converted to numeric. The decision was made to drop these rows from the original database.
   
   In order to locate and drop these rows, [`.str.match('/')`](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.Series.str.match.html)  function was employed on the **budget** column.

### 2. Movie credits
The original movie credits file had a complex configuration, as shown in the following image.

<p align="center">
  <img src="Images/credits_data.png">
</p>

The file contains only 3 columns with information about the cast and crew of linked to the metadata table using the `movie_id`. For the purpose of this project, we are only interested in the **crew** data, specifically: data regarding the _Writing_ department. Each row contains data in a huge list of dictionary which needed to be parsed properly to finally create a dataframe of just the **movie_id** and **writer**. The following function was developed to be executed in a loop which removed `\`, `[` and `]` from a given record and convert the result to a Python dictionary.

<p align="center">
  <img src="Images/dictify_image.png">
</p>

After conversion of each record to a dictionary, it was straight forward to search for all the writers for a given `movie_id` and create a list of dictionary such as `{movie_id : writer_name}` which was eventually converted into a dataframe and exported as `movie_writers_df.csv`. An snapshot of the final transformed dataframe is shown below.

<p align="center">
  <img src="Images/movie_writers_df_image.png">
</p>

### 3. Netflix titles


