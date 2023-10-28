/* See LICENSE file for copyright and license details. */

#include <X11/XF86keysym.h>


#define TERMINAL  "alacritty"
#define TERMCLASS "Alacritty"

/* appearance */
static const unsigned int borderpx  = 4;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int swallowfloating    = 0;        /* 1 means swallow floating windows by default */
static const unsigned int gappih    = 10;       /* horiz inner gap between windows */
static const unsigned int gappiv    = 10;       /* vert inner gap between windows */
static const unsigned int gappoh    = 22;       /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 22;       /* vert outer gap between windows and screen edge */
static       int smartgaps          = 0;        /* 1 means no outer gap when there is only one window */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const int horizpadbar        = -4;        /* horizontal padding for statusbar */
static const int vertpadbar         = 4;        /* vertical padding for statusbar */
//static const char *fonts[]          = {"JetBrainsMono Nerd Font Mono:medium:pixelsize=16","Noto Sans Mono:pixelsize=18" };
static const char *fonts[]          = {"NotoSansM Nerd Font:medium:pixelsize=16","Noto Sans Mono:pixelsize=40" };
static const char dmenufont[]       = "NotoSansM Nerd Font:medium:pixelsize=16";

#include "themes/mocha.h"
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { surface0, mantle, crust },
	[SchemeSel]  = { surface0, mantle, base },
    /*                     border bg        fg (for dwm blocks specifically)*/
    [SchemeDisk]        = {flamingo,  mantle, crust}, //4
    [SchemeCpu]         = {peach,  mantle,   crust}, //8
    [SchemeRam]         = {red, mantle,  crust}, //9
    [SchemeBluetooth]   = {blue, mantle, crust}, //6
    [SchemeInternet]    = {teal, mantle, crust}, //6
    [SchemeVolume]      = {mauve, mantle, crust}, //5
    [SchemeBrightness]  = {yellow,mantle, crust}, //3
    [SchemeBattery]     = {green, mantle, crust}, //7
    [SchemeTime]        = {text,mantle,    crust}, //10
};

/* tagging */
//static const char *tags[] = { "", "", "󰖟", "", "󰍡", "", "" };
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7" }; 
//static const char *tags[] = { "", " ", "󰖟", "4", "5", " ", "" };

/* Lockfile */
static char lockfile[] = "/tmp/dwm.lock";

static const unsigned int ulinepad      = 6;	/* horizontal padding between the underline and tag */
static const unsigned int ulinestroke   = 2;	/* thickness / height of the underline */
static const unsigned int ulinevoffset  = 0;	/* how far above the bottom of the bar the line should appear */
static const int ulineall               = 0;	/* 1 to show underline on all tags, 0 for just the active ones */

static const char *tagsel[][2] = {
	//{ red,      base },
	//{ blue,     base },
	//{ lavender, base },
	//{ yellow,   base },
	//{ green,    base },
	//{ peach,    base },
	//{ mauve,    base },
	{ red,      base },
	{ green, base },
	{ yellow,   base },
	{ blue,     base },
	{ pink,    base },
	{ teal,    base },
	{ subtext1,   base },
};

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class     instance  title           tags mask  isfloating  isterminal  noswallow  alonecenteredsize monitor */
	{ "Gimp",    NULL,     NULL,           0,         1,          0,          0,         0,             -1 },
	{ "Firefox", NULL,     NULL,           1 << 8,    0,          0,         -1,         0,             -1 },
    //Terminals
	{ TERMCLASS, NULL,     NULL,           0,         0,          1,          0,         0.62,          -1 },
	//Other Terminals
    { "St",      NULL,     NULL,           0,         0,          1,          0,         0.62,          -1 },
	{ "st-256color",NULL,  NULL,           0,         0,          1,          0,         0.62,          -1 },
	{ "Kitty",   NULL,     NULL,           0,         0,          1,          0,         0.62,          -1 },
	{ "Alacritty",NULL,    NULL,           0,         0,          1,          0,         0.62,          -1 },
    
    //A getaround for the braile font problem with alacritty
	{ "FloatingClass",   "Battery",NULL,   0,         1,          1,          0,         0,             -1 },
	{ "FloatingClass",   NULL,     NULL,   0,         1,          1,          0,         0,             -1 },

    //xev
	{ NULL,      NULL,     "Event Tester", 0,         0,          0,          1,         0,             -1 }, /* xev */
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

#define FORCE_VSPLIT 1  /* nrowgrid layout: force two clients to always split vertically */
#include "vanitygaps.c"

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "H[]",      deck },
	{ "[M]",      monocle },
	{ ":::",      gaplessgrid },
	{ "|M|",      centeredmaster },
    //{ "[@]",      spiral },
	//{ "[\\]",     dwindle },
	//{ "TTT",      bstack },
	//{ "===",      bstackhoriz },
	//{ "HHH",      grid },
	//{ "###",      nrowgrid },
	//{ "---",      horizgrid },
	//{ ">M>",      centeredfloatingmaster },
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ NULL,       NULL },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      comboview,      {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      toggletag,      {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      tag,            {.ui = 1 << TAG} },


/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

#define STATUSBAR "dwmblocks"

/* commands */
static const char *dmenucmd[] = { "dmenu_run", "-fn", dmenufont, "-nb", mantle, "-nf", overlay0, "-sb", base, "-sf", yellow, NULL };
static const char *termcmd[]  = { TERMINAL, NULL };
static const char *browser[]  = { "qutebrowser", NULL };

#include "movestack.c"
static const Key keys[] = {
	/* modifier                     key        function        argument */
    { MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_a,      spawn,          {.v = browser } },
	
    //stack navigation
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_h,      focusmasterstrict,    {0} },
	{ MODKEY,                       XK_l,      focusmasterback,{0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
    //stack alteration
	{ MODKEY|ShiftMask,             XK_j,      movestack,      {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_k,      movestack,      {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_h,      zoomin,         {0} },
	{ MODKEY|ShiftMask,             XK_l,      zoomout,        {0} },

	//gaps toggle
    { MODKEY,                       XK_g,      togglegaps,     {0} },
    //bar toggle
    { MODKEY,                       XK_b,      togglebar,      {0} },
	//toggle floating for current window
    { MODKEY,                       XK_v,      togglefloating, {0} },

    //Changing layout appearance
	{ MODKEY|ControlMask|ShiftMask, XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY|ControlMask|ShiftMask, XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY|ControlMask|ShiftMask, XK_k,      setcfact,       {.f = +0.25} },
	{ MODKEY|ControlMask|ShiftMask, XK_j,      setcfact,       {.f = -0.25} },
	//{ MODKEY|ShiftMask,             XK_o,      setcfact,       {.f =  0.00} },
    
    //close client
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
    
    //Layouts 0:tile, 1:deck, 2:monocle, 3:gaplessgrid , 4:centredmaster , 5:float
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_r,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[2]} },

	{ MODKEY,                       XK_Home,   setlayout,      {.v = &layouts[3]} },
	{ MODKEY,                       XK_End,    setlayout,      {.v = &layouts[4]} },
	{ MODKEY,                       XK_Insert, setlayout,      {.v = &layouts[5]} },

    //tags
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)

	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },

    //Brightness and audio
    { 0,XF86XK_MonBrightnessDown,spawn,SHCMD("xbacklight -dec 5; pkill -RTMIN+9 dwmblocks") },
    { 0,XF86XK_MonBrightnessUp,  spawn,SHCMD("xbacklight -inc 5; pkill -RTMIN+9 dwmblocks") },
    { 0,XF86XK_AudioMute,spawn,
        SHCMD("amixer -q sset Master toggle ; pkill -RTMIN+8 dwmblocks") },
    { 0,XF86XK_AudioLowerVolume, spawn,
        SHCMD("amixer -q sset Master unmute ; amixer -q sset Master 5%-; pkill -RTMIN+8 dwmblocks") },
    { 0,XF86XK_AudioRaiseVolume,spawn,
        SHCMD("amixer -q sset Master unmute ; amixer -q sset Master 5%+ ; pkill -RTMIN+8 dwmblocks") },
    { 0,XF86XK_AudioMicMute,spawn,
        SHCMD("amixer -q sset Capture toggle ; pkill -RTMIN+8 dwmblocks") },
    { ShiftMask,XF86XK_AudioLowerVolume, spawn,
        SHCMD("amixer -q sset Capture unmute ; amixer -q sset Capture 5%-; pkill -RTMIN+8 dwmblocks") },
    { ShiftMask,XF86XK_AudioRaiseVolume,spawn,
        SHCMD("amixer -q sset Capture unmute ; amixer -q sset Capture 5%+ ; pkill -RTMIN+8 dwmblocks") },

    
    //special scripts
	{ MODKEY,                       XK_c,      spawn,          SHCMD("dm-catppuccin") },
	{ MODKEY,                       XK_x,      spawn,          SHCMD("colormenu") },
	{ MODKEY|ShiftMask,             XK_x,      spawn,          SHCMD("colormenu open") },
	{ MODKEY|ControlMask,           XK_x,      spawn,          SHCMD("colormenu pick") },
	{ MODKEY,                       XK_i,      spawn,          SHCMD("dm-wlanconnect") },
	{ 0,                            XK_Print,  spawn,          SHCMD("screenshot") },
};



/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
    // dwmblocks signals
    //
	{ ClkStatusText,        0,              Button1,        sigstatusbar,   {.i = 1} }, //LMB
	{ ClkStatusText,        0,              Button2,        sigstatusbar,   {.i = 2} }, //MMB
	{ ClkStatusText,        0,              Button3,        sigstatusbar,   {.i = 3} }, //RMB
	{ ClkStatusText,        0,              Button4,        sigstatusbar,   {.i = 4} }, //ScUp
	{ ClkStatusText,        0,              Button5,        sigstatusbar,   {.i = 5} }, //ScDown
	{ ClkStatusText,        ShiftMask,      Button1,        sigstatusbar,   {.i = 6} },
	{ ClkStatusText,        ShiftMask,      Button2,        sigstatusbar,   {.i = 7} },
	{ ClkStatusText,        ShiftMask,      Button3,        sigstatusbar,   {.i = 8} },
	{ ClkStatusText,        ShiftMask,      Button4,        sigstatusbar,   {.i = 9} },
	{ ClkStatusText,        ShiftMask,      Button5,        sigstatusbar,   {.i = 10} }, 
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} }, { ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

