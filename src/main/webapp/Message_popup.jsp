<%-- 
    Document   : Message_popup
    Created on : Aug 15, 2022, 8:05:14 PM
    Author     : SANT JI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        
        <style>
            
            
            #tostmsg{
                min-width: 300px;
                background-color:black;
                position: fixed;
                bottom: 30px;
                left: 50%;
                margin-left: -120px;
                padding: 10px;
                color: white;
                text-align: center;
                z-index: 1;
                font-size: 18px;
                visibility: hidden;
                 
            }
            @keyframes fadeIn{
                from{
                    bottom:0px;
                    opacity:0;
                }
                to{
                    bottom:30px;
                    opacity: 1;
                    
                }
            }
            @keyframes fadeOut{
                from{
                    bottom:30px;
                    opacity:1;
                }
                to{
                    bottom:0px;
                    opacity: 0;
                    
                }
            }
            #tostmsg.actions{
                visibility:visible;
                animation: fadeIn 0.5s , fadeOut 0.5s 2.5s;
            }
           
        </style>
    </head>
    <body>
        <div id="tostmsg">Registration Successfully </div>
        <button onclick="showtost('hello Your Registration success')">click here </button>
        <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
        <script>
            function showtost(contents){
                $("#tostmsg").addClass("actions");
                $("#tostmsg").html(contents);
            setTimeout( () => {
                $("#tostmsg").removeClass("actions");
            },1000)
            }
            
        </script>
    
    
    </body>
</html>
