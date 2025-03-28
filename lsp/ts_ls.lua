return {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = {
    'javascript',
    'javascript.jsx',
    'typescript',
    'typescript.tsx',
  },
  root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' },
}
