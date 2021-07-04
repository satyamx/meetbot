# MeetBot — A Proxy Bot
MeetBot is an easy-to-use user-friendly proxy bot who can act as your substitute and attend online meetings or classes hosted on Microsoft Teams.

## Quick Ubuntu/Debian Installation

It only takes 3 commands to install and run MeetBot on Ubuntu/Debian:

`./ubuntu.sh && ./pip.sh`

`./server.sh`  on terminal 1

`./worker.sh` on terminal 2

Same installation has been explained below.

## Installation

### Step 0 - Cloning the repository
`git clone https://github.com/satyamx/meetbot`

`cd meetbot`

### Step 1 - Installing required packages
#### Ubuntu/Debian
The first step on Ubuntu/Debian is pretty straightforward.

`./ubuntu.sh`

Note that you need to be in the parent meetbot directory before running these scripts as they are path dependent. Running `./meetbot/ubuntu.sh` will throw errors.

#### Other Linux distributions

Manually install `chromedriver`, its dependencies and move `chromedriver` to `/usr/bin/`. The executable path in MeetBot's webdriver is `/usr/bin/chromedriver`

Also install `python3`, `python3-pip`, `python3-venv` and `redis-server`.

### Step 2 - Running script for pip packages

`./pip.sh`

Note that you need to be in the parent meetbot directory before running these scripts as they are path dependent. Running `./meetbot/pip.sh` will throw errors.

## Components and How To Use

You need to open two separate terminals and run `./server.sh` and `./worker.sh`

![Components](https://raw.githubusercontent.com/satyamx/meetbot/main/images/components.png)

### Terminal 1

Run `./server.sh` on terminal 1 and go to http://localhost:5000/, you'll be prompted to log in if you're using meetbot for the first time or have deleted data from `meetbot/database.db`.

### Terminal 2

Run `./worker.sh`  and do not close until all your tasks (lectures) have been executed.

### Note:

- None of your data (user credentials and team names) is stored anywhere on cloud. Your data is stored locally on your computer at `meetbot/database.db` and only you can access it.

- As stressed earlier, running `./meetbot/server.sh` or `./meetbot/worker.sh` will throw errors. You need to `cd` into the parent meetbot directory using `cd meetbot` before running any of these scripts.

- You can send multiple tasks, but the worker executes the tasks on first come first serve basis. Make sure you send the task to attend an 8AM lecture before the task for 10AM and so on.

- The worker and server are separate and don't depend on each other. You don't need to run both `./server.sh` and `./worker.sh` together for meetbot to work.

- You can run only the server to send a task, close the server and run the worker anytime before your first lecture starts.

- It is, however, recommended to keep the worker running while sending a task to confirm its proper functionality in real-time.

## Experimental Features (Optional)

Note that you do not need to install any of these features and are optional. Additionally, these features can potentionally show bugs.

### Running the worker in background

Install `supervisor` on your system.

Ubuntu/Debian users can do so using `sudo apt-get install supervisor`

Make sure you're in the parent meetbot directory and run the following commands to set up Celery on Supervisor

`meetbot=$(pwd)`

Download [this](https://github.com/satyamx/meetbot/blob/main/supervisor.sh) script and run the following:

`mv supervisor.sh $meetbot && cd $meetbot`<br>
`chmod 755 supervisor.sh && ./supervisor.sh`

Now go to `meetbot/two.py` and uncomment the following:

`# options.add_argument("--no-sandbox")`<br>
`# options.add_argument("--headless")`<br>
`# options.add_argument("--disable-dev-shm-usage")`<br>
`# driver.set_window_size(1280, 1440)`

This should set up your worker in background using headless mode.
