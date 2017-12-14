# Reminder

## Setting up `autoenv`
* `pip install autoenv`
* `ln -s ~/$VIRTUALENV/bin/activate.sh ~/$VIRTUALENV/activate.sh`
* `source ~/.bashrc`

## Setting up environment
* `ln -s $deactivate ~/.env`
* `ln -s $activate ~/$python_dir/.env`

( For some reason, I have been unable to get `.env.leave` to work properly.  As a workaround, I am using
a modified activate script. )

