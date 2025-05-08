return {
  cmd = { "docker-compose-langserver", "--stdio" },
  filetypes = { "yaml", "yml" },
  root_markers = { "docker-compose.yaml", "docker-compose.yml" },
}
