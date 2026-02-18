//jQuery - JS library
$(document).ready(function(){
       const userprivilegestable=$("#userprivilegestable");

       //get existing objects
       getobjectsastable() 

       function getobjectsastable(){
                $.getJSON(
                    "controllers/useroperations.php",
                    {
                        getobjects:true
                    }
                ).done(function(data){
                    let results=""
                    data.forEach(function(privilege){
                        results+=`
                        <tr>
                            <td><input type='checkbox' id='${privilege.objectid}'>  ${privilege.objectname}</td>
                        </tr>
                        `
                    })
                    userprivilegestable.html(results)
                }).fail(function(response,status,errors){
            })
       }
}) 