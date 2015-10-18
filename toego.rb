while line = STDIN.gets
  # {{ => <%  }} => %>
  line.gsub!(/{{/u, "<%")
  line.gsub!(/}}/u, "%>")

  # range => for range
  line.gsub!(/<%\s+range\s+\.([a-zA-Z_.]+)\s+%>/u, '<% for _, _ := range e.\1 { %>')

  # else => } else {
  line.gsub!(/<%\s*else\s*%>/u, '<% } else { %>')

  # end => }
  line.gsub!(/<%\s*end\s*%>/u, '<% } %>')

  # . => <%=
  line.gsub!(/<%\s+([.$])([a-zA-Z_.]+)\s+%>/u, '<%= \1\2 %>')

  print line
end
