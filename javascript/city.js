$(document).ready(function(){
    const addnewbutton = $("#addnewcity"),
        citydetailsmodal = $("#citydetailsmodal"),
        filtercountrylist = $("#filtercountry"),
        citycountrylist = $("#citydetailscountry"),
        filtercitynotifications = $("#filtercitynotifications"),
        citynamefield = $("#citydetailscityname"),
        savecitybutton = $("#savecity"),
        citydetailnotifications = $("#citydetailsnotifications"),
        cityidfield = $("#cityid"),

        // global variables
        inputfield = $("input"),
        selectfield = $("select");
        loadcity();

    // load countries from the database
    getcountries(filtercountrylist, 'all');
    getcountries(citycountrylist);

    // clear notifications when typing or changing fields
    inputfield.on("input", function(){
        citydetailnotifications.html("");
    });

    selectfield.on("change", function(){
        inputfield.trigger("input");
    });

    // show modal when add new city button is clicked
    addnewbutton.on("click", function(){
        citydetailsmodal.modal("show");
    });

    // get list of countries
    function getcountries(obj, option = 'choose'){
        $.getJSON(
            "controllers/countryoperations.php",
            { getcountries: true }
        ).done(function(data){
            let results = option === 'choose'
                ? `<option value=''>&lt;Choose&gt;</option>`
                : `<option value='0'>&lt;All&gt;</option>`;
            
            data.forEach(function(country){
                results += `<option value='${country.countryid}'>${country.countryname}</option>`;
            });
            obj.html(results);
        }).fail(function(response){
            filtercitynotifications.html(
                `<div class='alert alert-danger'>${response.responseText}</div>`
            );
        });
    }


    // load cities
    function loadcity() {
    $.getJSON("controllers/cityoperations.php", { getcity: true })
        .done(function(data) {
            let rows = "";
            data.forEach(function(city, idx) {
                rows += `<tr>
                    <td>${idx + 1}</td>
                    <td>${city.countryname}</td>
                    <td>${city.cityname}</td>
                    <td>
                        <!-- Edit/Delete buttons here if needed -->
                    </td>
                </tr>`;
            });
            $("#citytable tbody").html(rows);
        })
        .fail(function(response) {
            filtercitynotifications.html(
                `<div class='alert alert-danger'>${response.responseText}</div>`
            );
        });
}
    // save city
    savecitybutton.on("click", function(){
        const cityid = cityidfield.val(),
            countryid = citycountrylist.val(),
            cityname = citynamefield.val();

        // check for blank fields
        if(countryid === ""){
            citydetailnotifications.html(
                `<div class='alert alert-info'>Please select a country first</div>`
            );
            citycountrylist.focus();
        }else if(cityname === ""){
            citydetailnotifications.html(
                `<div class='alert alert-info'>Please provide a city name first</div>`
            );
            citynamefield.focus();
        }else{
            $.post(
                "controllers/cityoperations.php",
                {
                    savecity: true,
                    cityid: cityid,
                    cityname: cityname,
                    countryid: countryid
                },
                function(data){
                    if(isJSON(data)){
                        data = JSON.parse(data);
                        if(data.status === "success"){
                            citydetailnotifications.html(
                                `<div class='alert alert-success'>The city was saved successfully</div>`
                            );
                            citynamefield.val("").focus();
                        }else if(data.status === "exists"){
                            citydetailnotifications.html(
                                `<div class='alert alert-info'>The city name already exists</div>`
                            );
                            citynamefield.focus();
                        }
                    }else{
                        citydetailnotifications.html(
                            `<div class='alert alert-danger'>Sorry an error occurred: ${data}</div>`
                        );
                    }
                }
            );
        }
    });

    // helper function to check if response is JSON
    function isJSON(str) {
        try {
            JSON.parse(str);
            return true;
        } catch (e) {
            return false;
        }
    }
});
