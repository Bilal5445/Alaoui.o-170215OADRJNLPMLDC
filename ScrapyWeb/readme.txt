HOW TO SETUP ENV
----------------

1 - Visual Studio : Tools > SQL Server > New Query : connect to (localdb)\MSSQLLocalDB
2 - CREATE DATABASE ScrapyWeb
3 - open and copy/paste db script from DBScripts/170524_script_create_db_with_data.sql
4 - run web app

TEST FB
----------------
1 - web app > accounts > Facebook Applications > Fetch Data : enter public group id : 142220009186235 (mrji group https://web.facebook.com/groups/142220009186235/)

HOW TO LIST TABLES IN DB
------------------------
SELECT TABLE_NAME FROM ScrapyWeb.INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'
