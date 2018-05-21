var keys = Object.keys(regCountries);
//        getCountries("Southern Asia")
//        {AF: "Afghanistan", BD: "Bangladesh", BT: "Bhutan", IN: "India", IR: "Iran", …}
function getCountries($region)
{
    countriesObj1 = regCountries[$region]["countries"];
    var countries={};
    for (var key in countriesObj1) {
        countries[countriesObj1[key]["ISO"]["2"]] = countriesObj1[key]['name'];
    }
    return { 'code' : regCountries[$region]["code"], 'countries' : countries };
}
var countryList = allCountries();
function allCountries()
{
    var list={};
    Object.keys(regCountries).forEach(function(k){
        countriesObj1 = regCountries[k]["countries"];
        var countries={};
        for (var key in countriesObj1) {
            countries[countriesObj1[key]["ISO"]["2"]] = countriesObj1[key]['name'];
        }
        list[k] = { 'code' : regCountries[k]["code"], 'countries' : countries };
    });
    return list;
}