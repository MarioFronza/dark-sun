---
description: FFmpeg video editing commands. Cut, trim, add audio tracks, loop audio, and combine video with music. Use when the user wants to edit video with ffmpeg, add background music, cut clips, or manipulate audio/video streams.
---

# FFmpeg Video Editing

Useful commands for video editing with ffmpeg.

## 1. Download audio from Internet Archive

```bash
curl -L -o ~/Downloads/audio.mp3 "https://archive.org/download/tvtunes_632/The%20Office.mp3"
```

## 2. Check file type

```bash
file ~/Downloads/audio.mp3
```

## 3. Add an MP3 as the audio track (replaces the original audio)

```bash
ffmpeg -i video.mp4 -i audio.mp3 -c:v copy -map 0:v:0 -map 1:a:0 -shortest output.mp4
```

- `-c:v copy` → copies the video without re-encoding
- `-map 0:v:0` → uses the video from the first input
- `-map 1:a:0` → uses the audio from the second input
- `-shortest` → ends when the shorter input ends

## 4. Loop audio (repeats until the video ends)

```bash
ffmpeg -y -i video.mp4 -stream_loop -1 -i audio.mp3 -c:v copy -map 0:v:0 -map 1:a:0 -shortest output.mp4
```

- `-stream_loop -1` → repeats the audio indefinitely
- `-shortest` → stops when the video ends

## 5. Trim video (specific start and end)

```bash
ffmpeg -y -i input.mp4 -ss 00:00:08 -to 00:00:28 -c copy output.mp4
```

- `-ss 00:00:08` → starts at second 8
- `-to 00:00:28` → goes until second 28
- `-c copy` → copies without re-encoding (fast, but may show a black frame)

## 6. Trim video by duration

```bash
ffmpeg -y -i input.mp4 -ss 00:00:08 -t 20 -c copy output.mp4
```

- `-ss 00:00:08` → starts at second 8
- `-t 20` → 20 second duration

## 7. Trim video + add synced audio from the start (RECOMMENDED)

```bash
ffmpeg -y -ss 8 -t 30 -i video.mp4 -t 30 -i audio.mp3 -map 0:v -map 1:a -c:v libx264 -preset fast -crf 18 -c:a aac -b:a 128k -shortest output.mp4
```

- `-ss 8 -t 30` (before `-i video`) → trims the video starting at 8s for 30s
- `-t 30` (before `-i audio`) → takes 30s of audio starting from zero
- `-map 0:v` → uses video from the first input
- `-map 1:a` → uses audio from the second input
- `-c:v libx264 -preset fast -crf 18` → re-encodes video at good quality
- `-c:a aac -b:a 128k` → re-encodes audio as AAC 128kbps
- `-shortest` → ends when the shorter one ends

This command guarantees:
- Precise video trim (no black frame)
- Audio starts from the beginning of the MP3 file
- Perfect sync between video and audio
