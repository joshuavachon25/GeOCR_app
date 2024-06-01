import os

os.chdir("gd_extensions/geocr")
os.system("scons target=template_debug")
os.chdir("../..")