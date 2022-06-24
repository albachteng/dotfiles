local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
  return
end

-- enables caching of lua chunks for faster loading 
impatient.enable_profile()
