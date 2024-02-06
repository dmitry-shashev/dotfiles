return {
    'numToStr/Comment.nvim',
    opts = {
      toggler = {
        line = ';c',
      },
      opleader = {
        line = ';c',
      },
      post_hook = function()
        vim.cmd('norm! j')
      end
    },
    lazy = false,
}
