import subprocess

subprocess.run('scons target=template_debug platform=windows', shell=True, cwd='gd_extensions/geocr')