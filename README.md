# ETL_netflix_movie_db
This is a mock project built for practicing ETL processes. 

# Data Sources
`https://www.kaggle.com/rounakbanik/the-movies-dataset#movies_metadata.csv`

`https://www.kaggle.com/shivamb/netflix-shows`

# Paul

* Downloaded the raw file "netflix_titles.csv" (from https://www.kaggle.com/shivamb/netflix-shows) and cleaned it in Excel to remove extraneous columns. Renamed the file "netflix_titles_transformed.csv" and saved it into the Resources folder.

* Created a Jupyter Notebook and read the following cleaned CSVs into a Pandas dataframe, verifying column order and formatting:
	netflix_titles_transformed.csv
	movie_writers_df.csv
	movie_metadata_transformed.csv

* Created a SQL database named "ETL_project" in pgAdmin 4 and wrote a query to create tables for each of the three CSVs. Needed to reformat the "revenue" column in the "metadata" table from FLOAT to NUMERIC(18,1).

* Joined the "metadata" and "credits" tables on the common "id/movid_id" columns, then joined the resulting view with the "titles" table on the common "title" columns.
