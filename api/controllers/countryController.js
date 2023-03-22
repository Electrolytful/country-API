const Country = require('../models/Country.js');

async function index(req, res) {
    try {
        const countries = await Country.getAll();
        res.status(201).json(countries);
    } catch (err) {
        res.status(500).json({"error": err.message});
    }    
}

async function show(req, res) {
    try {
        const { name } = req.params;
        const country = await Country.getOneByName(name);
        res.status(200).json(country);
    } catch (err) {
        res.status(404).json({"error": err.message});
    }

}

async function create(req, res) {
    try {
        const data = req.body;
        const newCountry = await Country.create(data);
        res.status(201).json(newCountry); 
    } catch (err) {
        res.status(400).json({"error": err.message});
    }
}

async function destroy(req, res) {
    try {
        const { name } = req.params;
        const country = await Country.getOneByName(name);
        const deletedCountry = await country.destroy();
        res.status(200).json(deletedCountry);
    } catch (err) {
        res.status(404).json({"error": err.message});
    }
}

async function update(req, res) {
    try {
        const { name } = req.params;
        const country = await Country.getOneByName(name);
        const updatedCountry = await country.update(req.body);
        res.status(201).json(updatedCountry);
    } catch (err) {
        res.status(404).json({"error": err.message});
    }
}

module.exports = { index, show, create, destroy, update }
