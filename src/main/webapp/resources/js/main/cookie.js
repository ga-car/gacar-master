function setCookie( name, value, expiredays ) 
{
        var todayDate = new Date(); 
        todayDate.setDate( todayDate.getDate() + expiredays ); 

		if ( expiredays == 0 ){
			document.cookie = name + "=" + escape( value ) + "; path=/;"
		}
		else{
			document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";" 
		}
}

function getCookie( name ) 
{ 
        var nameOfCookie = name + "="; 
        var x = 0; 
        while ( x <= document.cookie.length ) 
        { 
                var y = (x+nameOfCookie.length); 
                if ( document.cookie.substring( x, y ) == nameOfCookie ) { 
                        if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 ) 
                                endOfCookie = document.cookie.length; 
                        return unescape( document.cookie.substring( y, endOfCookie ) ); 
                } 
                x = document.cookie.indexOf( " ", x ) + 1; 
                if ( x == 0 ) 
                        break; 
        }
        return "";
}