const db = require('../db/connect.js');

class Country {
    constructor(country) {
        this.country_id = country.country_id;
        this.name = country.name;
        this.capital = country.capital;
        this.population = country.population;
        this.languages = country.languages;
        this.fun_fact = country.fun_fact;
        this.map_image_url = country.map_image_url;
    }

    static async getAll() {
        const countries = await db.query("SELECT * FROM country;");

        if(countries.rows.length === 0) {
            throw new Error("No countries available");
        } 

        return countries.rows.map(c => new Country(c));
    }

    static async getOneByName(countryName) {
        const country = await db.query("SELECT * FROM country WHERE LOWER(name) = $1;", [countryName.toLowerCase()]);
        
        if(country.rows.length != 1) {
            throw new Error("Could not find specified country!");
        } else {
            return new Country(country.rows[0]);
        }
    }

    static async create(data) {
        const { name, capital, population, languages } = data;
        let response = await db.query("INSERT INTO country (name, capital, population, languages) VALUES ($1, $2, $3, $4) RETURNING name;", [name, capital, population, languages]);
        
        if(response.rowCount != 1) {
            throw new Error("Could not insert new country into database");
        } 

        const newName = response.rows[0].name;
        const newCountry = await Country.getOneByName(newName);
        return newCountry;
    }

    async destroy() {
        let response = await db.query("DELETE FROM country WHERE name = $1 RETURNING *;", [this.name]);
        return new Country(response.rows[0]);
    }

    async update(country) {
        const {name, capital, population, languages } = country;
        let updatedCountry = await db.query("UPDATE country SET name = $1, capital = $2, population = $3, languages = $4 WHERE name = $5 RETURNING *;", [name, capital, population, languages, this.name]);
        return new Country(updatedCountry.rows[0]);
    }
}

module.exports = Country;
