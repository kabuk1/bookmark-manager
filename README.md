# Bookmark Manager

## Database Setup
1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE bookmark_manager;`
3. Connect to the database using the `pqsl` command `\c bookmark_manager;`
4. Run the query we have saved in the file `01_create_bookmarks_table.sql`
5. Disconnect from the database
6. Create the database using the `psql` command `CREATE DATABASE bookmark_manager_test;`
7. Connect to the database using the `pqsl` command `\c bookmark_manager_test;`
8. Run the query we have saved in the file `01_create_bookmarks_table.sql`

## User Stories

### User story with model for 'show bookmark list'
```
As a user who likes to remain organised,
So that I can quickly visit website I regularly used websites,
I would like to be able to show a list of my bookmarks.
```
![bookmarks-mamanger-process-modell-US1](https://user-images.githubusercontent.com/44687246/122835183-d0f61a80-d2e7-11eb-878f-8e24001588bc.png)

### User story for 'add new bookmarks'
```
As a user,
So that I can store store a link for later,
I want to add a new bookmark to my list.
```