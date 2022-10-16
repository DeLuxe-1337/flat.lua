local http = {}

function http.get(url)
    local xmlhttp = js.new(js.global.window.XMLHttpRequest)
    xmlhttp:open("GET", url, false)
    xmlhttp:send(nil)

    return xmlhttp.responseText
end

return http
