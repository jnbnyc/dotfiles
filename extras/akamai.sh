# functions for akamai

function akamai_iscached {
    curl -I -H 'Pragma: akamai-x-cache-on,
        akamai-x-cache-remote-on,
        akamai-x-check-cacheable,
        akamai-x-get-cache-key' \
        $1
}
