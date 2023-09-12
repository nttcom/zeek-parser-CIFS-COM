spicy_add_analyzer(
    NAME HTTP
    PACKAGE_NAME test
    SOURCES http.spicy http.evt zeek_http.spicy
    SCRIPTS __load__.zeek main.zeek dpd.sig
)
