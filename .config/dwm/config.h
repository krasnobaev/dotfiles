/* MIT/X Consortium License */
/* DWM Configuration header  */

/* appearance */
static const char font[]            = "-*-terminus-medium-r-*-*-16-*-*-*-*-*-*-*";
static const char normbordercolor[] = "#444444";
static const char normbgcolor[]     = "#222222";
static const char normfgcolor[]     = "#bbbbbb";
static const char selbordercolor[]  = "#005577";
static const char selbgcolor[]      = "#005577";
static const char selfgcolor[]      = "#eeeeee";
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const Bool showbar           = False;    /* False means no bar */
static const Bool topbar            = False;    /* False means bottom bar */

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
    /* xprop(1):
     *  WM_CLASS(STRING) = instance, class
     *  WM_NAME(STRING) = title
     */
    /* class        instance  title      tags mask isfloating   monitor */
    { "Gimp",       NULL,     NULL,      0,        True,        -1 },
    { "Firefox",    NULL,     NULL,      0,        False,       -1 },
    { "Qjackctl",   NULL,     NULL,      0,        True,        -1 },
    { "Unetbootin", NULL,     NULL,      0,        True,        -1 },
    { "Cadence",    NULL,     NULL,      0,        True,        -1 },
};

/* layout(s) */
static const float mfact      = 0.55; /* master area size factor [0.05..0.95] */
static const int nmaster      = 1;    /* number of clients in master area */
static const Bool resizehints = True; /* True means respect size hints in tiled resizals */

static const Layout layouts[] = {
    /* symbol     arrange function */
    { "[]=",      tile },    /* first entry is default */
    { "< >",      NULL },    /* no layout function means floating behavior */
    { "[M]",      monocle },
};

/* custom functions declarations */
static void circlesetlayout (const Arg *arg);

void maximize(int, int, int, int);
void togglemaximize(const Arg *);
void toggleverticalmax(const Arg *);
void togglehorizontalmax(const Arg *);

/* key definitions */
// Mod1Mask    - Alt
// Mod4Mask    - Win/Super
// ControlMask - Ctrl
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
    { MODKEY,                       KEY,    view,       {.ui = 1 << TAG} }, \
    { MODKEY|ControlMask,           KEY,    toggleview, {.ui = 1 << TAG} }, \
    { MODKEY|ShiftMask,             KEY,    tag,        {.ui = 1 << TAG} }, \
    { MODKEY|ControlMask|ShiftMask, KEY,    toggletag,  {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* dmenucmd component in spawn() */
static const char *dmenucmd[]       = { "dmenu_run", "-fn", font, "-nb",
                                        normbgcolor, "-nf", normfgcolor, "-sb",
                                        selbgcolor, "-sf", selfgcolor, NULL };
static const char *termcmd[]        = { "x-terminal-emulator", NULL };
static const char *gvimcmd[]        = { "gvim", NULL };
static const char *webcmd[]         = { "chromium-browser", NULL };
static const char *webhcmd[]        = { "chromium-browser",
                                        "--incognito", NULL };
static const char *explorercmd[]    = { "dolphin", NULL };
static const char *printcmd[]       = { "gnome-screenshot", NULL};
static const char *aprintcmd[]      = { "gnome-screenshot", "-w", NULL};
static const char *lockcmd[]        = { "gnome-screensaver-command", "-l", NULL};
static const char *topcmd[]         = { "gnome-terminal", "--command=top",
                                        "--hide-menubar", NULL};

static Key keys[] = {
    /* modifier             key        function        argument */
    { MODKEY,               XK_r,      spawn,          {.v = dmenucmd} },
    { ControlMask|Mod1Mask, XK_t,      spawn,          {.v = termcmd} },
    { 0,                    0xff61,    spawn,          {.v = printcmd}}, //Print
    { Mod1Mask,             0xff61,    spawn,          {.v = aprintcmd}}, //Print
    { MODKEY,               XK_b,      togglebar,      {0} },
    { Mod1Mask,             0xff09,    focusstack,     {.i = +1 } }, //Tab
    { Mod1Mask|ShiftMask,   0xff09,    focusstack,     {.i = -1 } }, //Tab
    { MODKEY,               0xff09,    view,           {.i = +1 } }, //Tab
    { MODKEY,               XK_j,      focusstack,     {.i = +1 } },
    { MODKEY,               XK_k,      focusstack,     {.i = -1 } },
    { MODKEY,               XK_i,      incnmaster,     {.i = +1 } },
    { MODKEY,               XK_d,      incnmaster,     {.i = -1 } },
    { MODKEY,               XK_h,      setmfact,       {.f = -0.05} },
    { MODKEY,               XK_l,      setmfact,       {.f = +0.05} },
    { MODKEY,               XK_Return, zoom,           {0} },
    { MODKEY,               0xff8d,    zoom,           {0} }, // KP_Enter
    { MODKEY,               0xff53,    zoom,           {0} }, // RightKey
    { MODKEY,               0xff08,    view,           {0} }, // BackSpace
    { Mod1Mask,             0xffc1,    killclient,     {0} }, // Alt+F4
    { MODKEY,               XK_v,      circlesetlayout,{0} },
    { MODKEY,               XK_t,      setlayout,      {.v = &layouts[0]} },
    { MODKEY,               XK_f,      setlayout,      {.v = &layouts[1]} },
    { MODKEY,               XK_m,      setlayout,      {.v = &layouts[2]} },
    { MODKEY,               0x60,      setlayout,      {0} }, //grave
    { MODKEY|ShiftMask,     XK_f,      togglefloating, {0} },
    { MODKEY,               XK_0,      view,           {.ui = ~0 } },
    { MODKEY|ShiftMask,     XK_0,      tag,            {.ui = ~0 } },
    { MODKEY,               XK_comma,  focusmon,       {.i = -1 } },
    { MODKEY,               XK_period, focusmon,       {.i = +1 } },
    { MODKEY|ShiftMask,     XK_comma,  tagmon,         {.i = -1 } },
    { MODKEY|ShiftMask,     XK_period, tagmon,         {.i = +1 } },
    TAGKEYS( XK_1,       0)
    TAGKEYS( XK_2,       1)
    TAGKEYS( XK_3,       2)
    TAGKEYS( 0x1008ff81, 2) //XF86Tools
    TAGKEYS( XK_4,       3)
    TAGKEYS( 0x1008ff19, 3) //XF86Mail
    TAGKEYS( XK_5,       4)
    TAGKEYS( XK_6,       5)
    TAGKEYS( XK_7,       6)
    TAGKEYS( XK_8,       7)
    TAGKEYS( XK_9,       8)
    { MODKEY|ShiftMask,     XK_q,      quit,                {0} },
// maximize patch
    { MODKEY|ControlMask,   XK_h,      togglehorizontalmax, {0} },
    { MODKEY|ControlMask,   XK_l,      togglehorizontalmax, {0} },
    { MODKEY|ControlMask,   XK_j,      toggleverticalmax,   {0} },
    { MODKEY|ControlMask,   XK_k,      toggleverticalmax,   {0} },
    { MODKEY|ControlMask,   XK_m,      togglemaximize,      {0} },
// HotKeys
//  { 0,                 XK_c,       spawn, {0} },
    { 0,                 0x1008ff18, spawn, {.v = webcmd}  },   //Web Key
    { ShiftMask,         0x1008ff18, spawn, {.v = webhcmd} },   //Web Key
    { MODKEY,            XK_e,       spawn, {.v = explorercmd} },
    { MODKEY,            0x1008ff5d, spawn, {.v = explorercmd} }, //XF86Explorer
    { 0,                 0x1008ff30, spawn, {.v = termcmd} },   //Favorites Key
    { 0,                 0x1008ff2c, spawn, {.v = gvimcmd} },   //Word Key
    { MODKEY|Mod1Mask,         XK_l, spawn, {.v = lockcmd} },
    { ControlMask|ShiftMask, 0xff1b, spawn, {.v = topcmd}  },   //Escape
    { ControlMask|Mod1Mask,  0xffff, spawn, {.v = topcmd}  },   //Delete
};

/* button definitions
 * ClkLtSymbol      - <++>
 * ClkStatusText    - <++>
 * ClkWinTitle      - <++>
 * ClkClientWin     - <++>
 * ClkRootWin       - <++>
 * Button1 - LC
 * Button2 - MC
 * Button3 - RC
 * */
static Button buttons[] = {
    /* click         event mask        button    function        argument */
    { ClkLtSymbol,   0,                Button1,  setlayout,      {0} },
    { ClkLtSymbol,   0,                Button3,  setlayout, {.v = &layouts[2]} },
    { ClkWinTitle,   0,                Button2,  zoom,           {0} },
    { ClkStatusText, 0,                Button2,  spawn,     {.v = termcmd } },
    { ClkClientWin,  MODKEY,           Button1,  movemouse,      {0} },
    { ClkClientWin,  MODKEY|ShiftMask, Button1,  zoom,           {0} },
    { ClkClientWin,  MODKEY,           Button2,  killclient,     {0} },
    { ClkClientWin,  MODKEY|ShiftMask, Button2,  togglefloating, {0} },
    { ClkClientWin,  MODKEY,           Button3,  resizemouse,    {0} },
    { ClkTagBar,     0,                Button1,  view,           {0} },
    { ClkTagBar,     0,                Button3,  toggleview,     {0} },
    { ClkTagBar,     MODKEY,           Button1,  tag,            {0} },
    { ClkTagBar,     MODKEY,           Button3,  toggletag,      {0} },
// User Define
};

/* custom functions */
// http://stackoverflow.com/questions/13404075/how-i-can-implement-circle-switching-layouts-in-dwm
void circlesetlayout (const Arg *arg) {
    Arg newarg = {0};

    size_t i = 0;
    while(i < LENGTH(layouts) && selmon->lt[selmon->sellt] != &layouts[i])
        i++;

    newarg.v = &layouts[(i + 1) % LENGTH(layouts)]; // you can do it without '%'
    setlayout(&newarg);
}

// Patch maximize
void
maximize(int x, int y, int w, int h) {
    XEvent ev;

    if(!selmon->sel || selmon->sel->isfixed)
        return;
    XRaiseWindow(dpy, selmon->sel->win);
    if(!selmon->sel->ismax) {
        if(!selmon->lt[selmon->sellt]->arrange || selmon->sel->isfloating)
            selmon->sel->wasfloating = True;
        else {
            togglefloating(NULL);
            selmon->sel->wasfloating = False;
        }
        selmon->sel->oldx = selmon->sel->x;
        selmon->sel->oldy = selmon->sel->y;
        selmon->sel->oldw = selmon->sel->w;
        selmon->sel->oldh = selmon->sel->h;
        resize(selmon->sel, x, y, w, h, True);
        selmon->sel->ismax = True;
    }
    else {
        resize(selmon->sel, selmon->sel->oldx, selmon->sel->oldy, selmon->sel->oldw, selmon->sel->oldh, True);
        if(!selmon->sel->wasfloating)
            togglefloating(NULL);
        selmon->sel->ismax = False;
    }
    drawbar(selmon);
    while(XCheckMaskEvent(dpy, EnterWindowMask, &ev));
}

void
togglemaximize(const Arg *arg) {
    maximize(selmon->wx, selmon->wy, selmon->ww - 2 * borderpx, selmon->wh - 2 * borderpx);
}

void
toggleverticalmax(const Arg *arg) {
    maximize(selmon->sel->x, selmon->wy, selmon->sel->w, selmon->wh - 2 * borderpx);
}

void
togglehorizontalmax(const Arg *arg) {
    maximize(selmon->wx, selmon->sel->y, selmon->ww - 2 * borderpx, selmon->sel->h);
}

