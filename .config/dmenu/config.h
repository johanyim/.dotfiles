/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
static int fuzzy = 1;                      /* -F  option; if 0, dmenu doesn't use fuzzy matching     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"NotoSansM Nerd Font:medium:pixelsize=16"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */

static const char *colors[SchemeLast][2] = {
	                        /*     fg         bg       */
	[SchemeNorm] =          { "#6c7086", "#181825" },
	[SchemeOut] =           { "#f9e2af", "#1e1e2e" },
	[SchemeNormHighlight] = { "#fab387", "#1e1e2e" },
	[SchemeSel] =           { "#f9e2af", "#313244" },
	[SchemeSelHighlight] =  { "#fab387", "#313244" },

};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 5;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char startpipe[] = "#";
static const char worddelimiters[] = " ";

/* -n option; preselected item starting from 0 */
static unsigned int preselected = 0;
