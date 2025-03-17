from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
import time
import os

# Set up options for headless Chrome
chrome_options = Options()
chrome_options.add_argument("--headless")
chrome_options.add_argument("--disable-gpu")
chrome_options.add_argument("--no-sandbox")
chrome_options.add_argument("--disable-dev-shm-usage")

# Set download directory
download_dir = os.path.join(os.getcwd(), 'downloads')
os.makedirs(download_dir, exist_ok=True)
prefs = {
    'download.default_directory': download_dir,
    'download.prompt_for_download': False,
    'download.directory_upgrade': True,
    'safebrowsing.enabled': True,
    'profile.default_content_settings.popups': 0,
    'profile.content_settings.exceptions.automatic_downloads.*.setting': 1
}
chrome_options.add_experimental_option('prefs', prefs)

# Set up Chrome driver
chrome_service = Service('/usr/bin/chromedriver')
driver = webdriver.Chrome(service=chrome_service, options=chrome_options)

try:
    # Open the locally hosted HTML5 app
    driver.get("http://localhost:8080")
    # Interact with the app (e.g., wait for 2 minutes)
    # List all entries in the directory
    while True:
        entries = os.listdir(download_dir)
        print(entries)
        if "end.png" in entries:
            break

finally:
    # Close the browser
    driver.quit()
