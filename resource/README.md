echo "# rf-browser-robot" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/elrison-silva/rf-browser-robot.git
git push -u origin main


# Robotframework-browser com Playwright
Robot Framework deserves a browser automation solution that's designed for the 2020s.

Browser library powered by Playwright provides.

🚀 Speed, ✅ reliability and 🔬 visibility.

Conscientious assertions.
Precise and fast browser window and tab control.
Chainable selector strategies.
Good shadow DOM support.
Simple descriptors for mobile devices.
Sending HTTP requests.
See keyword documentation and our project on Github.

Join us for discussion and support at the Robot Framework forum and our GitHub issues.

🚀SPEED
Robot Framework Browser is fast! With its direct API to the browsers, designed for high performance testing, fast feedback is now only limited by the speed of the test object.

With its inovative Context concept, a clean browser session is started within a less than 10 milliseconds!

Learn more about Browser/Contexts/Pages.

Browser library is designed to run headless first and brings a ready-to-test docker image to scale your test environments with your needs.

✅RELIABILITY
Wait Until ... and Sleep keywords belong to the past.

The browser library automatically waits for the elements of the page and interacts with them when they are ready for interaction.

Flickering tests that are sometimes PASS and sometimes FAIL are drastically reduced and confidence in test automation increases!

Find real errors instead of fixing your tests...

🔬VISIBILITY
Robot Framework Browser utilizes a JavaScript based technology called Playwright. Playwright connects directly to the browsers API and has full control of the browser and its content. The Users has full access to all JavaScript object of the page and with the Execute JavaScript keyword you can directly manipulate them.

Browser has also access to the Network Traffic between page and server and gives the user the possibility to interact with the server via HTTP calls from the same browser session.

You have never been closer to your test object!

DEPENDENCIES
Library installation requires both Python and NodeJs

Install Python™
Install Node.js®
INSTALLATION
Library can be installed in two different modes, each library installation will also include browser binaries or browser binaries are managed outside of the library. Example for CI installation, where environment may contain multiple library installation, it is beneficial to manage browser binaries outside of the library installation. This will option saves disk space in the environment, because each environment contains only one set of browsers binaries. When installation is done for test case development, it is better to install browser binaries with the library.

Install library with browser binaries.

Install Browser library from PyPi with pip:
> pip install robotframework-browser
Initialize the Browser library:
> rfbrowser init
Install library when browsers binaries are installed separately to non standard location.

Install Browser library from PyPi with pip:
> pip install robotframework-browser
Initialize the Browser library and skip browsers installation:
> rfbrowser init --skip-browsers
Install browser binaries separately according Playwright instructions. Example:
> PLAYWRIGHT_BROWSERS_PATH=$HOME/pw-browsers npx playwright install
Run test with PLAYWRIGHT_BROWSERS_PATH set. Example:
> PLAYWRIGHT_BROWSERS_PATH=$HOME/pw-browsers robot path/to/test
UPDATE
The update procedure depends on which way the library is installed, with or without the browser binaries.

Update library with browser binaries.

Install Browser library from PyPi with pip:
> pip install --upgrade robotframework-browser
Clean old browser binaries and node dependencies:
> rfbrowser clean-node
Initialize the Browser library with new node dependencies:
> rfbrowser init
Update library when browsers binaries are installed separately to non standard location.

Install Browser library from PyPi with pip:
> pip install --upgrade robotframework-browser
Clean node dependencies:
> rfbrowser clean-node
Initialize the Browser library with new node dependencies:
> rfbrowser init --skip-browsers
Install browser binaries separately according Playwright instructions. Example:
> PLAYWRIGHT_BROWSERS_PATH=$HOME/pw-browsers npx playwright install
Run test with PLAYWRIGHT_BROWSERS_PATH set. Example:
> PLAYWRIGHT_BROWSERS_PATH=$HOME/pw-browsers robot path/to/test
UNINSTALL
Uninstall procedure is same for both installation way, but if browser binaries are managed separately, user must delete browser binaries manually.

Clean old browser binaries and node dependencies:
> rfbrowser clean-node
Uninstall with pip:
> pip uninstall robotframework-browser
If browser binaries are manages separately, user must delete binaries manually, example:
> rm -rf $HOME/pw-browsers

# KEYWORDS DOCS
https://marketsquare.github.io/robotframework-browser/Browser.html