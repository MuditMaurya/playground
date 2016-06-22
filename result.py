from pyvirtualdisplay import Display
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

display = Display(visible=0, size=(800, 600))
display.start()
driver = webdriver.Chrome()
driver.get('http://collegecirculars.unipune.ac.in/sites/examdocs/Results/Forms/Active%20Results.aspx')
print (driver.title)
#js = driver.execute_script("return document.getElementById('titl2957-3_')")
for result in driver.find_elements_by_xpath("//*[@groupstring='%3B%23Engineering%3B%23']"):
    for element in result.find_elements_by_css_selector("*"):
        print (element.tag_name)
        print (element.text)
