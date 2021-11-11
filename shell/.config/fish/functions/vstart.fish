function vstart --argument-names 'filename'
  vi --startuptime nvim.log $filename
  vi nvim.log
  rm -f nvim.log
end
