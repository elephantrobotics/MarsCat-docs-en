# MarsCat 开发手册

## 开发前的准备
- 连接显示器、鼠标、键盘
- 连接wifi后，ssh、vnc等远程连接

    **注 账户和密码都是 `pi`**
- 在开发前需要停止猫咪的开机自启服务
    ```
    cd ~/marsai
    ./tools/stop-systemd-services.sh
    ./tools/disable-systemd-services.sh
    ```
- 如果你要放弃了，重启猫的服务
    ```
    cd ~/marsai
    ./tools/enable-systemd-services.sh
    ./tools/start-systemd-services.sh
    ```

## 下载API
```
cd ~
git clone https://github.com/elephantrobotics/marscatAPI.git
cd marscatAPI
```

## 基本运动
```
# file: move/movement.py
# See this file for more functions

import movement

mv = movement.MoveMent()
mv.set_walk(step = 2, speed = 0.7)
...
```

## 触摸检测
```
# file: sensor/touch.py

import touch

tc = touch.Touch()
tc.test_touch()
```


## 显示眼睛
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

## 播放声音
```
# file: sound/catsound.py

import catsound

s = catsound.CatSound()
s.meow()
```

## 图像识别
```
# file: vision/vision_base.py

import vision_base

vision = vision_base.Vision()
vision.test()
```
可以对人脸、蓝色的小球、配套的逗猫棒以及配套的二维码进行识别。


## 语音识别

```
# file: voice/voice_base.py

import voice_base
voice_base.test_voice()
```
### 选择语音识别语言
```
# file: voice/voice_base.py 28行
def speak_config(self):
    language = "Chinese"
```

### 语音唤醒

**唤醒词**：
```
# file: voice/voice_base.py 142行

ACTIVATION_WORDS = [
                            'HI MARSCAT', 'MARSCAT', 'MASSCAT', 'MASKCAT', 'MARS',
                            'ASSCAT', 'MASS', '咪咪', '小猫', '猫'
                        ]
```

```
# file: voice/voice_base.py 152行
if ff:
    唤醒成功，进入聆听模式
```
voice/corpus/***.dic的文件中包含了三种语言的所有可用于识别的词
