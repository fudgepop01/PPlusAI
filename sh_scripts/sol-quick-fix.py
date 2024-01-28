import subprocess
import glob

ffmpeg = "/usr/local/bin/ffmpeg"


# ffmpeg -err_detect ignore_err -i video.mkv -c copy video_fixed.mkv

import subprocess

ffmpeg = "/usr/local/bin/ffmpeg"

def grabUserInput():

    def filterInput(message, default):
        user_input = input (message)

        if user_input == "":
            user_input = default
        return user_input

    print("Hit enter for default values\n")

    user_input_dict = {}

    user_input_dict["input_folder"] = filterInput("Input Folder: ", "")
    user_input_dict["output_folder"] = filterInput("Output Folder (default = ./out): ", "./out")

    return user_input_dict

def buildFFmpegCommand():

    final_user_input = grabUserInput()
    if final_user_input["input_folder"] == "":
      return False
        
    # mp4 mkv 
    files = glob.glob(final_user_input["input_folder"] + "/**/*.mp4", recursive=True) + glob.glob(final_user_input["input_folder"] + "/**/*.mkv", recursive=True)
    print(files)
    return False
    # commands_list = [
    #     ffmpeg,
    #     "-err_detect",
    #     "ignore_error",
    #     "-i",
    #     final_user_input["input_folder"],
    #     "-c",
    #     "copy",
    #     final_user_input["output_folder"]
    #     ]

    # return commands_list

def runFFmpeg(commands):    

    print(commands)
    if subprocess.run(commands).returncode == 0:
        print ("FFmpeg Script Ran Successfully")
    else:
        print ("There was an error running your FFmpeg script")

cmd = buildFFmpegCommand()
if cmd:
  runFFmpeg(cmd)