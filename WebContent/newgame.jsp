<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="com.google.inject.Injector" %>
    <%@ page import="com.google.inject.Key" %>
    <%@ page import="com.google.inject.TypeLiteral" %>
    <%@ page import="javax.servlet.http.HttpSession" %>
    <%@ page import="net.socialgamer.cah.CahModule.AllowBlankCards" %>
    <%@ page import="net.socialgamer.cah.RequestWrapper" %>
    <%@ page import="net.socialgamer.cah.StartupUtils" %>
    <%@ page import="net.socialgamer.cah.data.GameOptions" %>
    <%
    // Ensure a session exists for the user.
    @SuppressWarnings("unused")
    HttpSession hSession = request.getSession(true);
    RequestWrapper wrapper = new RequestWrapper(request);
    ServletContext servletContext = pageContext.getServletContext();
    Injector injector = (Injector) servletContext.getAttribute(StartupUtils.INJECTOR);
    boolean allowBlankCards = injector.getInstance(Key.get(new TypeLiteral<Boolean>(){}, AllowBlankCards.class));
    %>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="js/jquery-migrate-1.2.1.js"></script>
    <script type="text/javascript" src="js/jquery.cookie.js"></script>
    <script type="text/javascript" src="js/jquery.json.js"></script>
    <script type="text/javascript" src="js/QTransform.js"></script>
    <script type="text/javascript" src="js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="js/cah.js"></script>
    <script type="text/javascript" src="js/cah.config.js"></script>
    <script type="text/javascript" src="js/cah.constants.js"></script>
    <script type="text/javascript" src="js/cah.log.js"></script>
    <script type="text/javascript" src="js/cah.gamelist.js"></script>
    <script type="text/javascript" src="js/cah.card.js"></script>
    <script type="text/javascript" src="js/cah.cardset.js"></script>
    <script type="text/javascript" src="js/cah.game.js"></script>
    <script type="text/javascript" src="js/cah.preferences.js"></script>
    <script type="text/javascript" src="js/cah.longpoll.js"></script>
    <script type="text/javascript" src="js/cah.longpoll.handlers.js"></script>
    <script type="text/javascript" src="js/cah.ajax.js"></script>
    <script type="text/javascript" src="js/cah.ajax.builder.js"></script>
    <script type="text/javascript" src="js/cah.ajax.handlers.js"></script>
    <script type="text/javascript" src="js/cah.app.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="cah.css" media="nope!" onload="this.media='all'"/>
    <link rel="stylesheet" type="text/css" href="styles.css" media="nope!" onload="this.media='all'"/>
    
    <link rel="stylesheet" href="materialize.css" media="nope!" onload="this.media='all'">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/js/materialize.min.js"></script>
            
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Pretend You're Xyzzy</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous" media="nope!" onload="this.media='all'"/>
</head>

    <script>
        function waitCheck() { setTimeout(checkDiscord(), 500) }
        function checkDiscord() {
            if (isLoggedIn == true) { return;}
            var url = window.location.href+"#";
            var access_token = url.match(/\?(?:code)\=([\S\s]*?)#/)[1];
            if (access_token) {
                $.trim($("#nickname").val("DC_" + access_token.substr(20)));
                nicknameconfirm_click();
            }
        }
    </script>
<body onload = "M.AutoInit();waitCheck();">
    <div class="container" id="welcome">
        <h1 class="newsbanner wachu-green" tabindex="0">Cards Against Humanity</h1>

        <div class="container" id="nickbox">
            <label style="display: block" class="nicklabel" for="nickname">Enter a nickname below</label>

            <input type="text" class="nickinput" id="nickname" style="margin: auto; display: block" value="" maxlength="30" role="textbox" />

            <input type="button" class="navbarbutton navbarbutton-cur" style="text-align: center; display: block; margin: auto; font-size: large" id="nicknameconfirm" value="Play" />
            <p id="nickbox_error" class="error" style="color: #ff0000"></p>

            <a class="navbarbutton navbarbutton-cur" style="text-align: center; display: block; margin: auto; font-size: large" href="https://discordapp.com/api/oauth2/authorize?client_id=478421422021148672&redirect_uri=http%3A%2F%2Fciaramitaro.asuscomm.com%3A8080%2FZY%2Fnewgame.jsp&response_type=code&scope=identify%20email">OR log in with Discord to track statistics!</a>
            <p style="text-align:center">*Statistic tracking is not yet implemented :(</p>
        </div>

    </div>

    <div id="canvas">
        <!-- Top Menu Bar -->
        <div id="menubar" class="navbar-light navbar-expand-lg">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCol" aria-controls="navbarCol" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCol">
                <div class="navbar-nav navbar">
                    <input type="button" id="refresh_games" class="hide navbarbutton" value="Refresh Games" />
                    <input type="button" id="create_game" class="hide navbarbutton" value="Create Game" />
                    <input type="text" id="filter_games" class="hide navbarbutton" placeholder="Filter games by keyword" data-lpignore="true" />

                    <input type="button" id="leave_game" class="hide navbarbutton" value="Leave Game" />
                    <input type="button" id="start_game" class="hide navbarbutton" value="Start Game" />

                    <input type="button" id="stop_game" class="hide navbarbutton" value="Stop Game" />
                    <input class="navbarbutton" type="button" id="view_cards" value="View Cards"
                        title="Open a new window to view all cards in the game."
                        onclick="window.open('viewcards.jsp', 'viewcards');" />
                    <input class="navbarbutton" type="button" id="logout" value="Log out" />
                </div>
            </div>
        </div>

        <div id="main">
            <!-- Game List -->
            <div id="game_list" class="hide">
            </div>

            <div id="main_holder">
            </div>

            <div id="bottom" class="container bottomblur">
    
                <div id="tab-global">
                    <div class="log"></div>
                    <div class="row">
                        <input type="text" class="chat col-md-10" maxlength="200" aria-label="Type here to chat."
                            data-lpignore="true" />
                        <input type="button" class="chat_submit col-md-2" value="Chat" />
                    </div>
                </div>
            </div>


        </div>
    </div>

    <div class="hide">
        <div id="game_template" class="game">
            <div class="" style="margin: auto" id="game_top">
                <input type="button" class="game_show_last_round game_menu_bar navbarbutton" value="Show Last Round" disabled="disabled" />
                <input type="button" class="game_show_options game_menu_bar navbarbutton" value="Hide Game Options" />
            </div>
            <div class="game_options">
            </div>
            <div class="status game_message" role="status">
                <h1>Waiting for server...</h1>
            </div>

            <div class="row" style="margin: auto">
                <div class="game_left_side col-md-2">
                    <p style="text-align: center">The black card for this round is</p>
                    <div style="text-align: center; margin: auto" class="game_black_card">
                    </div>


                </div>

                <div style="margin: auto" class="game_right_side col-md-8">
                    <p style="text-align: center">The white cards played this round are</p>
                    <div style="margin: auto" class="game_white_cards row game_right_side_cards">
                    </div>
                </div>

            </div>
            <div class="row" style="margin: auto">
                <input type="button" class="confirm_card col-md-2" value="Confirm Selection" />
            </div>

            <div>
                <h1 style="text-align: center">Your Hand</h1>
            </div>
            <div style="margin: auto" class="row your_hand game_hand_cards">
            </div>

        </div>

        <p>This shouldn't be seen. This is for templates for things :D</p>
        <div id="white_up_template" class="card">
            <span class="card_text" role="button" tabindex="0">The quick brown fox jumped over the lazy dog.</span>
        </div>
        <!-- Template for face-up black cards. -->
        <div id="black_up_template" class="card blackcard col-md-1">
            <span class="card_text">The quick brown fox jumped over the lazy dog.</span>
            <div class="card_metadata">
                <div class="draw hide">
                    DRAW
                        <div class="card_number">1</div>
                </div>
                <div class="pick hide">
                    PICK
                        <div class="card_number">1</div>
                </div>
            </div>
        </div>

        <div id="game_white_cards_binder_template" class="game_white_cards_binder hide">
        </div>

        <div id="black_down_template" class="card blackcard col-md-1">
        </div>


        <div id="white_down_template" class="card whitecard">
        </div>

        <div id="scoreboard_template" class="scoreboard col-md-2">
            <p style="text-align: center">Scoreboard</p>
        </div>

        <div id="scorecard_template" class="scorecard" tabindex="0">
            <span class="scorecard_player">PlayerName</span>
            <span class="scorecard_points"><span class="scorecard_score">0</span> <span class="scorecard_point_title">Point<span class="scorecard_s">s</span></span></span>
            <span class="scorecard_status">Status</span>
        </div>

        <div class="game_options container upcoming-events" id="game_options_template">
            <h1>Options</h1>
            <fieldset>
                <h3>Game Options</h3>
                <div class="row">
                    <div class="col-md-2">
                        <span>Score Limit</span>
                        <select id="score_limit_template" class="score_limit col-md-5">
                             JSP STUFF: UNCOMMENT
                        <%
                            for (int i = GameOptions.MIN_SCORE_LIMIT; i <= GameOptions.MAX_SCORE_LIMIT; i++) {
                        %>
                            <option <%= i == GameOptions.DEFAULT_SCORE_LIMIT ? "selected='selected' " : "" %>value="<%= i %>"><%= i %></option>
                        <% } %>
                        
                        </select>
                    </div>
                    <div class="col-md-2">
                        <span>Player limit</span>
                        <select id="player_limit_template" class="player_limit col-md-5"
                            aria-label="Player limit. Having more than 10 players may cause issues both for screen readers and traditional browsers.">
                                    
                            <%
                              for (int i = GameOptions.MIN_PLAYER_LIMIT; i <= GameOptions.MAX_PLAYER_LIMIT; i++) {
                            %>
                              <option <%= i == GameOptions.DEFAULT_PLAYER_LIMIT ? "selected='selected' " : "" %>value="<%= i %>"><%= i %></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <span>Idle Timer</span>
                        <select id="timer_multiplier_template" class="timer_multiplier col-md-5"
                            title="Players will be skipped if they have not played within a reasonable amount of time. This is the multiplier to apply to the default timeouts, or Unlimited to disable timeouts."
                            aria-label="Players will be skipped if they have not played within a reasonable amount of time. This is the multiplier to apply to the default timeouts, or Unlimited to disable timeouts.">
                            <option value="0.25x">0.25x</option>
                            <option value="0.5x">0.5x</option>
                            <option value="0.75x">0.75x</option>
                            <option selected="selected" value="1x">1x</option>
                            <option value="1.25x">1.25x</option>
                            <option value="1.5x">1.5x</option>
                            <option value="1.75x">1.75x</option>
                            <option value="2x">2x</option>
                            <option value="2.5x">2.5x</option>
                            <option value="3x">3x</option>
                            <option value="4x">4x</option>
                            <option value="5x">5x</option>
                            <option value="10x">10x</option>
                            <option value="Unlimited">Unlimited</option>
                        </select>
                    </div>

                </div>
                <h3>Card Sets</h3>
                <div class="row">
                    <fieldset class="card_sets">
                        <span class="base_card_sets"></span>
                        <span class="extra_card_sets"></span>
                    </fieldset>
                </div>

                <span># Blank White Cards</span>
                <select id="blanks_limit_template" class="blanks_limit">
                    <%
                    for (int i = GameOptions.MIN_BLANK_CARD_LIMIT; i <= GameOptions.MAX_BLANK_CARD_LIMIT; i++) {
                    %>
                    <option <%= i == GameOptions.DEFAULT_BLANK_CARD_LIMIT ? "selected='selected' " : "" %>value="<%= i %>"><%= i %></option>
                    <% } %>
                </select>

            </fieldset>
        </div>

        <div id="gamelist_lobby_template" class="gamelist_lobby" tabindex="0">
            <div class="gamelist_lobby_left">
                <h3>
                    <span class="gamelist_lobby_host">host</span>'s Game
			(<span class="gamelist_lobby_player_count"></span>/<span class="gamelist_lobby_max_players"></span>,
			<span class="gamelist_lobby_spectator_count"></span>/<span class="gamelist_lobby_max_spectators"></span>)
			<span class="gamelist_lobby_status">status</span>
                </h3>
                <div>
                    <strong>Players:</strong>
                    <span class="gamelist_lobby_players">host, player1, player2</span>
                </div>
                <div>
                    <strong>Spectators:</strong>
                    <span class="gamelist_lobby_spectators">spectator1</span>
                </div>
                <div><strong>Goal:</strong> <span class="gamelist_lobby_goal"></span></div>
                <div>
                    <strong>Cards:</strong> <span class="gamelist_lobby_cardset"></span>
                </div>
                <div class="hide">Game <span class="gamelist_lobby_id">###</span></div>
            </div>
            <div class="">
                <input type="button" class="gamelist_lobby_join navbarbutton navbarbutton-cur" value="Join" />
                <input type="button" class="gamelist_lobby_spectate navbarbutton" value="Spectate" />
            </div>
        </div>
    </div>
</body>

</html>
