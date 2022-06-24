local status_ok, gonvim = pcall(require, "go")
if not status_ok then
  return
end

gonvim.setup()
