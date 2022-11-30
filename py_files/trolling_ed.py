import pyautogui
from time import sleep

if __name__ == '__main__':
    while True:
        pyautogui.press('up')
        sleep(0.2)
        pyautogui.press('down')
        sleep(0.2)