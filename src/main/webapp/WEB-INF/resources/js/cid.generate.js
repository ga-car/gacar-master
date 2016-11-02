(function(top, window) {
	
    function findTop(t, s)
    {
        try {
            if (t.document) {
                return t;
            }
        } catch (e) {
            try {
                if (s.parent.document) {
                    var p = s;
                    while (p) {
                        try {
                            if (p.document) {
                                s = p;
                                p = p.parent;
                            }
                        } catch (e) {
                            return s;
                        }
                    }
                }
            } catch (e) {
                return s;
            }
        }
    }
    top = findTop(top, window);
    
    var eclogPID = 'eclog';
    if (typeof top[eclogPID] != 'undefined') {
        window[eclogPID] = top[eclogPID];
        return;
    }

    var cook = {
        get : function() {
            var cookieStr = document.cookie;
            if (cookieStr == '') return false;

            var cookies = cookieStr.split('; ');
            var findCookie = false;
            for (var i = 0; i < cookies.length; i++) {
                if (cookies[i].substring(0, 4) != 'CID=') {
                    continue;
                }
                findCookie = cookies[i].substring(4);
            }
            return findCookie;
        }
    };

    var cid = {
        key : null,
        generate : function() {
            this.key = cook.get();
            if (this.key === false) {
                this.key = CID;
            }
        },
        getCid : function() {
            return this.key;
        }
    };

    cid.generate();

    top[eclogPID] = cid;
    window[eclogPID] = cid;
    
})(top, window);