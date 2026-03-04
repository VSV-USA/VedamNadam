===============================================
  VEDAM NADAM - Local Hosting Instructions
===============================================

PREREQUISITES
-------------
- Node.js version 18 or newer (download from https://nodejs.org)


STEPS TO RUN LOCALLY
--------------------

1. Unzip the downloaded project folder.

2. Open a terminal (Command Prompt, PowerShell, or Terminal) 
   and navigate to the unzipped folder:

       cd vedam-nadam

3. Install dependencies:

       npm install

4. Start the application:

   On Mac or Linux:

       npm run dev

   On Windows:
   
       First install cross-env:
           npm install cross-env

       Then open package.json in a text editor and find the line:
           "dev": "NODE_ENV=development tsx server/index.ts"
       
       Change it to:
           "dev": "cross-env NODE_ENV=development tsx server/index.ts"
       
       Save the file, then run:
           npm run dev

5. Open your browser and go to:

       http://localhost:5000


NOTES
-----
- No database setup is required. The app automatically uses a 
  built-in data file (server/data.json) that contains all 200 
  stotrams and 8 categories.

- If you do have PostgreSQL and want to use it instead, set the 
  DATABASE_URL environment variable before starting the app:

   On Mac/Linux:
       export DATABASE_URL="postgresql://user:password@localhost:5432/vedamnadam"

   On Windows (Command Prompt):
       set DATABASE_URL=postgresql://user:password@localhost:5432/vedamnadam

   On Windows (PowerShell):
       $env:DATABASE_URL="postgresql://user:password@localhost:5432/vedamnadam"

  The app will automatically detect the database and seed it with 
  all the data on first run.

- The website runs on port 5000 by default.

- To stop the server, press Ctrl+C in the terminal.
