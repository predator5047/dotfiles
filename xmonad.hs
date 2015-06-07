import XMonad
import XMonad.Util.EZConfig
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders
import Graphics.X11.ExtraTypes.XF86

main :: IO ()
main = do
	mapM_ spawn startupApps
	xmonad =<< xmobar myConfig


myConfig = defaultConfig {
		workspaces = myworkspaces,
		terminal = "urxvt",
		manageHook = manageDocks <+> (isFullscreen --> doFullFloat) <+> manageHook defaultConfig <+> manageDocks,
		layoutHook = smartBorders . layoutHook $ defaultConfig
	} `additionalKeys` [
		((0, xF86XK_AudioLowerVolume), spawn "pactl set-sink-volume @DEFAULT_SINK@ -- -3%"),
		((0, xF86XK_AudioRaiseVolume), spawn "pactl set-sink-volume @DEFAULT_SINK@ -- +3%"),
		((0, xF86XK_AudioMute), spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")
	]


myworkspaces = ["1", "2", "3", "4", "5"]
startupApps = ["google-chrome-stable", "xset s off"]
