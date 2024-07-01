<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Speaker Timeline with Countdown Timer</title>
<style>
    body {
        font-family: Arial, sans-serif;
        text-align: center;
        background-color: white;
        transition: background-color 0.5s ease;
    }
    .timer {
        font-size: 2em;
        margin-bottom: 20px;
    }
</style>
</head>
<body>
    <h1>Speaker Timeline with Countdown Timer</h1>
    <div class="timer">00:00</div>
    <button onclick="startTimer()">Start Timer</button>
    <script>
        function startTimer() {
            let totalTimeInSeconds = 2400; // 40 minutes in seconds (40 * 60)
            let timeline = [
                { speaker: 'Mario – Menu', timeInSeconds: 30 },
                { speaker: 'Mario – Introduction', timeInSeconds: 60 },
                { speaker: 'Mario – Topic', timeInSeconds: 15 },
                { speaker: 'Doro – Diet P1', timeInSeconds: 120 },
                { speaker: 'Muzhgan – Diet P2', timeInSeconds: 120 },
                { speaker: 'Muzhgan – Diet Conclusion', timeInSeconds: 20 },
                { speaker: 'Muzhgan – Topic', timeInSeconds: 15 },
                { speaker: 'Mario – Exercise P1', timeInSeconds: 120 },
                { speaker: 'Doro – Exercise P2', timeInSeconds: 120 },
                { speaker: 'Doro – Exercise Conclusion', timeInSeconds: 20 },
                { speaker: 'Doro – Topic', timeInSeconds: 15 },
                { speaker: 'Muzhgan – Stress P1', timeInSeconds: 120 },
                { speaker: 'Mario – Stress P2', timeInSeconds: 120 },
                { speaker: 'Mario – Stress Conclusion', timeInSeconds: 20 },
                { speaker: 'Doro – Conclusion', timeInSeconds: 60 },
                { speaker: 'Doro – References', timeInSeconds: 30 },
                { speaker: 'Thanks to – group', timeInSeconds: 15 },
                { speaker: 'Muzhgan – Q&A – group', timeInSeconds: 60 },
                { speaker: 'Muzhgan – Final Conclusion Q&A', timeInSeconds: 30 }
            ];

            let currentSpeakerIndex = 0;
            let timeLeft = totalTimeInSeconds;
            let timerInterval = setInterval(updateTimer, 1000);

            function updateTimer() {
                if (timeLeft <= 0) {
                    clearInterval(timerInterval);
                    document.querySelector('.timer').innerText = 'Time\'s up!';
                    return;
                }

                let minutes = Math.floor(timeLeft / 60);
                let seconds = timeLeft % 60;
                let timerDisplay = `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
                document.querySelector('.timer').innerText = timerDisplay;

                // Check timeline to display correct speaker
                let currentTime = totalTimeInSeconds - timeLeft;
                while (currentSpeakerIndex < timeline.length && currentTime >= timeline[currentSpeakerIndex].timeInSeconds) {
                    currentSpeakerIndex++;
                }

                // Change background color based on elapsed time
                if (currentTime >= 1200 && currentTime < 2100) {
                    document.body.style.backgroundColor = 'yellow'; // Change to yellow after 20 minutes
                } else if (currentTime >= 2100) {
                    document.body.style.backgroundColor = 'red'; // Change to red after 35 minutes
                }

                timeLeft--;
            }
        }
    </script>
</body>
</html>
