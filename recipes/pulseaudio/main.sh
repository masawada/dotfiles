# This recipe is Linux-only
is_linux || return

package "pulseaudio"
package "pulseaudio-bluetooth"
package "pulseaudio-equalizer"
package "pavucontrol"
package "pamixer"
package "sof-firmware"
