*** Settings ***
Documentation    Suite description
Resource          resource.robot
*** Test Cases ***
Card Display
  Open Browser to Card Page
  A Card should be displayed
  Refresh Page and Verify How many times each Color Card Appears
  [Teardown]    Close Browser