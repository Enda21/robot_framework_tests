# robot_framework_tests

This is a test to verify that a card show up 70%/30% based on the refresh.
Using Robot Frame work.

70% red card
30% blue card

# To install webdriver
pip install webdrivermanager
webdrivermanager firefox chrome --linkpath /usr/local/bin


# Commands
*Install Pyton*
https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#python-installation

*Install Robot via Pip*
```
# Install the latest version (does not upgrade)
pip install robotframework

# Upgrade to the latest stable version
pip install --upgrade robotframework

# Upgrade to the latest version even if it is a pre-release
pip install --upgrade --pre robotframework

# Install a specific version
pip install robotframework==5.0

# Install separately downloaded package (no network connection needed)
pip install robotframework-5.0-py3-none-any.whl

# Install latest (possibly unreleased) code directly from GitHub
pip install https://github.com/robotframework/robotframework/archive/master.zip

# Uninstall
pip uninstall robotframework
```

*Run Web Application*

*Run tests*
```
cd Robot_tests   
```
```
robot -L debug redCard_blueCard.robot
```

