function loadHelpGUI()
	infoWindow = guiCreateWindow(0.2,0.2,0.6,0.5,"SANL Help",true)
  guiWindowSetMovable(infoWindow,false)
  guiWindowSetSizable(infoWindow,false)
  guiSetVisible(infoWindow,false)
  local tabPanel = guiCreateTabPanel(0, 0.05, 1, 1, true, infoWindow)
  bindKey("F9","down",toggleInfoWindow)
  
  local rulesnode = xmlLoadFile("rules.xml")
  local rulestext = xmlNodeGetValue(rulesnode)
  local tabRules = guiCreateTab("Rules",tabPanel)
  local rulesMemo = guiCreateMemo(0.02,0.04,0.94,0.94,rulestext,true,tabRules)
  guiMemoSetReadOnly(rulesMemo,true)
  xmlUnloadFile(rulesnode)
  
  local jobsnode = xmlLoadFile("jobs.xml")
  local jobstext = xmlNodeGetValue(jobsnode)
  local tabJobs = guiCreateTab("Jobs",tabPanel)
  local jobsMemo = guiCreateMemo(0.02,0.04,0.94,0.94,jobstext,true,tabJobs)
  guiMemoSetReadOnly(jobsMemo,true)
  xmlUnloadFile(jobsnode)
end
addEventHandler("onClientResourceStart",getResourceRootElement(getThisResource()),loadHelpGUI)
function toggleInfoWindow()
  if isCursorShowing() then
    showCursor(false)
  else
    showCursor(true)
  end
  state = not guiGetVisible(infoWindow)
  guiSetVisible(infoWindow,state)
end