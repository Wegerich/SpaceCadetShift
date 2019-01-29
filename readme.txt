This script gives additional functionality to shift keys as described here: http://stevelosh.com/blog/2012/10/a-modern-space-cadet/
If the shift key is tapped without being used to uppercase a key then it acts as a bracket key [(] instead. 
This is beneficial because the bracket keys are widely used in modern computing but require two coordinated keypresses to activate.

The code runs on windows using autohotkey (AHK). Autohotkey natively allows easy detection of whether shift has been used to uppercase a key. AHK does not properly detect mouse clicks while the shift key is held down, so the script detects mouse movements instead, in case shift is being used to click select an area instead of the use of click-and-drag.
Some tweaking of the settings may be needed to allow for personal preferences. For example, the script does not lend itself well to typing a few keys with one hand while moving the mouse briefly with the other.
