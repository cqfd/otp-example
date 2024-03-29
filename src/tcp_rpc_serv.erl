-module(tcp_rpc_serv).

-behavior(gen_server).

-export([start_link/0, say_hello/0]).

-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
         terminate/2, code_change/3]).

%% ===================================================================
%% API functions
%% ===================================================================

start_link() ->
    io:format("starting the server...~n", []),
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

say_hello() ->
    gen_server:call(?MODULE, hello).

%% ===================================================================
%% Gen_server callbacks
%% ===================================================================

init([]) ->
    {ok, []}.

handle_call(hello, _From, State) ->
    io:format("hello from the server!~n", []),
    {reply, ok, State};
handle_call(_Request, _From, State) ->
    {reply, ok, State}.

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.
