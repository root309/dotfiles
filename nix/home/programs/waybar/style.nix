{ 
    custom ? {
        font = "JetBrainsMono Nerd Font";
        fontsize = "12";
        primary_accent = "c0caf5";
        secondary_accent = "c0caf5";
        tertiary_accent = "c0caf5";
        background = "3b4252";
        opacity = ".98";
        cursor = "Numix-Cursor";
    },
    ... 
}:
{
  programs.waybar.style = ''
    * {
        border: none;
        border-radius: 0px;
        font-family: ${custom.font};
        font-weight: bold;
        font-size: 15px;
        min-height: 0;
        opacity: ${custom.opacity};
    }

    window#waybar {
        background: #89DCEF;
        background: linear-gradient(45deg, rgba(239, 241, 245, 0.5) 1%, rgba(174, 220, 239, 0.5) 43%, rgba(180, 190, 254, 0.5) 80%, rgba(137, 180, 250, 0.5) 100%);
        border: 1px solid #3b4252; 
    }

    #workspaces {
        background: transparent;
        /* background: linear-gradient(45deg, #89DCEF 0%, #AEDCEF 43%, #B4BEFE 80%, #89B4FA 100%); */
        background-size: 300% 300%;
        animation: gradient 20s ease infinite;
        text-shadow: 0 0 5px rgba(0, 0, 0, 0.377);
        padding: 4px 4px 4px 4px;
        border-radius: 10px;
        font-size: 15px;
        margin-top: 10px;
        margin-bottom: 10px;
        margin-right: 10px;
        margin-left: 25px;
    }

    #workspaces button {
        margin-right: 10px;
        padding-top: 3px;
        padding-bottom: 2px;
        padding-right: 7px;
        font-weight: bolder;
        color: #FFFFFF;
        background: transparent;
        text-shadow: 0 0 5px rgba(0, 0, 0, 0.377);
    } 
    #workspaces button.active {
        color: #FFFFFF;
    }

    #workspaces button.default {
        color: #AEDCEF;
    }
    @keyframes gradient {
        0% {
            background-position: 0% 50%;
        }
        50% {
            background-position: 100% 50%;
        }
        100% {
            background-position: 0% 50%;
        }
    }

    #custom-playerctl.backward, #custom-playerctl.play, #custom-playerctl.foward {
        background: transparent;
        /* background: linear-gradient(45deg, #CA9EE6 0%, #F5C2E7 43%, #B4BEFE 80%, #89B4FA 100%); */
        animation: gradient 10s ease infinite;
        font-weight: bold;
        margin: 5px 0px;
    }

    #cpu {
        background: transparent;
        /* background: #B4BEFE;
        background: linear-gradient(52deg, #B4BEFE 0%, #89DCEF 32%, #89B4FA 72%, #A6E3A1 100%); */
        background-size: 300% 300%;
        animation: gradient 20s ease infinite;
        text-shadow: 0 0 5px rgba(0, 0, 0, 0.377);
        color: #${custom.tertiary_accent};
        border-radius: 10px 10px 10px 10px;
        padding-left: 9px;
        padding-right: 9px;
        font-weight: bold;
        margin: 5px 0px;
        margin-left: 7px;
    }

    #memory {
        background: transparent;
        /* background: #B4BEFE;
        background: linear-gradient(52deg, #B4BEFE 0%, #89DCEF 32%, #89B4FA 72%, #A6E3A1 100%); */
        background-size: 300% 300%;
        animation: gradient 20s ease infinite;
        text-shadow: 0 0 5px rgba(0, 0, 0, 0.377);
        color: #${custom.tertiary_accent};
        border-radius: 10px 10px 10px 10px;
        padding-left: 9px;
        padding-right: 9px;
        font-weight: bold;
        margin: 5px 0px;
        margin-left: 7px;
    }

    #disk {
        background: transparent;
        /* background: #B4BEFE;
        background: linear-gradient(52deg, #B4BEFE 0%, #89DCEF 32%, #89B4FA 72%, #A6E3A1 100%); */
        background-size: 300% 300%;
        animation: gradient 20s ease infinite;
        text-shadow: 0 0 5px rgba(0, 0, 0, 0.377);
        color: #${custom.tertiary_accent};
        border-radius: 10px 10px 10px 10px;
        padding-left: 9px;
        padding-right: 9px;
        font-weight: bold;
        margin: 5px 0px;
        margin-left: 7px;
    }

    #tray {
        background: transparent;
        /* background-image: url('/home/yuki/Pictures/ui2.png'); */
        background-size: cover;
        text-shadow: 0 0 5px rgba(0, 0, 0, 0.377);
        color: #${custom.tertiary_accent};
        border-radius: 10px 10px 10px 10px;
        padding: 0 20px;
        font-weight: bold;
        margin: 5px 0px;
        margin-left: 7px;
        
    }

    #pulseaudio {
        background: transparent;
        /* background: #F5C2E7;
        background: linear-gradient(45deg, #CA9EE6 0%, #F5C2E7 43%, #B4BEFE 80%, #89B4FA 100%); */
        background-size: 300% 300%;
        animation: gradient 20s ease infinite;
        text-shadow: 0 0 5px rgba(0, 0, 0, 0.377);
        color: #${custom.tertiary_accent};
        border-radius: 10px 10px 10px 10px;
        padding-left: 9px;
        padding-right: 9px;
        font-weight: bold;
        margin: 5px 0px;
        margin-left: 7px;
    }

    #network {
        background: transparent;
        /* background: #F5C2E7;
        background: linear-gradient(45deg, #CA9EE6 0%, #F5C2E7 43%, #B4BEFE 80%, #89B4FA 100%); */
        background-size: 300% 300%;
        animation: gradient 20s ease infinite;
        text-shadow: 0 0 5px rgba(0, 0, 0, 0.377);
        color: #${custom.tertiary_accent};
        border-radius: 10px 10px 10px 10px;
        padding-left: 13px;
        padding-right: 9px;
        font-weight: bold;
        margin: 5px 0px;
        margin-right: 7px;
        margin-left: 7px;
    }

    #clock {
        background: transparent;
        /* background: #F5C2E7;
        background: linear-gradient(45deg, #CA9EE6 0%, #F5C2E7 43%, #B4BEFE 80%, #89B4FA 100%); */
        color: #${custom.tertiary_accent};
        background-size: 300% 300%;
        animation: gradient 20s ease infinite;
        text-shadow: 0 0 5px rgba(0, 0, 0, 0.377);
        border-radius: 10px 10px 10px 10px;
        padding-left: 13px;
        padding-right: 9px;
        font-weight: bold;
        margin: 5px 0px;
    }

    #custom-wallpaper {
        background-image: url('/home/yuki/Pictures/GFB.jpeg');
        /* background: #89DCEF;
        background: linear-gradient(45deg, #89DCEF 0%, #AEDCEF 43%, #B4BEFE 80%, #89B4FA 100%); */
        /* background-size: 300% 300%; */
        background-size: cover;
        animation: gradient 20s ease infinite;
        text-shadow: 0 0 5px rgba(0, 0, 0, 0.377);
        color: #${custom.secondary_accent};
        padding: 10px 13px;
        margin: 5px 5px 5px 5px;
        border-radius: 10px;
    }

    #custom-launcher {
        background: #89DCEF;
        background: linear-gradient(45deg, #89DCEF 0%, #AEDCEF 43%, #B4BEFE 80%, #89B4FA 100%);
        color: #eff1f5;
        text-shadow: 0 0 5px rgba(0, 0, 0, 0.377);
        /* background-image: url('/home/yuki/Pictures/GFB.jpeg'); */
        background-size: cover;
        padding: 5px 5px 5px 10px;
        margin: 5px 0px 5px 5px;
        border-radius: 10px;
        font-size: 24px;
    }

    /* #custom-playerctl.backward, */ #custom-playerctl.play/* , #custom-playerctl.foward */ {
        background: rgba(102,204,153,0);
        font-size: 22px;
    }
    /* #custom-playerctl.backward:hover, */ #custom-playerctl.play:hover/* , #custom-playerctl.foward:hover */ {
        color: #${custom.tertiary_accent};
    }
    /* #custom-playerctl.backward {
        color: #${custom.primary_accent};
        border-radius: 10px 0px 0px 10px;
        padding-left: 16px;
        margin-left: 7px;
    } */
    #custom-playerctl.play {
        color: #${custom.secondary_accent};
        text-shadow: 0 0 5px rgba(0, 0, 0, 0.377);
        padding-left: 50px;
    }
    /* #custom-playerctl.foward {
        color: #${custom.primary_accent};
        border-radius: 0px 10px 10px 0px;
        padding-right: 12px;
        margin-right: 7px;
    } */
    #custom-nowplaying {
        color: #${custom.secondary_accent};
        text-shadow: 0 0 5px rgba(0, 0, 0, 0.377);
    }
    #window {
        background: #${custom.palette.tertiary_background_hex};
        padding-left: 15px;
        padding-right: 15px;
        border-radius: 16px;
        margin-top: 5px;
        margin-bottom: 5px;
        font-weight: normal;
        font-style: normal;
    }
  '';
}

