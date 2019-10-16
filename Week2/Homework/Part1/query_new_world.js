/* Write a node-JS program to get answers of following queries on the new_world database: Note that you are expected to get the input from user and use prepared statements to write the queries.
Hint: use [this] (https://github.com/sidorares/node-mysql2) link to read more about prepared statements. */

const mysql = require('mysql2');

//create connection to database
const db = mysql.createConnection({
  host: 'localhost',
  user: 'hyf',
  password: 'password',
  database: 'new_world',
});

// Connect
db.connect();

const query = 'SELECT Name, Population FROM country WHERE Name = ?';

// What is the capital of country X ? (Accept X from user)
const query1 =
  'SELECT country.Name, city.Name FROM country INNER JOIN city ON country.Capital = city.ID WHERE country.Name LIKE ?';

// List all the languages spoken in the region Y (Accept Y from user)
const query2 =
  'SELECT DISTINCT countrylanguage.Language FROM countrylanguage INNER JOIN country ON countrylanguage.countryCode = country.Code WHERE region ?';

//Find the number of cities in which language Z is spoken (Accept Z from user)
const query3 =
  'SELECT COUNT(*) AS "Number" FROM city WHERE CountryCode in (SELECT CountryCode FROM countryLanguage WHERE language = ?)';

//Accept country from user. Are there any countries in the same region as this country with the same official language as given country. If yes, display those countries, if not display FALSE.
const query4 = '';
//  'SELECT Name, language FROM country AS c, countrylanguage AS cl WHERE region IN (SELECT region FROM country WHERE Name= "Mexico" ) AND c.code = cl.countrycode AND isofficial="T" AND cl.language IN (SELECT language FROM country AS c, countrylanguage AS cl WHERE c.Name= "Mexico" AND c.code = cl.countrycode AND isofficial="T"';

// List all the continents with the number of languages spoken in each continent
const query5 =
  'SELECT country.Continent, COUNT(DISTINCT countryLanguage.Language) AS "NumberOfLanguages" FROM country INNER JOIN countryLanguage ON country.Code = countryLanguage.CountryCode GROUP BY Continent ORDER BY COUNT(countrylanguage.Language) DESC';

const delay = t => new Promise(resolve => setTimeout(resolve, t));

const rl = require('readline').createInterface({
  input: process.stdin,
  output: process.stdout,
});

// What is the capital of country X ? (Accept X from user)
const question1 = () => {
  return new Promise((resolve, reject) => {
    rl.question('Give me the name of a country and I will give you its capital: ', name => {
      console.log('Country you chose is: ', name);
      connection.execute(query1, [name], (error, results) => {
        console.log('Going to run ', query1, name);
        if (error) {
          throw error;
        }
        const answer = results[0].Name;
        console.log(`The capital of ${name} is ${answer}`);
      });
      connection.unprepare(query1);
      resolve();
    });
  });
};

// List all the languages spoken in the region Y (Accept Y from user)
const question2 = () => {
  return new Promise((resolve, reject) => {
    delay(1000).then(() =>
      rl.question('Select a region and I will give you the languages spoken there: ', name => {
        console.log('Region you chose is: ', name);
        connection.execute(query2, [name], (error, results) => {
          console.log('Going to run ', query2, name);
          if (error) {
            throw error;
          }
          console.log(`The languages spoken in ${name} are: `);
          for (i in results) {
            console.log(results[i].Language);
          }
        });
        connection.unprepare(query2);
        resolve();
      }),
    );
  });
};

// Find the number of cities in which language Z is spoken (Accept Z from user)
const question3 = () => {
  return new Promise((resolve, reject) => {
    delay(1000).then(() =>
      rl.question('Select a language and I will tell you how many cities speak it: ', name => {
        console.log('Language you chose is: ', name);
        connection.execute(query3, [name], (error, results) => {
          console.log('Going to run ', query3, name);
          if (error) {
            throw error;
          }
          const answer = results[0].Number;
          console.log(`The language ${name} is spoken in this many cities: ${answer}`);
        });
        connection.unprepare(query3);
        resolve();
      }),
    );
  });
};

/* // Accept country from user. Are there any countries in the same region as this country with the same official language as given country. If yes, display those countries, if not display FALSE.
const question4 = () => {
  return new Promise((resolve, reject) => {
    delay(1000).then(() =>
      rl.question(
        'Select a country and I will tell you what other countries are found in the same region with the same language: ',
        name => {
          console.log('Country you chose is: ', name);
          connection.execute(query4, [name], (error, results) => {
            console.log('Going to run ', query4, name);
            if (error) {
              throw error;
            }
            const answer = results[0].Number;
            console.log(
              `The country ${name} has the same language and is in the same region as: `
            );
            for (i in results) {
            console.log(results[i].Name, results[i].Language);
          }
          });
          connection.unprepare(query4);
          resolve();
        }
      )
    );
  });
}; */

// State country in query. Are there any countries in the same region as this country with the same official language as given country. If yes, display those countries, if not display FALSE.
const question4 = () => {
  return new Promise((resolve, reject) => {
    delay(1000).then(() =>
      connection.query(query4, function(error, results, fields) {
        console.log('Going to run ', query4);
        if (error) {
          throw error;
        }
        console.log(
          'Countries that speak same language as Mexico and are found in the same region: ',
        );
        for (i in results) {
          console.log(results[i].Name, results[i].Language);
        }
        resolve();
      }),
    );
  });
};

// List all the continents with the number of languages spoken in each continent
const question5 = () => {
  return new Promise((resolve, reject) => {
    delay(1000).then(() =>
      connection.query(query5, function(error, results, fields) {
        console.log('Going to run ', query5);
        if (error) {
          throw error;
        }
        console.log('Continents with the number of languages spoken in each continent: ');
        for (i in results) {
          console.log(results[i].Continent, results[i].NumberOfLanguages);
        }
        resolve();
      }),
    );
  });
};

const main = async () => {
  await question1();
  await question2();
  await question3();
  //await question4();
  await question5();
  rl.close();
  connection.end();
};

main();
