sendmode input
setworkingdir %a_scriptdir%

time := 0
                           ;background
              gui, background:new, -border -caption -sysmenu
              gui, background:add, button, x1910 y20 w10 h10 gclose, x
              gui, background:color, red
              gui, background:show, w%a_screenwidth% h%a_screenheight% center

                           ;green window
              gui, greenspace:new, -border -caption -sysmenu
              gui, greenspace:+ownerbackground
              gui, greenspace:color, green
                           ;popuptime
              gui, msgbox:new, -border -caption
              gui, msgbox:font, s30 w700, arial

random, rnumb, 100, 4000
goto, start

start:
  sleep, %rnumb%
  gui, greenspace:show, w%a_screenwidth% h%a_screenheight% center, green
  ifwinexist, green
  settimer, timing, 0
  settimer, clickcheck, 0
timing:
  {
   time := time + 0.001
  }

clickcheck:
  {
   getkeystate, leftclick, lbutton
   if (leftclick = "d")
    {
     settimer, timing, off
     sleep, 10
     time := (time * 10000) + 10
     sleep, 10
     gui, msgbox:add, text, gtoreload, response time around = %time%ms
     gui, msgbox:show, autosize center, plock
     ifwinexist plock
     winwaitclose, plock
     reload
    }
    return
  }
  return

f1::
exitapp
close:
exitapp

toreload:
       {
        gui, msgbox:destroy	
        reload
       }
