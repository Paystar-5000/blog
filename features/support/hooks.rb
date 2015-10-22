Before do
  @browser = Watir::Browser.new
  @browser.goto "http://localhost:4567/setup"
end

After do
  sleep 3
  @browser.close
end