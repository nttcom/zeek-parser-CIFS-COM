spicy_add_analyzer(
    NAME CIFS_B
    PACKAGE_NAME test
    SOURCES CIFS_B.spicy CIFS_B.evt zeek_CIFS_B.spicy
    SCRIPTS __load__.zeek main.zeek dpd.sig
)
