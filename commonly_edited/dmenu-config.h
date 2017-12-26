static int topbar = 1;  /* -b  option; if 0, dmenu appears at bottom     */
static const char *fonts[] = {
    "Terminus:pixelsize=12:antialias=false:autohint=false"
};
static const char *prompt = NULL;      /* -p  option; prompt to the left of input field */
static int fuzzy = 1; /* -F  option; if 0, dmenu doesn't use fuzzy matching */
static const char *colors[SchemeLast][2] = {
            	/*     fg         bg       */
	[SchemeNorm] = { "#bbbbbb", "#373B41" },
	[SchemeSel] =  { "#eeeeee", "#5F819D" },
	[SchemeOut] =  { "#000000", "#00ffff" },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines = 0;

/* Characters not considered part of a word while deleting words
 * for example: " /?\"&[]" */
static const char worddelimiters[] = " ";