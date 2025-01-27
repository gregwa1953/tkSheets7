#! /usr/bin/env python3
#  -*- coding: utf-8 -*-
#
# GUI module generated by PAGE version 8.0
#  in conjunction with Tcl version 8.6
#    Jan 27, 2025 04:34:44 AM CST  platform: Linux

import sys
import tkinter as tk
import tkinter.ttk as ttk
from tkinter.constants import *
import os.path

_location = os.path.dirname(__file__)

import tksheet7_support

_bgcolor = "cornsilk3"
_fgcolor = "black"
_tabfg1 = "black"
_tabfg2 = "white"
_bgmode = "light"
_tabbg1 = "#d9d9d9"
_tabbg2 = "gray40"

_style_code_ran = 0


def _style_code():
    global _style_code_ran
    if _style_code_ran:
        return
    try:
        tksheet7_support.root.tk.call(
            "source", os.path.join(_location, "themes", "page-cornsilklight.tcl")
        )
    except:
        pass
    style = ttk.Style()
    style.theme_use("page-cornsilklight")
    style.configure(".", font="TkDefaultFont")
    _style_code_ran = 1


class Toplevel1:
    def __init__(self, top=None):
        """This class configures and populates the toplevel window.
        top is the toplevel containing window."""

        top.geometry("1000x733+474+501")
        top.minsize(1, 1)
        top.maxsize(4465, 1410)
        top.resizable(0, 0)
        top.title("PAGE TkSheet 7.3.2 Demo")
        top.configure(background="cornsilk3")
        top.configure(highlightbackground="cornsilk3")
        top.configure(highlightcolor="black")

        self.top = top
        self.combobox = tk.StringVar()
        self.StatusInfo2 = tk.StringVar()
        self.StatusInfo1 = tk.StringVar()
        self.StatusTime = tk.StringVar()

        _style_code()
        self.FrameButtonBar = ttk.Frame(self.top)
        self.FrameButtonBar.place(x=2, y=2, height=49, width=996)
        self.FrameButtonBar.configure(relief="sunken")
        self.FrameButtonBar.configure(borderwidth="2")
        self.FrameButtonBar.configure(relief="sunken")

        self.btnExit = ttk.Button(self.FrameButtonBar)
        self.btnExit.place(x=946, y=2, height=42, width=42)
        self.btnExit.configure(command=tksheet7_support.on_btnExit)
        photo_location = os.path.join(_location, "./graphics/system-shutdown.png")
        global _img0
        _img0 = tk.PhotoImage(file=photo_location)
        self.btnExit.configure(image=_img0)
        self.btnExit.configure(compound="left")
        self.btnExit_tooltip = ToolTip(self.btnExit, """Exit this program""")

        self.btnAbout = ttk.Button(self.FrameButtonBar)
        self.btnAbout.place(x=850, y=2, height=42, width=42)
        self.btnAbout.configure(command=tksheet7_support.on_btnAbout)
        photo_location = os.path.join(_location, "./graphics/information.png")
        global _img1
        _img1 = tk.PhotoImage(file=photo_location)
        self.btnAbout.configure(image=_img1)
        self.btnAbout.configure(compound="left")
        self.btnAbout_tooltip = ToolTip(self.btnAbout, """About""")

        self.btnLoad = ttk.Button(self.FrameButtonBar)
        self.btnLoad.place(x=709, y=2, height=42, width=42)
        self.btnLoad.configure(command=tksheet7_support.on_btnLoad)
        photo_location = os.path.join(_location, "./graphics/x-office-spreadsheet.png")
        global _img2
        _img2 = tk.PhotoImage(file=photo_location)
        self.btnLoad.configure(image=_img2)
        self.btnLoad.configure(compound="left")
        self.btnLoad_tooltip = ToolTip(self.btnLoad, """Load from Spreadsheet""")

        self.TCombobox1 = ttk.Combobox(self.FrameButtonBar)
        self.TCombobox1.place(x=360, y=13, height=25, width=180)
        self.TCombobox1.configure(font="-family {Noto Sans} -size 10")
        self.TCombobox1.configure(textvariable=self.combobox)

        self.TLabel1 = ttk.Label(self.FrameButtonBar)
        self.TLabel1.place(x=190, y=12, height=23, width=164)
        self.TLabel1.configure(font="-family {Noto Sans} -size 10")
        self.TLabel1.configure(relief="flat")
        self.TLabel1.configure(anchor="e")
        self.TLabel1.configure(text="""TkSheet Themes:""")
        self.TLabel1.configure(compound="left")

        self.FrameMain = ttk.Frame(self.top)
        self.FrameMain.place(x=2, y=52, height=625, width=995)
        self.FrameMain.configure(relief="sunken")
        self.FrameMain.configure(borderwidth="2")
        self.FrameMain.configure(relief="sunken")

        self.FrameStatus = ttk.Frame(self.top)
        self.FrameStatus.place(x=2, y=678, height=50, width=996)
        self.FrameStatus.configure(relief="sunken")
        self.FrameStatus.configure(borderwidth="2")
        self.FrameStatus.configure(relief="sunken")

        self.lblStatusInfo2 = ttk.Label(self.FrameStatus)
        self.lblStatusInfo2.place(x=420, y=3, height=43, width=414)
        self.lblStatusInfo2.configure(font="-family {Noto Sans} -size 10")
        self.lblStatusInfo2.configure(relief="sunken")
        self.lblStatusInfo2.configure(textvariable=self.StatusInfo2)
        self.StatusInfo2.set("""""")
        self.lblStatusInfo2.configure(compound="left")

        self.lblStatusInfo1 = ttk.Label(self.FrameStatus)
        self.lblStatusInfo1.place(x=4, y=3, height=43, width=414)
        self.lblStatusInfo1.configure(font="-family {Noto Sans} -size 10")
        self.lblStatusInfo1.configure(relief="sunken")
        self.lblStatusInfo1.configure(textvariable=self.StatusInfo1)
        self.StatusInfo1.set("""""")
        self.lblStatusInfo1.configure(compound="left")

        self.lblStatusTime = ttk.Label(self.FrameStatus)
        self.lblStatusTime.place(x=835, y=3, height=43, width=158)
        self.lblStatusTime.configure(font="-family {Noto Sans} -size 11")
        self.lblStatusTime.configure(relief="sunken")
        self.lblStatusTime.configure(anchor="center")
        self.lblStatusTime.configure(textvariable=self.StatusTime)
        self.StatusTime.set("""""")
        self.lblStatusTime.configure(compound="left")


class FormAbout:
    def __init__(self, top=None):
        """This class configures and populates the toplevel window.
        top is the toplevel containing window."""

        top.geometry("720x450+620+601")
        top.minsize(1, 1)
        top.maxsize(4465, 1410)
        top.resizable(0, 0)
        top.title("About")
        top.configure(background="cornsilk3")
        top.configure(highlightbackground="cornsilk3")
        top.configure(highlightcolor="black")

        self.top = top
        self.MessageData = tk.StringVar()

        self.Label1 = tk.Label(self.top)
        self.Label1.place(x=535, y=50, height=273, width=179)
        self.Label1.configure(activebackground="#d9d9d9")
        self.Label1.configure(anchor="w")
        self.Label1.configure(background="cornsilk3")
        self.Label1.configure(compound="left")
        self.Label1.configure(disabledforeground="#9a9685")
        self.Label1.configure(font="-family {Noto Sans} -size 14")
        self.Label1.configure(highlightbackground="cornsilk3")
        photo_location = os.path.join(
            _location, "./graphics/computergeek transback250x177.png"
        )
        global _img3
        _img3 = tk.PhotoImage(file=photo_location)
        self.Label1.configure(image=_img3)

        self.Message1 = tk.Message(self.top)
        self.Message1.place(x=20, y=30, height=343, width=520)
        self.Message1.configure(background="cornsilk3")
        self.Message1.configure(borderwidth="2")
        self.Message1.configure(font="-family {DejaVu Sans} -size 10")
        self.Message1.configure(highlightbackground="cornsilk3")
        self.Message1.configure(padx="1")
        self.Message1.configure(pady="1")
        self.Message1.configure(relief="ridge")
        self.Message1.configure(text="""Message""")
        self.Message1.configure(textvariable=self.MessageData)
        self.MessageData.set("""Message""")
        self.Message1.configure(width=500)

        _style_code()
        self.btnAboutDismiss = ttk.Button(self.top)
        self.btnAboutDismiss.place(x=311, y=390, height=29, width=98)
        self.btnAboutDismiss.configure(command=tksheet7_support.on_btnAboutDismiss)
        self.btnAboutDismiss.configure(text="""Dismiss""")
        self.btnAboutDismiss.configure(compound="left")
        self.btnAboutDismiss.configure(cursor="fleur")


from time import time, localtime, strftime


class ToolTip(tk.Toplevel):
    """Provides a ToolTip widget for Tkinter."""

    def __init__(self, wdgt, msg=None, msgFunc=None, delay=0.5, follow=True):
        self.wdgt = wdgt
        self.parent = self.wdgt.master
        tk.Toplevel.__init__(self, self.parent, bg="black", padx=1, pady=1)
        self.withdraw()
        self.overrideredirect(True)
        self.msgVar = tk.StringVar()
        if msg is None:
            self.msgVar.set("No message provided")
        else:
            self.msgVar.set(msg)
        self.msgFunc = msgFunc
        self.delay = delay
        self.follow = follow
        self.visible = 0
        self.lastMotion = 0
        self.msg = tk.Message(
            self,
            textvariable=self.msgVar,
            bg=_bgcolor,
            fg=_fgcolor,
            font="TkDefaultFont",
            aspect=1000,
        )
        self.msg.grid()
        self.wdgt.bind("<Enter>", self.spawn, "+")
        self.wdgt.bind("<Leave>", self.hide, "+")
        self.wdgt.bind("<Motion>", self.move, "+")

    def spawn(self, event=None):
        self.visible = 1
        self.after(int(self.delay * 1000), self.show)

    def show(self):
        if self.visible == 1 and time() - self.lastMotion > self.delay:
            self.visible = 2
        if self.visible == 2:
            self.deiconify()

    def move(self, event):
        self.lastMotion = time()
        if self.follow is False:
            self.withdraw()
            self.visible = 1
        self.geometry("+%i+%i" % (event.x_root + 20, event.y_root - 10))
        try:
            self.msgVar.set(self.msgFunc())
        except:
            pass
        self.after(int(self.delay * 1000), self.show)

    def hide(self, event=None):
        self.visible = 0
        self.withdraw()

    def update(self, msg):
        self.msgVar.set(msg)

    def configure(self, **kwargs):
        backgroundset = False
        foregroundset = False
        # Get the current tooltip text just in case the user doesn't provide any.
        current_text = self.msgVar.get()
        # to clear the tooltip text, use the .update method
        if "debug" in kwargs.keys():
            debug = kwargs.pop("debug", False)
            if debug:
                for key, value in kwargs.items():
                    print(f"key: {key} - value: {value}")
        if "background" in kwargs.keys():
            background = kwargs.pop("background")
            backgroundset = True
        if "bg" in kwargs.keys():
            background = kwargs.pop("bg")
            backgroundset = True
        if "foreground" in kwargs.keys():
            foreground = kwargs.pop("foreground")
            foregroundset = True
        if "fg" in kwargs.keys():
            foreground = kwargs.pop("fg")
            foregroundset = True

        fontd = kwargs.pop("font", None)
        if "text" in kwargs.keys():
            text = kwargs.pop("text")
            if (text == "") or (text == "\n"):
                text = current_text
            else:
                self.msgVar.set(text)
        reliefd = kwargs.pop("relief", "flat")
        justifyd = kwargs.pop("justify", "left")
        padxd = kwargs.pop("padx", 1)
        padyd = kwargs.pop("pady", 1)
        borderwidthd = kwargs.pop("borderwidth", 2)
        wid = self.msg  # The message widget which is the actual tooltip
        if backgroundset:
            wid.config(bg=background)
        if foregroundset:
            wid.config(fg=foreground)
        wid.config(font=fontd)
        wid.config(borderwidth=borderwidthd)
        wid.config(relief=reliefd)
        wid.config(justify=justifyd)
        wid.config(padx=padxd)
        wid.config(pady=padyd)


#                   End of Class ToolTip


def start_up():
    tksheet7_support.main()


if __name__ == "__main__":
    tksheet7_support.main()
