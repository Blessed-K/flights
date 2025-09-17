
$(document).ready(function() {
   const countrymodal = $('#countrydetailsmodal'),
        addnewcountrybutton = $('#addnewcountry'),
        countryidfield = $('#countryid'),
        countrynamefield = $('#countryname'),
        savecountrybutton = $('#savecountry'),
        notifications = $('#notifications'),
        countriestable = $('#countriestable'),
        countrynotifications = $('#countrynotifications')
    // load existing countries
    getcountriesastable();
    // Show modal when add new country button is clicked
    addnewcountrybutton.on('click', function() {
        countrymodal.modal('show');
    })

    savecountrybutton.on('click',function(){
        const countryname= countrynamefield.val(),
            countryid= countryidfield.val()
        if (countryname == '') {
            notifications.html("<div class='alert alert-primary'>Please enter a country name.</div>")
            countrynamefield.focus()
        }else{
            $.post(
                "controllers/countryoperations.php",
                {
                    savecountry:true,
                    countryid:countryid,
                    countryname:countryname
                },
                function(data) {
                        if(data.status == "success") {
                            notifications.html("<div class='alert alert-success'>Country added successfully.</div>");
                            countrynamefield.val("");
                            countrynamefield.focus();
                            // Refresh countries list
                            getcountriesastable();
                        }else if(data.status == "exists") {
                            notifications.html("<div class='alert alert-info'>Country already exists.</div>");
                            countrynamefield.focus();
                        } else {
                        notifications.html("<div class='alert alert-danger'>Sorry an error occurred ${data}.</div>");
                    }
                },
                "json"
            )
        }
    })

    countrynamefield.on("input", function() {
        notifications.html("")
    })

    function isJSONObject(value) {
        return (
            typeof value === "object" &&
            value !== null &&
            !Array.isArray(value)
        );
    }

    function getcountriesastable() {
        $.getJSON(
            "http://localhost/flights/controllers/countryoperations.php",
            {
                getcountries:true
            }
        ).done(function(data){
            let results = ""
            data.forEach(function(country, i){
                results += `<tr><td>${i + 1}</td>`
                results += `<td>${country.countryname}</td>`
                results += `<td>${country.cities}</td>`
                results += `<td>${country.airports}</td>`
                results += `<td>${country.airlines}</td>`
                results += `<td><a href='#'><i class='fas fa-edit fa-lg'></i></a></td></tr>`
            })
            // Done with looping through the data that is returned
            countriestable.find("tbody").html(results)
        }).fail(function(response, status, error){
            // console.log(`Sorry an error occurred ${response.responseText}`)
            countrynotifications.html(`<div class='alert alert-danger'>${response.responseText}</div>`)
        })
    }
});
