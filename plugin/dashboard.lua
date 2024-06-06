local status, db = pcall(require, "dashboard")
if (not status) then return end

db.setup({
	theme = "doom",
	config = {
		week_header = {
			enable = true,
		},
	},
})
