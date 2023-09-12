spicy_add_analyzer(
    NAME CIFS_B
    PACKAGE_NAME test
    SOURCES cifs_b.spicy cifs_b.evt zeek_cifs_b.spicy
    SCRIPTS __load__.zeek main.zeek dpd.sig
)
