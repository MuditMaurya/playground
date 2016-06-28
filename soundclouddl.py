import sys, urllib.request
from pyvirtualdisplay import Display
from selenium import webdriver

display = Display(visible=0, size=(800, 600))
display.start()
driver = webdriver.Chrome()
driver.get("http://scdownloader.net")
element = driver.find_element_by_id("songURL")
button = driver.find_element_by_tag_name("button")
element.send_keys(sys.argv[1])
button.click()
download_button = driver.find_element_by_link_text("Download Link")
download_link = download_button.get_attribute("href")
urllib.request.urlretrieve(download_link, "./song.mp3")
