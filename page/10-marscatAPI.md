# MarsCat Development manual

- Connect Display screen, mouse and keyboard.
- Connect wifi, Remote connection such as ssh, vnc.

  **Note: Account and password are both `pi`**
- MarsCat's boot-up service needs to be stopped before development

  ```
  cd ~/marsai
  ./tools/stop-systemd-services.sh
  ./tools/disable-systemd-services.sh
  ```
- If you're about to give up, restart the MarsCat's service

  ```
  cd ~/marsai
  ./tools/enable-systemd-services.sh
  ./tools/start-systemd-services.sh
  ```

## Download API

```
cd ~
git clone https://github.com/elephantrobotics/marscatAPI.git
cd marscatAPI
```

## Basic exercise

```
# file: move/movement.py
# See this file for more functions

import movement

mv = movement.MoveMent()
mv.set_walk(step = 2, speed = 0.7)
...
```

## Touch test

```
# file: sensor/touch.py

import touch

tc = touch.Touch()
tc.test_touch()
```

## Display eyes

```
# file: eye/eyedisplay.py

import eyedisplay

eyes = eyedisplay.EyeDisplay()
eyes.display_eye(ball_num = 1, lid_num = 1, ball_type = 'eye_ball', dx = 0, dy = 0)

"""
args:
    ball_num --> int:
        1~10
        # Eyeball size
    lid_num --> int:
        1~10
        # Eyelid size
    ball_type --> str:
        [eye_ball, ball, face, flip, heat, hug, teaser, voice,
                         low_power, charging, dizzy, bowlorhungry, sleep
                         high_temperature, hw_error]
        # To select which folder the picture comes from
        # eye/eyeball/
    dx,dy --> int:
        # Coordinates of eyeball
        # (0, 0) in the middle
"""
```

## Play the sound

```
# file: sound/catsound.py

import catsound

s = catsound.CatSound()
s.meow()
```

## Image Recognition

```
# file: vision/vision_base.py

import vision_base

vision = vision_base.Vision()
vision.test()
```

Faces, blue balls, matching Cat Teaser, and matching QR codes can be identified.

## Voice Recognition

```
# file: voice/voice_base.py

import voice_base
voice_base.test_voice()
```

### Select the speech recognition language

```
# file: voice/voice_base.py 28行
def speak_config(self):
    language = "Chinese"
```

### Voice wake-up

Wake-up word:

```
# file: voice/voice_base.py 142row

ACTIVATION_WORDS = [
                            'HI MARSCAT', 'MARSCAT', 'MASSCAT', 'MASKCAT', 'MARS',
                            'ASSCAT', 'MASS'
                        ]
```

```
# file: voice/voice_base.py 152row
if ff:
    Wake up successfully and enter listening mode
```

The file of **voice/corpus/**.dic  contains all the words that can be recognized in three languages
