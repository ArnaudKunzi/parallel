{smcl}
{* *! version 1.20.1 07jun2021}{...}
{vieweralsosee "parallel" "help parallel"}{...}
{cmd:help cmd_list}
{hline}

{title:Title}

{phang}
{bf:cmd_list} {hline 2} Stata module to run loop iterations involving separate commands sequentially or in parallel.


{marker syntax}{...}
{title:Syntax}

{col 5}{hline}{marker sub_clear}{...}
{pstd}Clear a {it:command list}

{p 8 17 2}
{cmd:cmd_list clear}

{col 5}{hline}{marker sub_add}{...}
{pstd}Add a command to the {it:command list}

{p 8 17 2}
{cmd:cmd_list add:} {it:command}

{col 5}{hline}{marker sub_run}{...}
{pstd}Run a {it:command list}

{p 8 17 2}
{cmd:cmd_list run} [{cmd:,} {opt parallel} {it:parallel_options}]

{synoptset 23 tabbed}{...}
{marker options_table}{...}
{synopthdr}
{synoptline}
{syntab :run}
{synopt :{opt parallel}}execute the iterations using {cmd:parallel}. Must have specified the
cluster using {cmd:parallel setclusters}. Default is non-parallel (sequential).{p_end}

{synoptline}
{p2colreset}{...}

{marker description}{...}
{title:Description}

{pstd}
{cmd:cmd_list} builds up a list of commands and then allows one to execute them sequentially or using {cmd:parallel}.
{cmd:cmd_list add} just records the literal command string, it does not snapshot the dataset when each command is added (so the commands must work with the 
dataset present when {cmd:cmd_list run}). {cmd:cmd_list run} automaticaly clears the command list. If the command list needs to be cleared manually, one can use {cmd:cmd_list clear}.

{marker examples}{...}
{title:Examples}

{pstd}
Example using {cmd:cmd_list}:

	{cmd:foreach v1 in a b c d} {
		{cmd:foreach v2 in a b c d} {
			{cmd:cmd_list add}: {it:cmd} `v1' `v2'
		}
	}
	{cmd:cmd_list run, parallel}

{pstd}
Omit {it:parallel} to run the commands sequentially.

