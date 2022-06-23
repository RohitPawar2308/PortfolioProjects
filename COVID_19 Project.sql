USE covid_19;
SELECT * 
FROM coviddeaths
WHERE continent is not null
ORDER BY 2,3;

SELECT * 
FROM covidvaccinations
ORDER BY 2,3;

SELECT Location,date,population,total_cases,new_cases,total_deaths
FROM coviddeaths
ORDER BY 1,2;

-- Looking at Total Cases vs Total Deaths

SELECT Location,date,population,total_cases,total_deaths,(total_deaths/total_cases)*100 AS DeathPercentage
FROM coviddeaths
WHERE Location LIKE 'India'
ORDER BY 1,2;

-- Looking at Total Cases vs Population
-- Shows what percentage of population got Covid

SELECT Location,date,population,total_cases,(total_cases/population)*100 AS InfectionPercentage
FROM coviddeaths
WHERE Location LIKE 'India'
ORDER BY 1,2;

-- Looking at Countries with Highest Infection rate

SELECT Location,population, MAX(total_cases) AS Highest_Infection_Rate , MAX((total_cases/population))*100 AS PercentPopulatinInfected
FROM coviddeaths
-- WHERE Location LIKE 'India'
GROUP BY Location,population
ORDER BY 1,2;

-- Global Nummbers

SELECT date,SUM(total_cases) AS total_cases
FROM coviddeaths
-- WHERE Location LIKE 'India'
WHERE continent is not null
GROUP  BY date
ORDER BY 1,2;

SELECT SUM(total_cases) AS total_cases,SUM(total_deaths) AS total_deaths,SUM(total_cases)/SUM(total_deaths)*100 AS DeathPercentage
FROM coviddeaths
-- WHERE Location LIKE 'India'
WHERE continent is not null
-- GROUP  BY date
ORDER BY 1,2;


SELECT * FROM covidvaccinations;

-- Looking at Total Population vs Vaccinations

SELECT dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations
FROM coviddeaths dea
JOIN covidvaccinations vac
ON dea.location=vac.location
AND dea.date = vac.date
WHERE dea.continent is not null
ORDer BY 1,2,3;






