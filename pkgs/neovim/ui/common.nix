{
  colorscheme = "cyberdream";

  colorschemes.cyberdream = {
    enable = true;
    settings = {
      transparent = true;
      borderless_telescope = true;
      italic_comments = true;
    };
  };

  extraConfigLua = ''
    if vim.g.neovide then
      vim.o.guifont = "monospace:h14"
      vim.g.neovide_floating_blur_amount_x = 2.0
      vim.g.neovide_floating_blur_amount_y = 2.0
      vim.g.neovide_floating_shadow = true
      vim.g.neovide_floating_z_height = 10
      vim.g.neovide_light_angle_degrees = 45
      vim.g.neovide_light_radius = 5
      vim.g.neovide_transparency = 0.7
      vim.g.neovide_hide_mouse_when_typing = true
    end
  '';
}
