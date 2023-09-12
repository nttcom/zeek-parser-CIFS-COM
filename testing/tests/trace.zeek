# @TEST-DOC: Test Zeek parsing a trace file through the HTTP analyzer.
#
# @TEST-EXEC: zeek -Cr ${TRACES}/tcp-port-12345.pcap ${PACKAGE} %INPUT >output
# @TEST-EXEC: btest-diff output
# @TEST-EXEC: btest-diff http.log

# TODO: Adapt as suitable. The example only checks the output of the event
# handlers.

event HTTP::request(c: connection, is_orig: bool, payload: string)
    {
    print fmt("Testing HTTP: [request] %s %s", c$id, payload);
    }

event HTTP::reply(c: connection, is_orig: bool, payload: string)
    {
    print fmt("Testing HTTP: [reply] %s %s", c$id, payload);
    }
