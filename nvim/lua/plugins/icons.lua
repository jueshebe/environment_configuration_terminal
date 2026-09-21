local status_ok, icons = pcall(require, "nvim-web-devicons")
if not status_ok then
  return
end
icons.setup {

 override_by_filename = {
  ["dockerfile.local"] = {
    icon = "󰡨",
    name = "Dockerfile"
  },
  ["dockerfile.runtime"] = {
    icon = "󰡨",
    name = "Dockerfile"
  }
 };

  override_by_extension = {
    ["toml"] = {
      icon = "󰰤",
      color = "#81e043",
      name = "Toml"
    },
    ["tsv"] = {
      icon = " ",
      color = "#3039ff",
      name = "Tsv"
    }
 };
}
-- print(icons.get_icon("Dockerfile.runtime", ""))
-- require("nvim-web-devicons").refresh()
