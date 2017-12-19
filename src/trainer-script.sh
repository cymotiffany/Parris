#!/usr/bin/env bash
# This script is what will run on the EC2 instance once it launches.
# You'll want to verify that this functions as expected before launching
# an expensive instance type with it, as simple typos can become costly
# if you're launching and terminating instances every time you have a
# bug.

# You'll want to include some kind of logging facility with this script
# in case things go wrong.

# TODO Does sudo need to be used to run any of the install/poweroff commands?

# Run setup of your training session. Your commands will invariably look different.
cd /tmp
yum install -y git
git clone https://github.com/jgreenemi/MXNet-Familiarity-Project.git
cd MXNet-Familiarity-Project
pip install -r requirements.txt

# Setup done - now run the training job.
python classifier\trainer.py

# If the script has completed, go ahead and turn off the server to eliminate any
# additional costs.
poweroff now