@echo off

REM ############################################
REM ## You can change here your own DB params ##
REM ############################################
REM MYSQL BIN PATH
set mysqlBinPath=C:\Program Files\MySQL\MySQL Server 5.5\bin

REM LOGINSERVER
set lsuser=
set lspass=
set lsdb=l2jtesla
set lshost=localhost

REM GAMESERVER
set gsuser=
set gspass=
set gsdb=l2jtesla
set gshost=localhost
REM ############################################

set mysqldumpPath="%mysqlBinPath%\mysqldump"
set mysqlPath="%mysqlBinPath%\mysql"

echo.
echo.                        L2jTesla database installation
echo.                        __________________________
echo.
echo OPTIONS : (f) full install, it will destroy all (need validation).
echo           (s) skip characters data, it will install only static server tables.
echo.
:asklogin
set loginprompt=x
set /p loginprompt=Installation type: (f) full, (s) skip or (q) quit? 
if /i %loginprompt%==f goto fullinstall
if /i %loginprompt%==s goto lskip
if /i %loginprompt%==q goto end
goto asklogin

REM ############################################
:fullinstall

:validation
set jaja=x
set /p jaja=Are you sure to delete all databases, even characters (y/n) ? 
if /i %jaja%==y goto destruction
if /i %jaja%==n goto lskip
goto validation

:destruction
echo.
echo.
echo Deleting characters-related tables.
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < full_install.sql
echo Done.
echo.
echo Installing empty character-related tables.
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/accounts.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/auction_bid.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/augmentations.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/autobots.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/bookmarks.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/buffer_schemes.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/buylists.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/castle.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/castle_doorupgrade.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/castle_manor_procure.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/castle_manor_production.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/castle_trapupgrade.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/character_friends.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/character_hennas.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/character_macroses.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/character_mail.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/character_memo.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/character_quests.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/character_raid_points.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/character_recipebook.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/character_recommends.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/character_shortcuts.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/character_skills.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/character_skills_save.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/character_subclasses.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/characters.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/characters_autofarm.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/clan_data.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/clan_privs.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/clan_skills.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/clan_subpledges.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/clan_wars.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/clanhall.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/clanhall_functions.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/cursed_weapons.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/fishing_championship.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/forums.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/games.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/gameservers.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/grandboss_data.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/grandboss_list.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/heroes.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/heroes_diary.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/items.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/items_on_ground.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/mdt_bets.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/mdt_history.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/mods_wedding.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/olympiad_data.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/olympiad_fights.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/olympiad_nobles.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/olympiad_nobles_eom.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/pets.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/posts.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/raidboss_spawnlist.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/random_spawn.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/random_spawn_loc.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/server_memo.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/seven_signs.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/seven_signs_festival.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/seven_signs_status.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/siege_clans.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/spawnlist.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/spawnlist_4s.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/topic.sql

echo Done.
echo.

REM ############################################
:lskip
echo Deleting server tables.
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < gs_install.sql
echo Done.
echo.
echo Installing server tables.
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/castle.sql
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/grandboss_data.sql
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/raidboss_spawnlist.sql
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/random_spawn.sql
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/random_spawn_loc.sql
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/spawnlist_4s.sql
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/spawnlist.sql
REM ############################################
:end
echo.
echo Was fast, isn't it ?
pause
