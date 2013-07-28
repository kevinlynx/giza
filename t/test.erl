-module(test).
-compile(export_all).

query(Str) ->
    Q = giza_query:new("xml", Str),
    Q2 = giza_query:port(Q, 9312),
    giza_request:send(Q2).

query_file(File) ->
    % utf-8
    {ok, B} = file:read_file(File),
    query(binary_to_list(B)).

