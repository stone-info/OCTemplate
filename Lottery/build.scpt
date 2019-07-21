tell application "Xcode"
--  open "/Users/stone/git_repository/OCTemplate/OCTemplate.xcworkspace"
  set targetProject to workspace document "Lottery.xcworkspace"

--  build targetProject

	if (build targetProject) is equal to "Build succeeded" then
--		launch targetProject
	end if
end tell

--tell application "Xcode"
--	activate
--
--	set targetProject to active workspace document
--	if (run targetProject) is equal to "Build succeeded" then
--		launch targetProject
--	end if
--end tell

--tell application "Xcode"
--	activate
--	set targetProject to active workspace document
--  if (build targetProject) is equal to "Build succeeded" then
--    launch targetProject
--  end if
--end tell