//jQuery - JS library
$(document).ready(function(){
       const userprivilegestable=$("#userprivilegestable");

       function getobjectsastable(){
                $.getJSON(
                    "../controllers/useroperations.php",
                    {
                        getobjects:True
                    }
                ).done(function(data){
                    let results=""
                    data.forEach(function(privilege){
                        results+=`
                        <tr>
                            <td><input type='checkbox' id='$[privilege.objectid]'> $[privilege.objectname]</td>
                        </tr>
                        `
                    })
                }).fail(function(response,status,errors){
            })
       }
}) 