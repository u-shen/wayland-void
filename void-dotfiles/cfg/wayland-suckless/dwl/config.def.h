/* Media keys */
#include <X11/XF86keysym.h>
/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }
/* appearance */
static const int sloppyfocus               = 1;  /* focus follows mouse */
static const int bypass_surface_visibility = 0;  /* 1 means idle inhibitors will disable idle tracking even if it's surface isn't visible  */
static const unsigned int borderpx         = 1;  /* border pixel of windows */
static const float rootcolor[]             = COLOR(0x1d2021ff);
static const float bordercolor[]           = COLOR(0x282828ff);
static const float focuscolor[]            = COLOR(0x689d6aff);
static const float urgentcolor[]           = COLOR(0xff0000ff);
/* This conforms to the xdg-protocol. Set the alpha to zero to restore the old behavior */
static const float fullscreen_bg[]         = {0.1f, 0.1f, 0.1f, 1.0f}; /* You can also use glsl colors */

/* tagging - TAGCOUNT must be no greater than 31 */
#define TAGCOUNT (9)

/* logging */
static int log_level = WLR_ERROR;

/* Autostart */
static const char *const autostart[] = {
        "bash", "/home/lli/.config/wayland-suckless/dwl/scripts/autostart.sh", NULL,
        "bash", "/home/lli/.config/wayland-suckless/dwl/scripts/gtkTheme.sh", NULL,
        "bash", "/home/lli/.config/wayland-suckless/dwl/scripts/idle.sh", NULL,
        NULL /* terminate */
};


/* NOTE: ALWAYS keep a rule declared even if you don't use rules (e.g leave at least one example) */
static const Rule rules[] = {
	/* app_id             title       tags mask     isfloating   monitor */
	/* examples: */
	{ "Gimp_EXAMPLE",     NULL,       0,            1,           -1 }, /* Start on currently visible tags floating, not tiled */
	{ "firefox_EXAMPLE",  NULL,       1 << 8,       0,           -1 }, /* Start on ONLY tag "9" */
};

/* layout(s) */
static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* monitors */
/* (x=-1, y=-1) is reserved as an "autoconfigure" monitor position indicator
 * WARNING: negative values other than (-1, -1) cause problems with Xwayland clients
 * https://gitlab.freedesktop.org/xorg/xserver/-/issues/899
*/
/* NOTE: ALWAYS add a fallback rule, even if you are completely sure it won't be used */
static const MonitorRule monrules[] = {
	/* name       mfact  nmaster scale layout       rotate/reflect                x    y */
	/* example of a HiDPI laptop monitor:
	{ "eDP-1",    0.5f,  1,      2,    &layouts[0], WL_OUTPUT_TRANSFORM_NORMAL,   -1,  -1 },
	*/
	/* defaults */
	{ NULL,       0.55f, 1,      1,    &layouts[0], WL_OUTPUT_TRANSFORM_NORMAL,   -1,  -1 },
};

/* keyboard */
static const struct xkb_rule_names xkb_rules = {
	/* can specify fields: rules, model, layout, variant, options */
	/* example:
	.options = "ctrl:nocaps",
	*/
  .options = "caps:escape,grp:alt_altgr_toggle",
  .layout  = "us,ara",
};

static const int repeat_rate = 50;
static const int repeat_delay = 200;

/* Trackpad */
static const int tap_to_click = 1;
static const int tap_and_drag = 1;
static const int drag_lock = 1;
static const int natural_scrolling = 0;
static const int disable_while_typing = 1;
static const int left_handed = 0;
static const int middle_button_emulation = 0;
/* You can choose between:
LIBINPUT_CONFIG_SCROLL_NO_SCROLL
LIBINPUT_CONFIG_SCROLL_2FG
LIBINPUT_CONFIG_SCROLL_EDGE
LIBINPUT_CONFIG_SCROLL_ON_BUTTON_DOWN
*/
static const enum libinput_config_scroll_method scroll_method = LIBINPUT_CONFIG_SCROLL_2FG;

/* You can choose between:
LIBINPUT_CONFIG_CLICK_METHOD_NONE
LIBINPUT_CONFIG_CLICK_METHOD_BUTTON_AREAS
LIBINPUT_CONFIG_CLICK_METHOD_CLICKFINGER
*/
static const enum libinput_config_click_method click_method = LIBINPUT_CONFIG_CLICK_METHOD_BUTTON_AREAS;

/* You can choose between:
LIBINPUT_CONFIG_SEND_EVENTS_ENABLED
LIBINPUT_CONFIG_SEND_EVENTS_DISABLED
LIBINPUT_CONFIG_SEND_EVENTS_DISABLED_ON_EXTERNAL_MOUSE
*/
static const uint32_t send_events_mode = LIBINPUT_CONFIG_SEND_EVENTS_ENABLED;

/* You can choose between:
LIBINPUT_CONFIG_ACCEL_PROFILE_FLAT
LIBINPUT_CONFIG_ACCEL_PROFILE_ADAPTIVE
*/
static const enum libinput_config_accel_profile accel_profile = LIBINPUT_CONFIG_ACCEL_PROFILE_ADAPTIVE;
static const double accel_speed = 0.0;

/* You can choose between:
LIBINPUT_CONFIG_TAP_MAP_LRM -- 1/2/3 finger tap maps to left/right/middle
LIBINPUT_CONFIG_TAP_MAP_LMR -- 1/2/3 finger tap maps to left/middle/right
*/
static const enum libinput_config_tap_button_map button_map = LIBINPUT_CONFIG_TAP_MAP_LRM;

/* If you want to use the windows key for MODKEY, use WLR_MODIFIER_LOGO */
#define MODKEY WLR_MODIFIER_ALT

#define TAGKEYS(KEY,SKEY,TAG) \
	{ MODKEY,                    KEY,            view,            {.ui = 1 << TAG} }, \
	{ MODKEY|WLR_MODIFIER_CTRL,  KEY,            toggleview,      {.ui = 1 << TAG} }, \
	{ MODKEY|WLR_MODIFIER_SHIFT, SKEY,           tag,             {.ui = 1 << TAG} }, \
	{ MODKEY|WLR_MODIFIER_CTRL|WLR_MODIFIER_SHIFT,SKEY,toggletag, {.ui = 1 << TAG} }

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static const char *termcmd[]          = { "foot", NULL };
static const char *termbidi[]         = { "wezterm", NULL };
static const char *browser[]          = { "firefox", NULL };
static const char *browserGO[]        = { "chromium", NULL };
static const char *fileGui[]          = { "pcmanfm", NULL };
static const char *menuGui[]       		= { "fuzzel", NULL };
static const char *menucmd[]          = { "wmenu-run", "-il", "10", "-p", "LAUNCH:",  "-N", "1d2021","-n", "ebdbb2","-S","689d6a", "-s","0d0e0f", "-M", "689d6a", "-m" ,"1d2021", NULL };
static const char *fileCli[]          = { "foot", "-e", "yazi",  NULL };
static const char *onScreenKeyboard[] = { "bash", "/home/lli/.config/wayland-suckless/dwl/scripts/onScreenKeyboard.sh", NULL};
static const char *screenShoot[]      = { "bash", "/home/lli/.config/wayland-suckless/dwl/scripts/screenShoot.sh", NULL};
static const char *screenRecored[]    = { "bash", "/home/lli/.config/wayland-suckless/dwl/scripts/screenRecored.sh", NULL};
static const char *powerMenu[]        = { "bash", "/home/lli/.config/wayland-suckless/dwl/scripts/powerMenu.sh", NULL};
static const char *wifiMenu[]         = { "python","/home/lli/.config/wayland-suckless/dwl/scripts/wifiMenu.py", NULL};
static const char *blueMenu[]         = { "bash", "/home/lli/.config/wayland-suckless/dwl/scripts/blueMenu.sh", NULL};
static const char *audioMute[]        = { "wpctl", "set-mute", "@DEFAULT_AUDIO_SINK@", "toggle", NULL};
static const char *micMute[]          = { "wpctl", "set-mute", "@DEFAULT_AUDIO_SOURCE@", "toggle",  NULL};
static const char *raiseVolume[]      = { "wpctl", "set-volume", "@DEFAULT_AUDIO_SINK@", "5%+", "-l", "1.3",  NULL};
static const char *lowerVolume[]      = { "wpctl", "set-volume", "@DEFAULT_AUDIO_SINK@", "5%-",  NULL};
static const char *lightUp[]          = { "brightnessctl", "set", "+5%",  NULL};
static const char *lightDown[]        = { "brightnessctl", "set", "5%-",  NULL};
static const char *swayNc[]        	  = { "swaync-client", "-t", "-sw",  NULL};

static const Key keys[] = {
	/* Note that Shift changes certain key codes: c -> C, 2 -> at, etc. */
	/* modifier                  key                 function        argument */
	{ MODKEY,                    XKB_KEY_p,          spawn,          {.v = menucmd} },
  { MODKEY,                    XKB_KEY_d,          spawn,          {.v = menuGui} },
	{ MODKEY,                    XKB_KEY_Return,     spawn,          {.v = termcmd} },
	{ MODKEY,                    XKB_KEY_backslash,  spawn,          {.v = termbidi} },
	{ MODKEY,                    XKB_KEY_w,          spawn,          {.v = browserGO} },
	{ MODKEY,                    XKB_KEY_g,          spawn,          {.v = browser} },
	{ MODKEY,                    XKB_KEY_n,          spawn,          {.v = fileCli} },
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_N,          spawn,          {.v = fileGui} },
	{ MODKEY,                    XKB_KEY_o,          spawn,          {.v = onScreenKeyboard} },
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_S,          spawn,          {.v = screenShoot} },
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_R,          spawn,          {.v = screenRecored} },
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_P,          spawn,          {.v = powerMenu} },
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_W,          spawn,          {.v = wifiMenu} },
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_B,          spawn,          {.v = blueMenu} },
	{ 0,                         XF86XK_AudioMute,   spawn,          {.v = audioMute} },
	{ 0,                         XF86XK_AudioMicMute,spawn,          {.v = micMute} },
	{ 0,                         XF86XK_AudioRaiseVolume, spawn,     {.v = raiseVolume} },
	{ 0,                         XF86XK_AudioLowerVolume, spawn,     {.v = lowerVolume} },
	{ 0,                         XF86XK_MonBrightnessUp,  spawn,     {.v = lightUp} },
	{ 0,                         XF86XK_MonBrightnessDown,spawn,     {.v = lightDown} },
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_D,     	   spawn,          {.v = swayNc} },
	{ MODKEY,                    XKB_KEY_h,          focusdir,       {.ui = 0} },
	{ MODKEY,                    XKB_KEY_l,          focusdir,       {.ui = 1} },
	{ MODKEY,                    XKB_KEY_k,          focusdir,       {.ui = 2} },
	{ MODKEY,                    XKB_KEY_j,          focusdir,       {.ui = 3} },
	{ MODKEY,                    XKB_KEY_i,          incnmaster,     {.i = +1} },
	{ MODKEY,                    XKB_KEY_u,          incnmaster,     {.i = -1} },
	{ MODKEY|WLR_MODIFIER_CTRL,  XKB_KEY_h,          setmfact,       {.f = -0.05f} },
	{ MODKEY|WLR_MODIFIER_CTRL,  XKB_KEY_l,          setmfact,       {.f = +0.05f} },
	{ MODKEY,                    XKB_KEY_s,          zoom,           {0} },
	{ MODKEY,                    XKB_KEY_Tab,        view,           {0} },
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_C,          killclient,     {0} },
	{ MODKEY,                    XKB_KEY_q,          killclient,     {0} },
	{ MODKEY,                    XKB_KEY_t,          setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                    XKB_KEY_e,          setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                    XKB_KEY_m,          setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                    XKB_KEY_space,      setlayout,      {0} },
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_space,      togglefloating, {0} },
	{ MODKEY,                    XKB_KEY_f,          togglefullscreen, {0} },
	{ MODKEY,                    XKB_KEY_0,          view,           {.ui = ~0} },
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_parenright, tag,            {.ui = ~0} },
	{ MODKEY,                    XKB_KEY_comma,      focusmon,       {.i = WLR_DIRECTION_LEFT} },
	{ MODKEY,                    XKB_KEY_period,     focusmon,       {.i = WLR_DIRECTION_RIGHT} },
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_less,       tagmon,         {.i = WLR_DIRECTION_LEFT} },
	{ MODKEY|WLR_MODIFIER_SHIFT, XKB_KEY_greater,    tagmon,         {.i = WLR_DIRECTION_RIGHT} },
	TAGKEYS(          XKB_KEY_1, XKB_KEY_exclam,                     0),
	TAGKEYS(          XKB_KEY_2, XKB_KEY_at,                         1),
	TAGKEYS(          XKB_KEY_3, XKB_KEY_numbersign,                 2),
	TAGKEYS(          XKB_KEY_4, XKB_KEY_dollar,                     3),
	TAGKEYS(          XKB_KEY_5, XKB_KEY_percent,                    4),
	TAGKEYS(          XKB_KEY_6, XKB_KEY_asciicircum,                5),
	TAGKEYS(          XKB_KEY_7, XKB_KEY_ampersand,                  6),
	TAGKEYS(          XKB_KEY_8, XKB_KEY_asterisk,                   7),
	TAGKEYS(          XKB_KEY_9, XKB_KEY_parenleft,                  8),
	{ MODKEY|WLR_MODIFIER_CTRL,  XKB_KEY_q,          quit,           {0} },

	/* Ctrl-Alt-Backspace and Ctrl-Alt-Fx used to be handled by X server */
	{ WLR_MODIFIER_CTRL|WLR_MODIFIER_ALT,XKB_KEY_Terminate_Server, quit, {0} },
	/* Ctrl-Alt-Fx is used to switch to another VT, if you don't know what a VT is
	 * do not remove them.
	 */
#define CHVT(n) { WLR_MODIFIER_CTRL|WLR_MODIFIER_ALT,XKB_KEY_XF86Switch_VT_##n, chvt, {.ui = (n)} }
	CHVT(1), CHVT(2), CHVT(3), CHVT(4), CHVT(5), CHVT(6),
	CHVT(7), CHVT(8), CHVT(9), CHVT(10), CHVT(11), CHVT(12),
};

static const Button buttons[] = {
	{ MODKEY, BTN_LEFT,   moveresize,     {.ui = CurMove} },
	{ MODKEY, BTN_MIDDLE, togglefloating, {0} },
	{ MODKEY, BTN_RIGHT,  moveresize,     {.ui = CurResize} },
};
